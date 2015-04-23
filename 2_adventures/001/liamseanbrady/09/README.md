### What I Learned Today

- APIs change. I think I have a vision in my head of TDD being a silver bullet that creates the most flexible amazing design from the off and makes coding a trivial task. I realized that the value of TDD isn't in giving you a design that never needs to change, but in giving you a safety net **that allows the design to be changed**.

- I noticed quite a few things I didn't like about the API of my [User Stories Generator](https://github.com/liamseanbrady/user-stories-generator). However, I listened to Pat's advice and focused on **turning up the good** instead of aiming for perfection. So, instead of aiming for full test coverage, I got a decent amount of test coverage on most of the business logic and then coded the executable code that makes everything work without any tests. 
  - This allowed to me to get the satisfaction of seeing my tested code actually working and doing exactly what I wanted.
  - It also allowed me to think about how I could begin to make all of the 'leftover' code testable - does it belong in any of the current classes, or does some of the code justify a brand new class being created?
  - Doing things this way was a good learning experience and gave me a chance to think about parts of the API that could be changed to make things a little cleaner.

Building this [User Stories Generator](https://github.com/liamseanbrady/user-stories-generator) is really pushing my current skills and allowing me to move beyond *understanding* Ruby to actually **using it thoughtfully in a practical application**.

Bring on Day 10!
