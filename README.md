# Slackwolf API

A Haskell API to interact with Slackwolf's DB.

## Quick Start

You'll need to install the GHC.

``` bash
$ stack setup
```

Then compile the program using Stack.

``` bash
$ stack build
```

An executable file will already be created ready for you to run.

``` bash
$ stack exec slackwolf-api
```

If you want changes in the code to appear in the server, stop the server and
then do the following:

``` bash
$ stack build
$ stack exec slackwolf-api-exe
```
