json.array!(@departments) do |department|
  json.extract! department, :id, :full_name, :short_name
  json.url department_url(department, format: :json)
end
