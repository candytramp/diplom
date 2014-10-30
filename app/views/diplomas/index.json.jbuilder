json.array!(@diplomas) do |diploma|
  json.extract! diploma, :id, :name, :issue_date, :issue_organization, :year, :creator_login, :creator_data
  json.url diploma_url(diploma, format: :json)
end
