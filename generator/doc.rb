require_relative 'md_generator'
require_relative 'example_requests'
require_relative 'header'
require_relative 'request_params'
require_relative 'request'
require_relative 'request_route'
require_relative 'resource'
require_relative 'subresource'

module Quandl
  class Doc < MdGenerator
    attr_accessor :working_dir
    attr_accessor :wikiposit_dir_name
    attr_accessor :quandl_doc_dir_name

    def initialize(data, working_dir, wikiposit_dir_name, quandl_doc_dir_name)
      @working_dir = working_dir
      @wikiposit_dir_name = wikiposit_dir_name
      @quandl_doc_dir_name = quandl_doc_dir_name
      super(data)
    end

    def doc_directory
      "#{working_dir}/#{quandl_doc_dir_name}"
    end

    def wikiposit_dir
      "#{working_dir}/#{wikiposit_dir_name}"
    end

    def wikiposit_doc_files
      @wikiposit_doc_files ||= Dir["#{wikiposit_dir}/doc/api/json/**/*.json"].map { |file| file.split('/').last }
    end

    def api_doc_order
      @api_doc_order ||= YAML.load(ERB.new(File.read("#{working_dir}/config/quandl/config.yml")).result)
    end

    def files_not_included_in_config
      files = wikiposit_doc_files - api_doc_order.values.flatten
      puts "WARNING: #{files} are not in config".yellow
    end

    def add_md_doc_section(doc_section, filename)
      children[doc_section] = Quandl::MdGenerator.new(File.read("#{doc_directory}/#{filename}"))
    end

    def parse_data(doc_section, filename, file_path)
      file = File.read(file_path)
      data = JSON.parse(file)

      # check for overrides
      override_file = "#{doc_directory}/#{doc_section}/#{filename}"
      if File.exists?(override_file)
        override_file = File.read(override_file)
        override = JSON.parse(override_file)
        data = custom_deep_merge(data, override)
      end
      data
    end

    def custom_deep_merge(default, override)
      default.deep_merge(override) do |key, default_value, override_value|
        if override_value.respond_to?(:blank) && override_value.blank?
          default_value
        elsif default_value.is_a?(Hash) && override_value.is_a?(Hash)
          default_value = default_value.deep_merge(override_value)
        elsif default_value.is_a?(Array) && override_value.is_a?(Array)
          # this is the only custom thing we are doing
          # take as many of the array's overrides as possible
          default_value.each_with_index do |_item, index|
            next unless override_value[index]

            if default_value[index].is_a?(Hash) && override_value[index].is_a?(Hash)
              default_value[index] = default_value[index].deep_merge(override_value[index])
            else
              default_value[index] = override_value[index]
            end
          end
        else
          override_value
        end
      end
    end

    def add_resource_doc_section(doc_section, filename, format, data)
      children[doc_section] ||= Quandl::Resource.new(data)
      children[doc_section].children[filename] ||= Quandl::SubResource.new(data)
      children[doc_section].children["#{filename}"].children[format] ||= Quandl::ExampleRequests.new(data, format)
      children[doc_section].children["#{filename}_route"] ||= Quandl::RequestRoute.new(data)
      children[doc_section].children["#{filename}_params"] ||= Quandl::RequestParams.new(data)
    end

    def to_markdown
      children['header'] = Quandl::Header.new
      api_doc_order.keys.each do |doc_section|
        api_doc_order[doc_section].each do |filename|
          if File.extname(filename) == '.md'
            add_md_doc_section(doc_section, filename)
          else
            [:json, :xml, :csv].each do |format|
              Dir["#{wikiposit_dir}/doc/api/#{format}/#{doc_section}/#{filename}"].each do |file_path|
                data = parse_data(doc_section, filename, file_path)
                add_resource_doc_section(doc_section, filename, format, data)
              end
            end
          end
        end
      end
      children.values.map(&:to_markdown).join("\n")
    end
  end
end
