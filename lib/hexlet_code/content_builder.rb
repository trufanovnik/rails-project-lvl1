# frozen_string_literal: true

require_relative "html"

module HexletCode
  # class ContentBuilder  
  #   include HexletCode::Html

  #   def initialize(model)
  #     @model = model
  #   end

    # def input(field_name, as: nil, cols: nil, rows: nil, class: nil)
    #   field_value = @model.send(field_name)
    #   label(field_name)
    #   @bufer << Tag.build("input", name: field_name.to_s, type: "text", value: field_value.to_s)
    #   add_as(field_name, cols, rows) if as
    # end

    # def label(field_name)
    #   field_value = @model.send(field_name)
    #   @bufer << Tag.build("label", for: field_name.to_s) do
    #     field_value.to_s.capitalize
    #   end
    # end

    # def submit(default = "Save")
    #   @bufer << Tag.build("input", name: "commit", type: "submit", value: default)
    # end

    # def add_as(field_name, cols, rows)
    #   field_value = @model.send(field_name)
    #   @bufer << Tag.build("textarea", cols: cols.to_s, rows: rows.to_s, name: field_name.to_s) do
    #     field_value.to_s
    #   end
    # end
  # end
end
