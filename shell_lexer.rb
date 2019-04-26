require 'rouge'
module Rouge
  module Lexers
    class UnitedSates < Rouge::Lexers::Shell
      tag 'united_states'
    end
    class Canadian < Rouge::Lexers::Shell
      tag 'canadian'
    end
  end
end