json.array!(@singlescenes) do |singlescene|
  json.extract! singlescene, :slot
  json.url singlescene_url(singlescene, format: :json)
end
