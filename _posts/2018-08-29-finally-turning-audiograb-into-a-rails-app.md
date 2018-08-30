---
layout: post
title: "Finally Turning AudioGrab Into a Rails App"
date: 2018-08-26 06:00:00
---

#### 6:45

Okay today I'm finally going to make a Rails app for AudioGrab. I think creating
a cli app was a great first step, but having a rails app that I could have a
bookmarklet talk to is what I really want. The [original audiograb][orig] I made
back in 2013. My current [cli version][curr] I just opened sourced.

My goal for tonight is to make the most basic rails app and get it deployed to
production. All I want it to do is have an input box for the youtube url with a
submit button. It then will take that url and download the youtube video,
convert it to mp3, and then upload it to my overcast account.

This means that I won't have user accounts yet, but maybe I can just protect it
with basic auth or something.

#### 7:08 PM

Okay I just ran `rails new audio_grab_app` to generate my new app, ran `rails
server` to verify that it runs, and now I'm going to push it up to github.

Okay I created my public repo on github and added a license.

Then I ran `git remote add origin <repo-name>`. Followed by `git pull --rebase
origin master` to pull down my license. Then I committed and pushed my current
changes.

Okay now its dinner time.

[orig]: https://github.com/oblakeerickson/audiograb
[curr]: https://github.com/oblakeerickson/audio_grab
