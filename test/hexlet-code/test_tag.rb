frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
	def test_div
		tag = HexletCode::Tag.build 'div'
		assert { tag = '<div></div>' }
	end

	def test_br
		tag = HexletCode::Tag.build 'br'
		assert { tag = 'br' }
	end

	def test_img
		tag = HexletCode::build 'img', alt: 'image_name', src: 'image_path'
		assert { tag = '<img alt="image_name" stc="image_path"' }
	end
end
