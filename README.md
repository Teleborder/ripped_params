# Ripped Params

Organize all of your strong params into separated yaml files and let Ripped Params turn them into methods.

## Installation

Add this line to your application's Gemfile:

    gem 'ripped_params'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ripped_params

## Usage

Once installed use the command `ripped_params:install` to add the ripped_params folder into your lib folder along with an example YAML file

## YAML file explained

```
---
  :require: :project
  :permit:
  - :name
  - :service_id
  - :quote
  - :document_attributes:
    - :filepicker_url
    - :category_id
  - :start_at_text
```

The first key in this file `require`, is the key in the params that the strong params are going to require. In this case it would require the `project` key in the params

`params.require(:project)`

The second key in this yaml file `permit` is what is permitted to be included in the required (`project` in this case) key.

The end result of this yaml file would produce this strong param:

```
params.require(:project).permit(:name, :service_id, :quote, {:document_attributes => [:filepicker_url, :category_id]}, :start_at_text)
```

## In The Controller

In each controller you want to add a Ripped Param include the following:

`uses_ripped_params :project_params`

This will look for a file somewhere in the ripped_params directory called "project_params.yml"

You can add as many Ripped Params as you need in each controller.

Ex:

`uses_ripped_params :project_params, :project_without_ids_params, :any_other_params`

NOTE:

You can organize your folder however you please. It will find the first file in the ripped_params directory that matches the filename.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ripped_params/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Final Notes

![alt Ripped Guy](http://25.media.tumblr.com/tumblr_kvqpt2p9xd1qzo45to1_400.gif)
