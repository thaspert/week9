# Week 9

To run this Rails app on your laptop:

1. Clone this repository
1. bundle install
1. rake db:migrate rake db:seed
1. rails server

The theme of tonight's class is *Ajax*.

## ActiveRecord Details

* Multi-model joins
* Model-vs.-HTTP Security ("strong parameters")



## Introduction to Ajax

Here's my 3-step recipe for turning any form/link into an "ajax" action:

1. Add `remote: true` to the link or form tag
2. In your controller, respond to js requests
3. Create a js.erb view for your Javascript response

Rails will automatically `eval()` the Javascript in your response.
