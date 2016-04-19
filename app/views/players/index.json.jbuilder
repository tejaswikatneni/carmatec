json.array!(@players) do |player|
  json.extract! player, :id, :name, :score
  json.url player_url(player, format: :json)
end
