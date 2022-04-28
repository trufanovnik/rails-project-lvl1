# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/content_make"

module HexletCode
  class Error < StandardError; end

  def self.form_for(model, url: "#", &block)
    Tag.build('form', action: url, method: 'post') do 
      block.call Content_Builder.new(model) if block_given?
    end
  end
end
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'
puts HexletCode.form_for user do |f|
  f.input :name
  
end