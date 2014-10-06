json.array!(@sources) do |source|
  json.extract! source, :id, :funding_source, :creator_login, :creator_data
  json.url source_url(source, format: :json)
end
