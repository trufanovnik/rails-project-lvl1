# frozen_string_literal: true

module HexletCode
  module Html
    METHODS = { text: :textarea, default: :input_text }.freeze

    def label(label_text, **attributes, &block)
      HexletCode::Tag.build("label", **attributes) { label_text }
    end

    def div(**attributes, &block)
      HexletCode::Tag.build "div", **attributes { block.call }
    end

    def submit(caption = "Save", **attributes)
      HexletCode::Tag.build "input", type: :submit, name: :commit, value: caption, **attributes
    end

    def input(name, value, **attributes)
      as = (attributes.delete :as) || :default
      i_method = METHODS[as]
      send i_method, name, value, **attributes
    end

    def input_text(name, value, **attributes)
      HexletCode::Tag.build "input", name: name, type: :text, value: value, **attributes
    end

    def textarea(name, value, **attributes)
      attributes = { cols: 20, rows: 40 }.merge attributes
      HexletCode::Tag.build("textarea", name: name, **attributes) { value }
    end
  end
end
