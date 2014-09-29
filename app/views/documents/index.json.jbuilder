json.array!(@documents) do |document|
  json.extract! document, :id, :description, :owner_id, :owner_type
  json.url document_url(document, format: :json)
end
