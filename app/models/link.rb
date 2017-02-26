require 'rest-client'

class Link
  def self.all params = {}
    self.get(params)
  end

  def self.get params = {}
    Storyblok::App.client.links(params)
  end
end
