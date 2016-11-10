class NotificationsController < ApplicationController
  before_action :require_sign_in
  def index
    @notifications = Notification.where(recipient: current_user).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update(read_at: Time.zone.now)
    render json: {success: true}
  end
end
