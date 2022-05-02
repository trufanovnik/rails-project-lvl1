# frozen_string_literal: true

require "test_helper"

class TestTag < Minitest::Test
  def test_hexlet1
    target = HexletCode::Tag.build("br")
    assert { target == "<br>" }
  end

  def test_hexlet2
    tag = HexletCode::Tag.build("img", src: "path/to/image")
    assert { tag == '<img src="path/to/image">' }
  end

  def test_hexlet3
    tag = HexletCode::Tag.build("input", type: "submit", value: "Save")
    assert { tag == '<input type="submit" value="Save">' }
  end

  def test_hexlet4
    tag = HexletCode::Tag.build("label") { "Email" }
    assert { tag == "<label>Email</label>" }
  end

  def test_hexlet5
    target = HexletCode::Tag.build("label", for: "email") { "Email" }
    assert { target == '<label for="email">Email</label>' }
  end

  def test_hexlet6
    tag = HexletCode::Tag.build "div"
    assert { tag == "<div></div>" }
  end

  def test_build_returns_opening_tag
    tag_name = "a"
    target = HexletCode::Tag.build(tag_name)
    assert { target == "<#{tag_name}>" }
  end

  def test_build_executes_block
    block_flag = false
    HexletCode::Tag.build("div") { block_flag = true }
    assert block_flag, "Block should be executed"
  end

  def test_contain_string_block_result
    block_result = "block content"
    target = HexletCode::Tag.build("div") { block_result }
    assert { target == "<div>#{block_result}</div>" }
    assert(target.include?(block_result))
  end

  def test_that_build_returns_closing
    tag_name = "div"
    target = HexletCode::Tag.build(tag_name)
    assert { target == "<div></div>" }
  end

  def test_closing_tag_absent
    target = HexletCode::Tag.build("img", src: "#", alt: "image1")
    refute target.include?("</"), "Closing tag (</) should be absent in #{target}"
  end

  def test_string_block_result
    target = HexletCode::Tag.build("div") { 100 }
    assert target.include?("></")
  end
end
