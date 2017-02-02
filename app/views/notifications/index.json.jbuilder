json.array! @notifications do |notification|
  # json.recipient notification.recipient
  json.id notification.id
  json.actor "You have"
  json.action "a new #{notification.action}"
  json.notifiable do #notification.notifiable
    if notification.action == "like"
    json.type "on your entry"
  elsif notification.action == "comment"
    json.type "on your entry"
  else
    json.type "your log entry"
    end
  end
  json.url wiki_path(notification)
end
