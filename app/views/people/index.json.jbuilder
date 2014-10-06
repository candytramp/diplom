json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :second_name, :external_ids, :birthday, :creator_login, :creator_data
  json.url person_url(person, format: :json)
end
