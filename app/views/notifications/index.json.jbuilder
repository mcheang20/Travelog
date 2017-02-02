json.array! @notifications do |notification|
  # json.recipient notification.recipient
  json.id notification.id
  json.actor "You have"
  json.action "a new #{notification.action}"
  json.notifiable do #notification.notifiable
    if notification.action == "like"
    json.type "on your #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  elsif notification.action == "comment"
    json.type "on your #{notification.action.class.to_s.underscore.humanize.downcase}"
  else
    json.type "your #{notification.notifiable.class.to_s.underscore.humanize.downcase} "
    end
  end
  json.url wiki_path(notification)
end
