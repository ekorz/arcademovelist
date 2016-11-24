json.array!(@games) do |game|
  json.extract! game, :id, :name, :description, :year
  json.url game_url(game, format: :json)
end
