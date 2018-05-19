server:
	rackup config.ru

console:
	irb -r ./config/boot.rb

sidekiq:
	bundle exec sidekiq -e $RACK_ENV -r ./config/boot.rb
