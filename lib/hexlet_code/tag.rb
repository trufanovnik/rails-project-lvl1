# frozen_string_literal: true

class Tag
  def self.build(name, **kwargs, &block)
    tag = []
    tag << tag_open(name, **kwargs) 
    tag << tag_block(&block) if block_given?
    tag << tag_close(name) if block_given?
    tag.join
  end

  def self.tag_open(name, **kwargs)
    kwargs.each_with_object([]) do |(k, v), array|
      @str = array << " #{k}='#{v}'"
    end
    "<#{name}#{@str.join}>"
  end
  def self.tag_close(name)
    "</#{name}>"
  end
  def self.tag_block(&block)
    "#{block.call}"
  end
end

puts Tag.build('label', for: 'email') { 'Email' }
