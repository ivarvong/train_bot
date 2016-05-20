## Train Bot

This is a simple Elixir app to play with hosting web services on Heroku. It downloads MTA train statuses from http://www.mta.info/ in [this module](https://github.com/ivarvong/train_bot/blob/master/lib/mta.ex) using HTTPoison and Floki. 

[A Plug router](https://github.com/ivarvong/train_bot/blob/master/lib/train_bot_web.ex) serves this JSON on an HTTP endpoint.

It's deployed to Heroku with [this Elixir-specific buildpack](https://github.com/HashNuke/heroku-buildpack-elixir).
