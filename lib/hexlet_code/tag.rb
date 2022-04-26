# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(first, **kwargs, &block)
      if kwargs.empty? && block_given?
        @tag = ["<#{first}>#{yield}</#{first}>"]
      elsif kwargs.empty?
        @tag = ["<#{first}>"]
      else
        kwargs.each_with_object([]) do |(k, v), array|
          @tag = array << " #{k}='#{v}'"
        end
        case block_given?
        when true
          @tag = ["<#{first}", @tag, ">#{yield}</#{first}>"]
        when false
          @tag = ["<#{first}", @tag, ">"]
        end
      end
      @tag.join
    end
  end
end