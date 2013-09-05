json.array!(@scenes) do |scene|
  json.extract! scene, :name, :enabled
  json.url scene_url(scene, format: :json)
end
