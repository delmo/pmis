json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :issue_id, :source_id, :department_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion, :visible, :is_risky, :not_in_line, :not_related, :not_pest
  json.url portfolio_url(portfolio, format: :json)
end
