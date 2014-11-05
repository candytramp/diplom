json.array!(@request_authors) do |request_author|
  json.extract! request_author, :id, :ois_request_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details
  json.url request_author_url(request_author, format: :json)
end
