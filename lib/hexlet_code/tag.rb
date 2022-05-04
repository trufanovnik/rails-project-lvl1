# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, **kwargs, &block)
      tag = []
      tag << tag_open(name)
      tag << tag_attributes(**kwargs) if kwargs
      tag << tag_block(&block) if block_given?
      tag << tag_close(name, &block)
      tag.join
    end

    def self.tag_open(name)
      "<#{name}"
    end

    def self.tag_attributes(**kwargs)
      kwargs.each_with_object([]) do |(k, v), array|
        @str = array << " #{k}=\"#{v}\""
      end
      @str&.join
    end

    def self.tag_block(&block)
      ">#{block.call}"
    end

    def self.tag_close(name, &block)
      block ? "</#{name}>" : ">"
    end
  end
end
