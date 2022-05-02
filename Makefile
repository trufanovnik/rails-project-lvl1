install:
	bundle install
lint:
	bundle exec rubocop lib
test:
	rake test

.PHONY: test