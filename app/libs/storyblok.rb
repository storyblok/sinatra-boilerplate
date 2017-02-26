module Storyblok

  class App
    def self.client=(client)
      @client = client
    end

    def self.client
      @client
    end

    def self.cache=(cache)
      @cache = cache
    end

    def self.cache
      @cache
    end

    def self.links=(links)
      @links = links
    end

    def self.links
      @links
    end
  end

end
