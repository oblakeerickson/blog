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
origin master` to pull down my license. Then I [committed][commit1] and pushed my current
changes.

Okay now its dinner time.

#### 9:17 PM

Now that I'm back from dinner and playing bed wars with my 9 year old, let's see
if we can write some rails code.

`bin/rails generate controller Links create`

Oops I probably should create the new action for my form and make that the first
page you go to. Create will handle the form submission.

Okay I just created new.html.erb and changed the route in routes.rb to `get
'links/new'.

Now I need to make my form. I'm not going to persist anything to the database
yet for this because I don't want to remember any of these links. So I'm going
to create a new Link model, but not have it inherit from active record.

So my model class is called Link and I was also going to call my value I'm
storing called link as well, but I think that will get confusing so I'm going to
just call it url.

Okay my form is working and I'm able to submit it. Now I need to hook up all the
stuff in my command line app after the form is submitted, but first I'm going to
[commit][commit2] what I have so far.

[orig]: https://github.com/oblakeerickson/audiograb
[curr]: https://github.com/oblakeerickson/audio_grab
[commit1]: https://github.com/oblakeerickson/audio_grab_app/commit/a2800d55de4a144266fa7ca98d00e547527bb9b0
[commit2]: https://github.com/oblakeerickson/audio_grab_app/commit/14b17f804f68732bd9544c358766508e8abf68e7
