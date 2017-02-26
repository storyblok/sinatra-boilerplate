module Storyblok
  module UrlFilter
    def asset_url(input)
      '/' + input
    end

    def story_url(input)
      data = Storyblok::App.links

      if not data['data']['links'][input.to_s].nil?
        '/' + data['data']['links'][input.to_s]['slug']
      else
        ''
      end
    end

    def url(input)
      unless input['linktype']
        input
      end
      if input['linktype'] == 'story'
        story_url(input['id'])
      else
        input['url']
      end
    end
  end

  Liquid::Template.register_filter(Storyblok::UrlFilter)
end
