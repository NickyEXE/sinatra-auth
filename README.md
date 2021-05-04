# Intro to REST, MVC, and Forms

## MVC - Model/View/Controller

The Model-View-Controller pattern provides separation of concerns where groups of files have specific jobs and interact with each other in very defined ways
- Models - encapsulate the data specific to our application and define the logic and computation that manipulate and process that data
- Views - user-facing part of a web application - this is the only part of the app that the user interacts with directly
- Controllers - intermediary between our models and our views

A common analogy is that the Model is the Chef, the Controller is the Waiter, and the View is the menu.

This is reflected in a proper Sinatra app's file structure:

```
├── Gemfile
├── README.md
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   ├── models
│   │   └── model.rb
│   └── views
│       └── index.erb
├── config
│   └── environment.rb
├── config.ru
├── public
│   └── stylesheets
└── spec
   ├── controllers
   ├── features
   ├── models
   └── spec_helper.rb

```

## RESTful Routing

In a dissertation in 2000, Roy Fielding outlined how a well designed website behaved, with heavy reliance on the idea that the types of data that website served could be represented as "resources", and that there were specific things we normally wanted to do to each resource, namely: CREATE, READ, UPDATE, and DELETE.

- Representational State Transfer provides a way of mapping HTTP verbs ( get, post, put, delete) and CRUD actions (create, read, update, delete) together
- When we navigate from one page of our app to another, we are making a state transition, i.e. we are moving to the next state of our application
- It is a conventional pattern to follow when structuring different routes for interacting with the server
- Following RESTful convention makes it very clear what type of request each controller action will be handling

There are seven RESTful routes, broken down as Create (C), Read (R), Update (U), and Delete (D) actions:
- New: GET to display a form to create a new item (C)
- Create: POST to create a form, usually ends with a redirect (C)
- Index: GET to display a list of many items (R)
- Show: GET to display one item (R)
- Edit: GET to display a form to edit an existing item (U)
- Update: PATCH/PUT to update the item in the database, usually ends with a redirect (U)
- Delete: DELETE to delete an item in a database, usually ends with a redireect (D)

![RESTful Routes for Blogs](https://miro.medium.com/max/1750/1*M0hdLsgbzelOFuq-1BVH-g.png)
[Stolen from this Blog](https://medium.com/@shubhangirajagrawal/the-7-restful-routes-a8e84201f206)

If you ever are curious what the RESTful routes are for a specific model, use this: http://www.restular.com/

## Setting Up Your App

All controllers other than ApplicationController should have the resource pluralized, and inherit from ApplicationController rather than Sinatra::Base

```ruby

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ...

end
```

```ruby
class MovieController < ApplicationController
 ...
end
```

Include in config.ru like this:

```ruby
#config.ru

use MovieController
run ApplicationController
```
