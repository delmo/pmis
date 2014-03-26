json.array!(@rank_carts) do |rank_cart|
  json.extract! rank_cart, :id
  json.url rank_cart_url(rank_cart, format: :json)
end
