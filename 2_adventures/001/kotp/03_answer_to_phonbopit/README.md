# Notes

We run our tests and our programs from the project root.  So having the require
reflect that is not a problem in this context.  However we should probably load
in relation to that specific file somehow, or a 'known' such as project root
folder.

In order to run the file in bin, we will need to include the lib folder.

We do this by issuing the command:

    ruby -Ilib bin/hello

There are other ways as well.
From the project root, we can then issue these commands for the desired results

    ruby test/test_game.rb

Gets us this:

    Run options: --seed 51526
    
    # Running:
    
    ..
    
    Finished in 0.002303s, 868.4264 runs/s, 868.4264 assertions/s.
    
    2 runs, 2 assertions, 0 failures, 0 errors, 0 skips

and this:

    ruby -Ilib bin/hello

Will give us this:

    Hello World.
    Hello individual person!
