# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/content_make"

module HexletCode
  class Error < StandardError; end

  # def self.form_for(model, url: "#", &block)
  #   block_result = block.call ContentBuilder.new(model)
  #   full_form = Tag.build("form", action: url, method: "post") do
  #     "\n\t#{block_result.join("\t")}\n"
  #   end
  #   puts full_form
  # end
end
