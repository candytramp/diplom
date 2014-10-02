json.array!(@licences) do |licence|
  json.extract! licence, :id, :number, :reg_date, :type, :name, :expiration_date, :req_number, :req_author, :req_object, :req_status, :reg_agency, :support, :req_priority, :reseff_name
  json.url licence_url(licence, format: :json)
end
