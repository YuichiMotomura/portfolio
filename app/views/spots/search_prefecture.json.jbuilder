json.array! @prefectures do |prefecture|
  json.id prefecture.id
  json.name prefecture.name
  json.ancestry prefecture.ancestry
end