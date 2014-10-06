json.array!(@grntis) do |grnti|
  json.extract! grnti, :id, :name, :grnti, :creator_login, :creator_data
  json.url grnti_url(grnti, format: :json)
end
