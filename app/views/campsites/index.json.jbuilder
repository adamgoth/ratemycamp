json.array!(@campsites) do |campsite|
  json.extract! campsite, :id
  json.url campsite_url(campsite, format: :json)
end
