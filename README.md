# boolize_attr

Boolize string attributes and define accessors.

## Usage

### Before boolize

```ruby
# Model
class Job
  include ActiveModel::Model

  attr_accessor :is_running
end

# Controller
class JobsController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])

    p @job.is_running # returns String which '1' or '0' from a checkbox
    !!@job.is_running # returns always true
  end
end
```

### After boolize

```ruby
# Model
class Job
  include ActiveModel::Model

  attr_accessor :is_running
  boolize_attr_reader :is_running
end

# Controller
class JobsController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])

    p @job.is_running # returns true or false
    !!@job.is_running # returns true or false

    @job.is_running = '0'
    p @job.is_running #=> false

    @job.is_running = '1'
    p @job.is_running #=> true

    @job.is_running = nil
    p @job.is_running #=> false
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'boolize_attr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install boolize_attr

## Contributing

1. Fork it ( https://github.com/[my-github-username]/boolize_attr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
