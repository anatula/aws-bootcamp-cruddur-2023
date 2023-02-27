# Week 2 — Distributed Tracing

## Class notes 

![class notes 1 of 2](./assets/week2/live-lesson-1-2.png)
![class notes 2 of 2](./assets/week2/live-lesson-notes-2-2.png)

## Git tags
List existing tags:

`git tag`

Create a new tag (lightweight):

`git tag week2`

To tag commits after you’ve moved past them:

`git tag week2 9fceb02`

By default, the git push command doesn’t transfer tags to remote servers. You will have to explicitly push tags:

`git push --tags`

To delete a local tag in the repo:

`git tag -d week2`

To delete a remote tag:

`git push origin --delete week2`

[More on git tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging)


## Percentile latency metric
When I say 99 percentile is 10ms means 99% of my requests are less than 10ms. For this calculation we need to sort all the requests, it's not simple. Is an approximation.

[Percentile Tail Latency Explained (95%, 99%) Monitor Backend performance with this metric by Hussein Nasser](https://www.youtube.com/watch?v=3JdQOExKtUY)