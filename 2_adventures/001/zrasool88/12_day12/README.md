# About 

Small command line application written for day 12 of Rubysteps challenge.
It takes an archive, extracts the archive, backups the original to a .backup file, and deletes the original. 

### I've been a bad boy again today by not using TDD. =/

# Future features

1. It should be able to accept directories
2. It should be able to look into the directory to find archives
3. Multi-level archives: It should look into the extract folder and upon finding more archives, run the command. 
4. If the archive contains an OSX .app file, it should move it to applications

# Brainstorming 

1. I can pass a directory to the ruby program. 
2. The program looks into the directory and upon finding any archive runs an extraction program
3. It should then cp the archive into a backup, delete the original, so that it doesnt unarchive it again. 
