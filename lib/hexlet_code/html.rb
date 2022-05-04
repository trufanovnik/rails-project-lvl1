# frozen_string_literal: true

module HexletCode
  module Html
    METHODS = { text: :textarea, default: :input_text }.freeze

    def html_label(label_text)
      HexletCode::Tag.build('label', for: label_text.to_s) { label_text.to_s.capitalize }
    end

    def html_div(**attributes, &block)
      HexletCode::Tag.build('div', **attributes) { block.call }
    end

    def html_submit(caption = 'Save', **attributes)
      HexletCode::Tag.build('input', type: :submit, name: :commit, value: caption, **attributes)
    end

    def html_input(name, value, **attributes)
      as = (attributes.delete :as) || :default
      i_method = METHODS[as]
      send i_method, name, value, **attributes
    end

    def input_text(name, value, **attributes)
      HexletCode::Tag.build('input', name: name, type: :text, value: value.to_s, **attributes)
    end

    def textarea(name, value, **attributes)
      attributes = { cols: 20, rows: 40 }.merge attributes
      HexletCode::Tag.build('textarea', **attributes, name: name) { value }
    end
  end
end
