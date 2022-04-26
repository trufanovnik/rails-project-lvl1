# frozen_string_literal: true

def name_open(tag_name)
  name_open = "<#{tag_name}"
end
def name_close(tag_name)
  name_close = "</#{tag_name}>"
end
def args(kwargs)
  kwargs.each_with_object([]) do |(k, v), array|
    str = array << " #{k}='#{v}'"
  end
end
def block(&block)
  ">#{block.call}" if block_given?
end