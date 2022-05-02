# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  class HtmlClass
    include HexletCode::Html
  end

  def target_object
    HtmlClass.new
  end

  def test_label
    tag = target_object.label "text", for: :job
    assert { tag == '<label for="job">text</label>' }
  end

  def test_submit
    tag = target_object.submit "Save changes", class: "btn btn-primary"
    assert { tag == '<input type="submit" name="commit" value="Save changes" class="btn btn-primary">' }
  end

  def test_input
    tag = target_object.input :job, "hexlet"
    assert { tag == '<input name="job" type="text" value="hexlet">' }
  end

  def test_textarea
    tag = target_object.input :job, "hexlet", as: :text
    assert { tag == '<textarea name="job" cols="20" rows="40">hexlet</textarea>' }
  end
end
