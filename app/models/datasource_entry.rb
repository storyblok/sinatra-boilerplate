require 'rest-client'

class DatasourceEntry
  def self.all params = {}
    data = self.get(params)
    {
      'total' => data['headers']['total'],
      'per_page' => data['headers']['per_page'],
      'data' => data['data']['datasource_entries']
    }
  end

  def self.get params = {}
    Storyblok::App.client.datasource_entries(params)
  end
end
