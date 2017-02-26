module Storyblok
  class SetBlock < Liquid::Tag
    Syntax = /(#{Liquid::VariableSignature}+)\s*from\s+(#{Liquid::VariableSignature}+)/

    def initialize(tag_name, markup, options)
      super

      if markup =~ Syntax
        @to = $1
        @type = $2

        @attributes = {}
        markup.scan(Liquid::TagAttributes) { |key, value|
          @attributes[key] = Liquid::Variable.new(value, options)
        }
      else
        raise Liquid::SyntaxError.new 'Error in syntax. Should be: set [story] from [stories|story]'
      end
    end

    def render(context)
      val = ''
      type = @type.strip
      _attributes = {}

      @attributes.each do |key, attribute|
        _attributes[key] = attribute.render(context)
      end

      case type
      when 'stories'
        val = Story.all(_attributes)
      when 'links'
        val = State.links
      when 'datasource_entries'
        val = DatasourceEntry.all(_attributes)
      when 'story'
        val = Story.find(_attributes['id']) if _attributes['id']
      end

      context.scopes.last[@to] = val
      context.resource_limits.assign_score += assign_score_of(val)
      ''.freeze
    end

    def blank?
      true
    end

    private

    def assign_score_of(val)
      if val.instance_of?(String)
        val.length
      elsif val.instance_of?(Array) || val.instance_of?(Hash)
        sum = 1
        val.each { |child| sum += assign_score_of(child) }
        sum
      else
        1
      end
    end
  end

  Liquid::Template.register_tag('set'.freeze, Storyblok::SetBlock)
end
