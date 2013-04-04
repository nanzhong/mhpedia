tire_url = case Rails.env
when 'production'
  ENV['FOUNDELASTICSEARCH_URL']
else
  'http://127.0.0.1:9200'
end

Tire::Configuration.url tire_url

ElasticSearchSubstring = YAML.load_file('config/elastic_search_substring.yml').with_indifferent_access
