# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/fields_builder'
require_relative 'hexlet_code/content_builder'
require_relative 'hexlet_code/html'

module HexletCode
  class Error < StandardError; end

  def self.form_for(model, url: '#')
    field_builder = HexletCode::FieldsBuilder.new
    yield field_builder if block_given?
    field_content = field_builder.field_storage
    builder = HexletCode::ContentBuilder.new(model)
    block_content = field_content.each do |x|
      name = x[:name]
      args = x[:arguments]
      method = x[:type]
      builder.method name, **args
      builder.content
    end
    HexletCode::Tag.build('form', action: url, method: :post) { block_content }
  end
end
