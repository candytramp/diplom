json.array!(@people) do |person|
  json.extract! person, :id, :last_name, :first_name, :second_name, :external_ids, :birthday
  json.url person_url(person, format: :json)
end
