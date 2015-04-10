##Bloggor
---------------------

##Introduction
---------------------
Bloggor enables one to post blogs on the internet. View it in production here:  
https://bloggor.herokuapp.com/

##Requirements
---------------------
To run this you need Ruby on Rails 4 and Postgres installed on your computer.

##Instructions
---------------------
CD into the Bloggor directory and run the following commands:
$ bundle
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ rails server

You will also need a Twilio account to use the texting features. To set that up, just set veriables for your SID, Token and phone number in a .env file in the top level directory.  

Now open a browser and go to localhost:3000 and you are blogging in style, my friend!

##Maintainer
---------------------
Dan Wright
http://danwright.co


##Copyright
---------------------
2015 Dan Wright


##License
---------------------
GPL V2
