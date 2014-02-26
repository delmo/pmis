json.array!(@relations) do |relation|
  json.extract! relation, :id, :title, :description, :justification
  json.url relation_url(relation, format: :json)
end
