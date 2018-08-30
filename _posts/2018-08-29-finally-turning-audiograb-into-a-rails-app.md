---
layout: post
title: "Finally Turning AudioGrab Into a Rails App"
date: 2018-08-26 06:00:00
---

### 6:45

Okay today I'm finally going to make a Rails app for AudioGrab. I think creating
a cli app was a great first step, but having a rails app that I could have a
bookmarklet talk to is what I really want. The [original audiograb][orig] I made
back in 2013. My current [cli version][current] I just opened sourced.

My goal for tonight is to make the most basic rails app and get it deployed to
production. All I want it to do is have an input box for the youtube url with a
submit button. It then will take that url and download the youtube video,
convert it to mp3, and then upload it to my overcast account.

This means that I won't have user accounts yet, but maybe I can just protect it
with basic auth or something.

[orig]: https://github.com/oblakeerickson/audiograb
[curr]: https://github.com/oblakeerickson/audio_grab
