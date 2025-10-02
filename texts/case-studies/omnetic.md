# Story of Peon in Carvago

**Old flow:**
1) Push
2) CI runs for 20 minutes - 15 minutes Rector run reveals code improvement and fails a pipeline
3) Developer fixes the bug
4) Pushes & another 20 minutes of CI

**New improved flow With Peon:**
1) Push
2) CI runs for 10 minutes & succeeds, because Rector is no longer directly part of pipeline, but delegated to Peon
3) Next day there is pull request awaiting with all Rector fixes from previous day
4) It takes 2 minutes to review + merge

This way Carvago saved tens of minutes every day, for every developer in the company.  
Now, time can be spent in much better way than waiting for CI pipeline.


----------------

50 developers at a peak. 30 minutes on average saved every working day, 20 working days in a month  
= approx 30000 saved minutes (500 hours) for a company on boring developer work

With average $25 hourly rate, thanks to Peon, **estimated savings for the company are $12500 every month!** 
