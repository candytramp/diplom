json.array!(@grntis) do |grnti|
  json.extract! grnti, :id, :grnti, :name
  json.url grnti_url(grnti, format: :json)
end
