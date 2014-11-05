json.array!(@monograph_authors) do |monograph_author|
  json.extract! monograph_author, :id, :monograph_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details, :pages
  json.url monograph_author_url(monograph_author, format: :json)
end
