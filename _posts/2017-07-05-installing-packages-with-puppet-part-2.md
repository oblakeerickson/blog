---
layout: post
title: "Installing Packages with Puppet Part 2"
date: 2017-07-04 06:00:00
---

In my [previous post]({{ site.baseurl}}{% post_url 2017-05-20-installing-packages-with-masterless-puppet %}) we installed a single package, but if you are installing lots of packages that don't need any customization it would probably be better to wrap them all in a single module. This post will show you how to do just that.



