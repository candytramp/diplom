json.array!(@research_effort_files) do |research_effort_file|
  json.extract! research_effort_file, :id, :description, :research_effort_id
  json.url research_effort_file_url(research_effort_file, format: :json)
end
