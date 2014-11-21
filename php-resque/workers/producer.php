<?php

require '../vendor/autoload.php';

// Redis backend, by default 6379
Resque::setBackend('localhost:6379');

$queue = 'default';
$options = array('id' => time(), 'args' => 42);
$id = Resque::enqueue($queue, 'MyJob', $options);

echo "Queued job {$id} to queue {$queue}" . PHP_EOL;
