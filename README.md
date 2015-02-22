# Implementation of Ruby `strscan` module

This gems implements the `StringScanner` class from the `strscan.rb` Ruby standard library for use with RubyMotion.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-strscan'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install motion-strscan

## Implementation details

This is a pure Ruby implementation of `StringScanner` (no Cocoa apis), borrowed from the MacRuby project, with some minor modifications to handle multibyte strings correctly.

**Note:**  While Ruby uses the Oniguruma regular expression library, RubyMotion uses the ICU library on iOS/OSX, and the Java library on Andriod.  There are minor differences, particularly in the handling of `^` 

For example, ICU will match a `^` only at the beginning of the input, unless you add the `m` flag; then it will match the beginning of the line as well. In Oniguruma, `^` matches the beginning of the line by default.

So if you're porting a Ruby libary that uses regular expressions, you need to be aware of these differences.

### Supported Platforms

Bot iOS and OS X are supported targets.  Will accept contibutions for Andriod support

## Contributing

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Create new Pull Request

## License

The MIT License (MIT)

Copyright (c) 2015 digitalMoksha

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
