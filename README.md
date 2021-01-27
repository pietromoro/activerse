# Activerse
[![Gem Version](https://badge.fury.io/rb/activerse.svg)](https://badge.fury.io/rb/activerse)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/fe0e9c2138d24d10a268e72491562fec)](https://www.codacy.com/manual/pietromoro/activerse?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=pietromoro/activerse&amp;utm_campaign=Badge_Grade)

<a href="https://www.buymeacoffee.com/pietromoro" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## Usage
Run `rails generate activerse:install` to create the configuration file, as well as uncheking your `credentials.yml.enc` file from version control and adding it to the `.gitignore`. Then you can setup how you want your credentials file to look like in the initializer
file `activerse.rb` like this:

```ruby
config.credentials do
  section "Email configuration", :email do
    set :port, to: ask("Port:")
    set :email, to: ask("Email:")
    set :pwd, to: ask("Auth Token:")
  end
end
```
See the wiki for more informations.


When ready to fill your credentials run:
```bash
$ rails g activerse:fill
```

In the `config/initializers/activese.rb` file you can specify more general settings.

See the wiki or directly the initializer file for more configuration options.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'activerse'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install activerse
```

To create all necessary setup and files run:
```bash
$ rails g activerse:install
```

## Contributing
Contributions are welcome!

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
