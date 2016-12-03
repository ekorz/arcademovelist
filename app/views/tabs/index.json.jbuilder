json.array!(@moves) do |move|
  json.extract! move, :id, :name, :description, :game, :character
  json.url move_url(move, format: :json)
end
