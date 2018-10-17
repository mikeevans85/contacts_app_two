json.array! @contacts.each do |contact|
  json.name contact.name
  json.street_address contact.street_address
  json.city contact.city
  json.state contact.state
  json.zip contact.zip
  json.email contact.email
  json.phone contact.phone
  json.created_at contact.friendly_updated_at
end