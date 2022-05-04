# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @user = User.new name: "rob", job: "hexlet", gender: "m"
  end

  def test_make_tag
    tag1 = HexletCode::Tag.build("input", type: "submit", value: "Save")
    tag2 = HexletCode::Tag.build("label", for: "email") { "Email" }
    tag3 = HexletCode::Tag.build("div")
    assert_equal tag1, "<input type=\"submit\" value=\"Save\">"
    assert_equal tag2, "<label for=\"email\">Email</label>"
    assert { tag3 == "<div></div>" }
  end

  def test_form_for_return_string_result
    tag = HexletCode.form_for nil do |f|
    end
    assert_instance_of(String, tag)
  end

  def test_hexlet1
    user = nil
    tag = HexletCode.form_for user do |f|
    end
    assert { tag == '<form action="#" method="post"></form>' }
  end

  def test_hexlet2
    user = nil
    tag = HexletCode.form_for user, url: "/users" do |f|
    end
    assert { tag == '<form action="/users" method="post"></form>' }
  end

  # def test_hexlet3
  #   tag = HexletCode.form_for @user do |f|
  #     f.input :name
  #     f.input :job, as: :text
  #   end
  #   assert { tag == '<form action=\"#\" method=\"post\"><label for=\"name\">Name</label>
  # <input name="name" type="text" value="rob">''<textarea cols="20" rows="40" name="job">hexlet</textarea></form>' }
  # end
end
