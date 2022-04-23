# frozen_string_literal: true

require_relative "hexlet_code/version"
require 'nokogiri'
require 'erb'



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
# p HexletCode::Tag.build('br')
# p HexletCode::Tag.build('img', src: 'path/to/image')
p (HexletCode::Tag.build('input', type: 'submit', value: 'Save'))
# p HexletCode::Tag.build('label') { 'Email' }
# p HexletCode::Tag.build('label', for: 'email') { 'Email' }
# p HexletCode::Tag.build('div'){}
# # <br>
# # <img src="path/to/image">
# # <input type="submit" value="Save">
# # <label>Email</label>
# # <label for="email">Email</label>
# # <div></div>