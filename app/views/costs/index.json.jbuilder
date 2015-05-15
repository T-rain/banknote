json.array!(@costs) do |cost|
  json.extract! cost, :id, :title, :money
  json.url cost_url(cost, format: :json)
end
