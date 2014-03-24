# motion-launchpad
Provides a simple DSL to easily schedule events, on the 1st, 3rd, 500th, or every launch.  This gem requires [RubyMotion](http://www.rubymotion.com).

## Installation

Add the following to your project's Gemfile to work with bundler:

```ruby
gem 'motion-launchpad'
```

Install with bundler:

```shell
bundle install
```

## Using

After installation, you can use the gem in your project like so:

```ruby
class AppDelegate
  def application(app, didFinishLaunchingWithOptions: options)

    setup_schedule
    Motion::Launchpad.run!
  end

  private

  def setup_schedule
    Motion::Launchpad.configure do |config|
      config.on :every do
        # maybe track app launch with analytics?
      end

      config.on 1 do
        # first launch, maybe show user a tutorial?
      end
    end
  end

  # You can call `configure` multiple times
  Motion::Launchpad.configure do |config|
    config.on 5 do
      # ask user to rate your app? Hate doing that, but best I could come up with
    end
  end
end
```
