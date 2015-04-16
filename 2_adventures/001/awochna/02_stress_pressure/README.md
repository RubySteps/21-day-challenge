# Stress Pressure Tracker #

Something I built to keep track of some my current stress level.
This data helps to decide whether having to go to that extra meeting will make me feel more stressed about upcoming deadlines, or if I should reconsider taking on that new project.
I make one recording each day, or when I feel it changes, listed as a percent, where 100% is stressed, but productive.
More than 100% means that stress is so much that it is actually distracting and, thus, hindering productivity.
Less than 100% means that I have things to do, but I can do it at a more leisurely pace.

The data is recorded in the pressure.yml file, keyed by the person's name (default me, alex), then by the date of the recording.
You can record more than 1 reading per day, which then gets averaged for the visual report.
There is some sample data in there for the past two days for testing and demonstration.

The program itself is run on Thor, a command line framework.
To see the help for the program, run it without any sub-commands:

    $ ./pressure

Maybe it will help you like it has helped me!
