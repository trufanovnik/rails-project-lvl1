# frozen_string_literal: true

module HexletCode
  class ContentBuilder
    def initialize(model)
      @model = model
      @result = []
    end

    def input(field_name, as: nil, cols: nil, rows: nil, class: nil)
      field_value = @model.send(field_name)
      label(field_name)
      @result << Tag.build("input", name: field_name.to_s, type: "text", value: field_value.to_s)
      @result << "\n"
      add_as(field_name, cols, rows) if as
    end

    def label(field_name)
      field_value = @model.send(field_name)
      @result << Tag.build("label", for: field_name.to_s) do
        field_value.to_s.capitalize
      end
      @result << "\n"
    end

    def submit(default = "Save")
      @result << Tag.build("input", name: "commit", type: "submit", value: default)
    end

    def add_as(field_name, cols, rows)
      field_value = @model.send(field_name)
      @result << Tag.build("textarea", cols: cols.to_s, rows: rows.to_s, name: field_name.to_s) do
        field_value.to_s
      end
      @result << "\n"
    end
    @result
  end
end
