json.array!(@authors) do |author|
  json.extract! author, :id, :article_id, :person_id, :old_lastname, :lecturer, :senior_lecturer, :student, :postgrad, :details, :creator_login, :creator_data
  json.url author_url(author, format: :json)
end
