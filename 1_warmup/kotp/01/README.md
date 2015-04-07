# What I did to get here

I will describe the steps that got me to where I am today.

## Folder Structure

I ran this at the command line, a throw away script to create the indicated folders:

    ` ruby -e %w[01 02].each {|folder| `mkdir -p 1_warmup/kotp/#{folder}` }

It creates the following structure:

    1_warmup/kotp/
    ├── 01
    └── 02
    
    2 directories, 1 file

## Create the required README

And then I typed the following sequence:

`vi 1/k/01/<tab>README.md`

This series of events lead to me typing these things that you now read in this file.

## Share your creation

We need to push our new changes up, but under our branch (technically, as it is a separate repository, it **could** be on master, but this is better)

    git checkout -b 01_warmup
    git add 1_warmup/kotp
    git commit -v
    git push origin 01_warmup

And then we go to the web browser, to our repository, click on "Pull Requests" and then on "Create" and do the needful.

