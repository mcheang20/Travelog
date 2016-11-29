json.array! @notifications do |notification|
  # json.recipient notification.recipient
  json.id notification.id
  json.actor notification.actor.username
  json.action notification.action
  json.notifiable do #notification.notifiable
    if notification.action == "Liked"
    json.type "your #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  elsif notification.action == "Message"
    json.type "received a #{notification.action.class.to_s.underscore.humanize.downcase}"
  else
    json.type "on your #{notification.notifiable.class.to_s.underscore.humanize.downcase} "
    end
  end
  json.url wiki_path(notification)
end
