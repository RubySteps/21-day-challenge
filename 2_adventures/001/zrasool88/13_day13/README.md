#About

Finished Day 13 Challenge. The Takeaway app that I started work on Day 8 is now finished! Need to finish up the readme, create a loader file to play around with in irb and publish it to my git. I'm particularly happy that I managed to TDD everything including my implementation of the TWILIO API.

# Description

Writing a small take-away app in Ruby. The API that we'll be using the Twilio API to send text messages confirming a successful order.

# Learning Objectivs

* Employing Single Responsibility principle
* How to work with APIs in Ruby.

# Instructions

* Write an app called Takeaway.
* Implement the following functionality:
 * List of dishes with prices
 * Placing the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
 * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
* Use twilio-ruby gem to access the API
* Use a Gemfile to manage your gems
* Make sure that your Takeaway app is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
* However, if your Takeaway app is loaded into IRB and the order is placed, the text should actually be sent

# CRC

* Menu: A class with a menu HASH with name of dishes and their price as key value pairs. Dishes can be ADDED to and REMOVED from the menu.

* Order: Orders are constructed by choosing dishes from the menu. Orders are individual for each customer. Orders are comprised of the name of dishes and their quantities. Orders can be complete or incomplete.

* Dish: A class with two attributes, name and price. Dishes are LISTED on the MENU.

* Line Item: A class comprising of dishes, quantities, discounts & taxes, total.

* TakeAway: App class that brings together functionality of all the separate classes into one.

* Customer: Customer PLACES order by CHOOSING items from a menu. Customer is IDENTIFIED by NAME and CONTACT DETAILS.
