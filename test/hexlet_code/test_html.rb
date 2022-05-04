# frozen_string_literal: true

require "test_helper"

class TestHtmlCode < Minitest::Test
  class HtmlClass
    include HexletCode::Html
  end

  def target_object
    HtmlClass.new
  end

  def test_submit
    tag = target_object.html_submit "Save changes", class: "btn btn-primary"
    assert { tag == '<input type="submit" name="commit" value="Save changes" class="btn btn-primary">' }
  end

  def test_input
    tag = target_object.html_input :job, "hexlet"
    assert { tag == '<input name="job" type="text" value="hexlet">' }
  end

  def test_textarea
    tag = target_object.html_input :job, "hexlet", as: :text
    assert { tag == '<textarea cols="20" rows="40" name="job">hexlet</textarea>' }
  end
end
