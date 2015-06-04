Day 1 was all very well, but overlooked that cucumber formatters after 1.3.19
don’t output comments.  So on upgrading to 2.0.0, it does nothing at all.

But, supposing we pull up all the comments to the description block before
the first scenario, like so:

    JIRA:
	- OT-4655 (epic)
	- OT-6195 (validations)

	Hiptest:
	- https://hiptest.net/app#/projects/6907/testPlan/folders/15682/scenarios/84987 (OT-6195 #1)
	- https://hiptest.net/app#/projects/6907/testPlan/folders/15682/scenarios/84986 (OT-6195 #2)
	- https://hiptest.net/app#/projects/6907/testPlan/folders/15682/scenarios/93727 (OT-6195 #3)
	- https://hiptest.net/app#/projects/6907/testPlan/folders/15682/scenarios/93728 (OT-6195 #4a)
	- https://hiptest.net/app#/projects/6907/testPlan/folders/15682/scenarios/93729 (OT-6195 #4b)

	Todo:
	- OT-6195 #3a, #4b.i

And we know the prefix for JIRA URLs.  Can we turn all of these into links in
html-formatted output, at least?
