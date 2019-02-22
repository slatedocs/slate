using System;
using System.Collections.Generic;
using System.Linq;

namespace TSheets.CodeGenTool.CodeGen
{
    internal class RubyCodeGen : CodeGenerator
    {
        internal RubyCodeGen(string endpoint)
            : base(endpoint)
        {
        }

        internal override string GenGetCode(List<KeyValuePair<string, string>> parameters = null)
        {
            string paramsString = ParamsToUrlString(parameters);

            return $"require 'uri'" + NewLine()
                 + $"require 'net/http'" + NewLine(2)

                 + $"url = URI(\"{BaseUrl}/{this.Endpoint}{paramsString}\")" + NewLine(2)

                 + $"http = Net::HTTP.new(url.host, url.port)" + NewLine(2)

                 + $"request = Net::HTTP::Get.new(url)" + NewLine()
                 + $"request[\"Authorization\"] = 'Bearer <TOKEN>'" + NewLine(2)

                 + $"response = http.request(request)" + NewLine()
                 + "puts response.read_body";
        }

        internal override string GenPutCode()
        {
            return $"require 'uri'" + NewLine()
                 + $"require 'net/http'" + NewLine(2)

                 + $"url = URI(\"{BaseUrl}/{this.Endpoint}\")" + NewLine(2)

                 + $"http = Net::HTTP.new(url.host, url.port)" + NewLine(2)

                 + $"request = Net::HTTP::Put.new(url)" + NewLine()
                 + $"request[\"Authorization\"] = 'Bearer <TOKEN>'" + NewLine()
                 + $"request[\"Content-Type\"] = 'application/json'" + NewLine()
                 + $"request.body = \"<REQUEST BODY>\"" + NewLine(2)

                 + $"response = http.request(request)" + NewLine()
                 + $"puts response.read_body";
        }

        internal override string GenDeleteCode(List<KeyValuePair<string, string>> parameters)
        {
            string paramsString = ParamsToUrlString(parameters);

            return $"require 'uri'" + NewLine()
                 + $"require 'net/http'" + NewLine(2)

                 + $"url = URI(\"{BaseUrl}/{this.Endpoint}{paramsString}\")" + NewLine(2)

                 + $"http = Net::HTTP.new(url.host, url.port)" + NewLine(2)

                 + $"request = Net::HTTP::Delete.new(url)" + NewLine()
                 + $"request[\"Authorization\"] = 'Bearer <TOKEN>'" + NewLine(2)

                 + $"response = http.request(request)" + NewLine()
                 + "puts response.read_body";
        }

        internal override string GenPostCode()
        {
            return $"require 'uri'" + NewLine()
                 + $"require 'net/http'" + NewLine(2)

                 + $"url = URI(\"{BaseUrl}/{this.Endpoint}\")" + NewLine(2)

                 + $"http = Net::HTTP.new(url.host, url.port)" + NewLine(2)

                 + $"request = Net::HTTP::Post.new(url)" + NewLine()
                 + $"request[\"Authorization\"] = 'Bearer <TOKEN>'" + NewLine()
                 + $"request[\"Content-Type\"] = 'application/json'" + NewLine()
                 + $"request.body = \"<REQUEST BODY>\"" + NewLine(2)

                 + $"response = http.request(request)" + NewLine()
                 + $"puts response.read_body";
        }
    }
}
