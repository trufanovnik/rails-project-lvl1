# frozen_string_literal: true

module HexletCode
  class Content_Builder

    def initialize(model)
      @model = model
    end
    
    def input(field_name, as: nil)
      field = @model.send(field_name)
      Tag.build('input', name: field.to_s)
    end

    def label(field_name)
      field = @model.send(field_name)
      Tag.build('label', for: field.to_s){field.to_s.capitalize}
    end

    def submit(default = "Save")
      Tag.build('input', name: 'commit', type: 'submit', value: default)
    end

  end
end
