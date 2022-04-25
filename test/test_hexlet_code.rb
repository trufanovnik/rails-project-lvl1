# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_make_tag
    tag_1 = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    tag_2 = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    tag_3 = HexletCode::Tag.build('div'){}
    assert_equal tag_1, "<input type='submit' value='Save'>"
    assert_equal tag_2, "<label for='email'>Email</label>"
    assert(tag_3 == "<div></div>")
  end
end
