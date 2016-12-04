class NotificationsController < ApplicationController
  before_action :require_sign_in
  def index
    @notifications = Notification.where(recipient: current_user).unread.order('created_at DESC')
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update read: true
    render json: {success: true}
  end
end
