require 'ruby-thumbor'

module Storyblok
  module ImageFilter
    def resize(input, options = '')
      crypto = Thumbor::CryptoURL.new '****INSERT_TOKEN****'
      domain = '//img.storyblok.com'
      full_path = input.gsub('//a.storyblok.com/', '')
      _options = {
        :image => full_path
      }

      if !options.nil?
        if options.include? 'x'
          sizes = options.split('x')
          _options[:width] = sizes[0]
          _options[:height] = sizes[1]
        end
      end

      domain + crypto.generate(_options)
    end
  end

  Liquid::Template.register_filter(Storyblok::ImageFilter)
end
