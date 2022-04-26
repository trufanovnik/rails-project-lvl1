# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "tag"

module HexletCode
  class Error < StandardError; end
  Tag.build(name, **kwargs, &block)
end
p HexletCode::Tag.build('input', type: 'submit', value: 'Save')