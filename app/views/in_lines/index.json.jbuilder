json.array!(@in_lines) do |in_line|
  json.extract! in_line, :id, :title, :description, :justification
  json.url in_line_url(in_line, format: :json)
end
