json.array!(@scientific_schools) do |scientific_school|
  json.extract! scientific_school, :id, :name, :creator_login, :creator_data
  json.url scientific_school_url(scientific_school, format: :json)
end
