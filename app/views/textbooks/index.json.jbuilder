json.array!(@textbooks) do |textbook|
  json.extract! textbook, :id, :isbn, :title, :publisher, :year, :grif, :publish_year, :pages, :textbook_type
  json.url textbook_url(textbook, format: :json)
end
