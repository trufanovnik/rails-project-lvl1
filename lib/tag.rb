# frozen_string_literal: true

require_relative "tag_parse"

class Tag
  def build(name, **kwargs, &block)
    if kwargs.empty? && block_given?
      @tag = [name_open(name), block(&block), name_close(name)]
    elsif kwargs.empty?
      @tag = ["#{name_open(name)}>"]
    else
      case block_given?
      when true
        @tag = [name_open(name), args(kwargs), block(&block), name_close(name)]
      when false
        @tag = [name_open(name), args(kwargs), ">"]
      end
    end
    @tag.join
  end
end
