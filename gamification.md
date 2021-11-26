# Gamification

- Calculate how much **effective time** has PHP Mate saved you
- This amount of time can be easily recalculated into saved costs

In the end there could be badges like (will need feedback if it is good idea to distinguish junior/medior/senior or just have raw "dev hours"):

```
This month I saved you:
  79 junior dev hours
          OR
     53 dev hours
          OR
  22 senior dev hours
```

OR 

```
This month I saved you 79 hours:
That could be $1500 for junior dev OR $3500 for senior dev.
```


## How do we calculate?

There are 3 stages in PHP Mate process:

Build app | Script phase | Merge request / Post processing

We will take into account only **Script phase**, because it is the effective time it saves from a human colleague - if it was a real developer, he would probably not have to build application everytime. Skipping post-processing stage is to make it more accurate.


-------------

Maybe, according to amount of saved time, UI + design could be somehow evolving, improving, upgrading ... to make user curious how it will look next month / after PHP Mate spending next XYZ hours.
