# CLI sketching

I need to validate pull requests, and I'd like to let people validate their own...
let's see how that could work.

```bash
rs21 validate -u patmaddox -d 1 # patmaddox day 1
rs21 validate -u patmaddox -w 1 # patmaddox warmup 1
rs21 validate 2_adventures/001/patmaddox # my whole directory!
rs21 validate 2_adventures/001/patmaddox/1/ # just my first adventure
rs21 validate:warmup -u patmaddox
rs21 validate:warmup
rs21 validate:adventure -a 001 # all of adventure 001
rs21 validate:adventure -a 001 -u patmaddox
rs21 validate:pr -i 123 # pull request / issue 123...
rs21 status # check my own status
rs21 status -u patmaddox # check patmaddox status
rs21 status --all # status of everyone in the current adventure?
rs21 report
rs21 progress
```
