# frozen_string_literal: true

module HexletCode
  class FieldsBuilder
    def initialize
      @storage = []
    end

    def input(name, args = {})
      @storage << { type: :input, name: name, arguments: args }
    end

    def submit(args = {})
      @storage << { type: :submit, arguments: args }
    end

    def field_storage
      @storage
    end
  end
end
# ff = FieldsBuilder.new
# ff.input :name
# ff.input :job, as: :text
# ff.submit
# ff.field_storage
# kk = ff.field_storage
# @args = []
# kk.each do |x|
#   a = x[:arguments].each { |key, value| @args << "#{key}: :#{value}" }
# end
# bb = @args.join
