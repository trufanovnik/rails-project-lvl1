# frozen_string_literal: true

require_relative "hexlet_code/version"
require 'nokogiri'

module HexletCode
  class Error < StandardError; end
  class Tag
    def self.build(first, **kwargs, &block)
      kwargs.each_with_object([]) do |(k, v), array|
        @smth = array << " #{k}=#{v}"
      end
      "<#{first}>#{yield}</#{first}>" if block_given?
      "<#{([first] << @smth).join}>"
    end
  end
end
p HexletCode::Tag.build('label', for: 'email') { 'Email' }