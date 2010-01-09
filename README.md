grammophon
==========

nifty frontend for upcoming distributed, decentralized music management.

requirements
============

This is a ActionScript 3 Project using the Flex 4 SDK and robotlegs for mvc.
It can be build using sprout (with rake) or any Flash IDE.

usage
=====

just for the pre-early-adopters, there are lots of features missing

> gem bundle
> rake deploy

or 

> rake debug

You'll end up with a compiled `.swf` file in `public/jukebox/`.

**grammophon** comes with a built in sinatra app to serve your Flex App right out to wherever you like.

Run the sinatra app from lib/grammophon.rb

> #config.ru -- snippet
> run Grammophon::Server.new