Jcray Modules v8
===============

(Working on.)

These modules will be used on [Jcray](http://jcray.com).

## Why modules ?
Developing modules directly in a web-ui can be painfull (because Jcray is a game creation system, not an IDE ;). You can use this repo to develop your modules using your
favorite IDE.

## Issues & fixes
Users can submit issues directly in this repository, or submit their fixes using pull requests.

## Modules submission
Users can submit modules using Pull Request.

## Installing PHP libraries (using composer):
Install composer:
``` bash
$ sudo apt-get install composer
```
``` bash
$ composer install
```

## Installing assets:
Install npm and bower:
``` bash
$ sudo apt-get install npm && npm install -g bower
```
Deploying assets:
``` bash
$ bower install
```

## Runing tests
Before using your custom modules, you have to run tests. These tests will generate a "modules.auto.js" file which contains all the modules sources.
Tests are [behat](http://behat.org/en/latest/guides.html) tests.
To run tests:
``` bash
$ bin/behat modules
```

To run tests for a specific module:
``` bash
$ bin/behat modules --tags={ModuleName}
```

## Todo:
- Game side dev
- Write tests for untested modules
- Write tests for all game controllers
