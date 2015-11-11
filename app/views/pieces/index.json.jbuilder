json.array!(@pieces) do |piece|
  json.extract! piece, :id, :title, :description, :image
  json.url piece_url(piece, format: :json)
end
