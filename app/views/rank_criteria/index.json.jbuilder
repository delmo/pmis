json.array!(@rank_criteria) do |rank_criterium|
  json.extract! rank_criterium, :id, :criteria, :description, :weight
  json.url rank_criterium_url(rank_criterium, format: :json)
end
