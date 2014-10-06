json.array!(@nir_types) do |nir_type|
  json.extract! nir_type, :id, :name, :creator_login, :creator_data
  json.url nir_type_url(nir_type, format: :json)
end
