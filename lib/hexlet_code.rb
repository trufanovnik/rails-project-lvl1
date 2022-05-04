# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/content_builder"
require_relative "hexlet_code/html"

module HexletCode
  class Error < StandardError; end

  def self.form_for(model, url: "#", &block)
    # builder = HexletCode::ContentBuilder.new model
    # block.call builder
    # block_content = builder.content
    HexletCode::Tag.build("form", action: url, method: :post) # {block_content}
  end
end
