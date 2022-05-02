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
    # tag_1 = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    # tag_2 = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    # tag_3 = HexletCode::Tag.build('div')
    # assert_equal tag_1, "<input type=\"submit\" value=\"Save\">"
    # assert_equal tag_2, "<label for=\"email\">Email</label>"
    # assert(tag_3 = "<div>")
  end

  # def test_full_form
  #   file = File.new("/Users/nikitatrufanov/Hexlet/projects/project_1/rails-project-lvl1/lib/fixtures/test_form.erb")
  #   User = Struct.new(:name, :job, :gender, keyword_init: true)
  #   user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
  #   full_form = HexletCode.form_for user do |f|
  #     f.input :name
  #     f.input :job, as: :text, rows: 40, cols: 20
  #   end
  #   assert(full_form = file.read)
  # end

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

  def test_hexlet3
    # tag = HexletCode.form_for @user do |f|
    #   f.input :name
    #   f.input :job, as: :text
    # end
    # assert { tag == '<form action="#" method="post"><input name="name" type="text" value="rob"> '\
    # '<textarea cols="20" rows="40" name="job">hexlet</textarea></form>' }
  end
end
