require 'rest-client'

class Story
  def self.find slug
    data = self.get(slug)
    data['data']['story']
  end

  def self.all params = {}
    data = self.get(nil, params)
    {
      'total' => data['headers']['total'],
      'per_page' => data['headers']['per_page'],
      'data' => data['data']['stories']
    }
  end

  def self.get slug, params = {}
    rest_params = params.dup

    if !rest_params['filter_by'].nil?
      rest_params['filter_by'] = JSON.parse(rest_params['filter_by'])
    end

    if slug.nil?
      Storyblok::App.client.stories(rest_params)
    else
      Storyblok::App.client.story(slug, rest_params)
    end
  end
end
