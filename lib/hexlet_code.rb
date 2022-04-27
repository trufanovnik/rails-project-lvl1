# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

module HexletCode
  class Error < StandardError; end
  build(name, **kwargs, &block)
end

puts HexletCode::Tag.build('input', type: 'submit', value: 'Save')
