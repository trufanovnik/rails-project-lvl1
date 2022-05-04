install:
	bundle install
lint:
	bundle exec rubocop
test:
	rake test
autocorrect:
	rubocop -a

.PHONY: test