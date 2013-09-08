json.array!(@rasberry_pis) do |rasberry_pi|
  json.extract! rasberry_pi, :ipdns, :username, :password
  json.url rasberry_pi_url(rasberry_pi, format: :json)
end
