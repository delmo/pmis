json.array!(@pests) do |pest|
  json.extract! pest, :id, :title, :description, :justification
  json.url pest_url(pest, format: :json)
end
