# GoogleWebfonts for Rails

A easiest way to introduce Google WebFonts to Rails application.

[![Gem Version](https://badge.fury.io/rb/google-webfonts-rails.png)](http://badge.fury.io/rb/google-webfonts-rails)

We provide an easy to use Google WebFonts Loader. See below about WebFonts Loader.

<https://developers.google.com/webfonts/docs/webfont_loader>

## Installation

Add this line to your application's Gemfile:

    gem 'google-webfonts-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google-webfonts-rails

## Usage

### Syntax

Add following code to your layout file in the `<head>` tag

    google_webfonts_init(config hash)

### Configuration

Google WebFonts:

    {
      google: ['Nunito', 'Oxygen']
    }

Adobe Typekit:

    {
      typekit: 'adobe'
    }

Ascender:

    {
      ascender: {
        testKey: ['AscenderSan:bold', 'Calibri']
      }
    }

fonts.com:

    {
      monotype: 'test'
    }

Fontdeck:

    {
      fontdeck: "xxxxx"
    }

Custom:

    {
      custom: {
        'OneFontFamily', 'http://example.com/stylesheet1.css',
        'AnotherFontFamily', 'http://example.com/stylesheet2.css'
      }
    }

The above configuration can be included at the same time.

Example:

    {
      google: ['Nunito', 'Oxygen'],
      monotype: 'test',
      custom: {
        'OneFontFamily', 'http://example.com/stylesheet1.css',
        'AnotherFontFamily', 'http://example.com/stylesheet2.css'
      }
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
