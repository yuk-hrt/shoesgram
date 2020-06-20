json.array! @shoes do |shoe|
  json.id shoe.id
  json.title shoe.title
  json.text shoe.text
  json.brand shoe.brand
  json.image shoe.image
  json.user_id shoe.user_id
  json.name shoe.user.name
  json.user_sign_in current_user
end