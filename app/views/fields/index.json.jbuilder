json.array!(@fields) do |field|
  json.extract! field, :id, :name, :code, :creator_login, :creator_data
  json.url field_url(field, format: :json)
end
