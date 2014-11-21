**Installation**
* Install [redis](http://redis.io/download) as a backend for php-resque
* Install https://github.com/chrisboulton/php-resque via `composer install`
* Make a symlink: `ln -rs vendor/chrisboulton/php-resque/resque.php bin/resque`

**Starting a worker**
* Producer: `$ cd workers && php producer.php`
* Consumer: `$ QUEUE=* APP_INCLUDE='workers/consumer.php' php bin/resque`

To read more information you can visit [this tutorial](http://goo.gl/brNIoZ)
