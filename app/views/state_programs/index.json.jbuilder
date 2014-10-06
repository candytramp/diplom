json.array!(@state_programs) do |state_program|
  json.extract! state_program, :id, :name, :creator_login, :creator_data
  json.url state_program_url(state_program, format: :json)
end
