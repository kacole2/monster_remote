json.array!(@comsettings) do |comsetting|
  json.extract! comsetting, :comport, :baud
  json.url comsetting_url(comsetting, format: :json)
end
