json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :post
  json.url blog_url(blog, format: :json)
end
