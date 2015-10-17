json.array! @results do |res|
  json.value res.label
  json.latitude res.location.Latitude
  json.longitude res.location.Longitude
end