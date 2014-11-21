<?php

class MyJob
{
    public function perform()
    {
        print_r($this->args);
    }
}
