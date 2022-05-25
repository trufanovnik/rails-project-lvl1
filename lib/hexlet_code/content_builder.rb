# frozen_string_literal: true

require_relative 'html'
module HexletCode
  class ContentBuilder
    include HexletCode::Html

    def initialize(model)
      @model = model
      @bufer = []
    end

    def input(name, attributes = {})
      value = @model.send(name)
      @bufer << label(name)
      @bufer << html_input(name, value, attributes)
    end

    def label(label_text, attributes = {}, &block)
      html_label(label_text, attributes, &block)
    end

    def submit(caption = 'Save', attributes = {})
      @bufer << html_submit(caption, attributes)
    end

    def content
      @bufer.join
    end
  end
end
