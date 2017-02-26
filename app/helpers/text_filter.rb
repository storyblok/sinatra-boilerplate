require 'kramdown'

module Storyblok
  module TextFilter
    def markdown(input)
      Kramdown::Document.new(input).to_html
    end

    def divided_by_ceil(input, operand)
      (input.to_f / operand.to_f).ceil.to_i
    end

    def json(object)
      object.to_json
    end
  end
end

Liquid::Template.register_filter(Storyblok::TextFilter)
