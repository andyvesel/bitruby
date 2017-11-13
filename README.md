# Bitruby <img src="https://travis-ci.org/vbrazo/bitruby.svg?branch=master">
A bot that lets you trade cryptocurrencies in your sleep

# Roadmap MVP

 ## First part:
  - Set up the first configurations of bitruby sinatra API which should include: test suite and basic structure.
  - Endpoints to access data
  - Endpoints to buy bitcoin
  - Endpoints to sell bitcoin
 
 ### Architecture
 
 <img src="https://github.com/vbrazo/bitruby/blob/master/src/architecture%20I.png">
 
 ## Second part:
  - Set up account on Heroku and do the first deploy
  - Search about times series analysis, machine learning and ruby
  - Create the first version of the worker. The worker is responsible to make the decisions based on analysis. It's executed every 5 minutes.

 ### Architecture
 
 <img src="https://github.com/vbrazo/bitruby/blob/master/src/architecture%20II%20-%20worker.png">
  
 ## Third part:
- Build a dashboard that displays:
  - the amount of money you have
  - what your growth rate was in the last 24 hours
  - your current portfolio
  
 ### Wireframe
 
 <img src="https://github.com/vbrazo/bitruby/blob/master/src/wireframe.png">
  
