# frozen_string_literal: true

module HexletCode
  class Tag
    EMPTY_TAGS = %w[area base br col embed hr img input link menuitem meta param source track a].freeze

    def self.build(tag_name, **attributes, &block)
      tag = []
      tag << tag_open(tag_name, **attributes)
      block_result = tag_block(&block) if block_given?
      tag << block_result if block_result.instance_of? String
      tag << "</#{tag_name}>" if closed_tag?(tag_name)
      tag.join
    end

    def self.tag_open(tag_name, **attributes)
      attr_string = attributes.each_with_object([]) do |(k, v), array|
        array << " #{k}=\"#{v}\""
      end.join
      "<#{tag_name}#{attr_string}>"
    end

    def self.tag_block(&block)
      block.call
    end

    def self.closed_tag?(tag_name)
      return false if EMPTY_TAGS.include? tag_name

      true
    end
  end
end
