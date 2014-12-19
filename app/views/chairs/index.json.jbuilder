json.array!(@chairs) do |chair|
  json.extract! chair, :id, :name, :number, :department_id
  json.url chair_url(chair, format: :json)
end
