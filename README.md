<p align="center">
  <h1 align="center">sinatra-boilerplate for Storyblok</h1>
  <p align="center">A <a href="https://www.storyblok.com" target="_blank">Storyblok</a> boilerplate in ruby with sinatra to simply start your website with us.</p>
</p>
<br>

[![GitHub release](https://img.shields.io/github/release/storyblok/sinatra-boilerplate.svg)](https://github.com/storyblok/sinatra-boilerplate/)

## What is a storyblok boilerplate
If you want to use your server or have already an existing project in which you want to integrate Storyblok you can use one of our boilerplates.

## How can I start with a boilerplate

1. `download` or `clone` this repository

```
git clone https://github.com/storyblok/sinatra-boilerplate
```

2. Install the dependencies

```
bundle install
```

3. Signup at Storyblok, create a Space and a Story with the slug "demo"

4. Run the local server and open your browser with the address localhost:4567

```
rerun --pattern '{Gemfile,Gemfile.lock,app.rb,app/**/*.rb}' 'ruby app.rb'
```

## Configuration
In the `app.rb` all you need to change is the storyblok client settings - by adding your space information. [What is a Space?](https://www.storyblok.com/docs/terminology/space):

```
token: 'Iw3XKcJb6MwkdZEwoQ9BCQtt'
```

## Start your local environment

Make sure [Ruby](https://www.ruby-lang.org) and [Bundler](http://bundler.io/) are installed:

```
bundle install
rerun --pattern '{Gemfile,Gemfile.lock,app.rb,app/**/*.rb}' 'ruby app.rb'
```


## Folder structure

- `/app/`
  The ruby application using sinatra itself.
- `/views/`
  All your layouts and components at one space - if you add a new or change an existing [Liquid](http://jinja.pocoo.org/) component (`.liquid`)
  here is the place where you would put it. If you create a headline component in storyblok - make sure to create a `headline.liquid` as well - so the application knows which component to render.
- `/public/`
  The place where your styles, scripts, images and static files are put.

## You want to know more about storyblok?

- [Prologue - Introduction](https://www.storyblok.com/docs/Prologue/Introduction)
- [Terminology - Introduction](https://www.storyblok.com/docs/terminology/introduction)
- [Content Delivery API - Introduction](https://www.storyblok.com/docs/Delivery-Api/introduction)


<br>
<br>
<p align="center">
<img src="https://a.storyblok.com/f/39898/1c9c224705/storyblok_black.svg" alt="Storyblok Logo">
</p>
