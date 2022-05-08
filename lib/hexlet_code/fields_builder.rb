# frozen_string_literal: true

module HexletCode
  class FieldsBuilder
    def initialize
      @storage = []
    end

    def input(name, **args)
      @storage << { type: :input, name: name, arguments: args }
    end

    def submit(**args)
      @storage << { type: :submit, arguments: args }
    end

    def field_storage
      @storage
    end
  end
end
