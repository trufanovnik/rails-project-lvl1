# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  class Tag
    def self.build(first, kwargs = {}, &block)
      if kwargs.empty? && block_given?
        @smth = ["<#{first}>#{yield}</#{first}>"]
      elsif kwargs.empty?
        @smth = ["<#{first}>"]
      elsif
        kwargs.each_with_object([]) do |(k, v), array|
          @smth = array << " #{k}='#{v}'"
        end
        case block_given?
        when true
          @smth = ["<#{first}", @smth, ">#{yield}</#{first}>"]
        when false
          @smth = ["<#{first}", @smth, ">"]
        end
      end
      @smth.join
    end
  end
end