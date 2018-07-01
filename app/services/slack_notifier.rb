# Slack Notifier : 1 Juillet
# - When a user Signed In
# - When a User Upvote or Add a creator


require 'action_view'
include ActionView::Helpers::DateHelper

class SlackNotifier

  # Sign In
  def self.send_signed_notification(user_id, action)
    message = <<~TEXT
      🎉🎉🎉*[#{User.find(user_id).email}]* `just signed #{action}`
      _(#{DateTime.now.strftime("%b %e, %l:%M %p")})_
    TEXT

    SlackJob.perform_now('#product-usage', message)
  end

  def self.creator_notifier(user_id, creator_id, action)
    message = <<~TEXT
      🎉🎉🎉 - *[#{User.find(user_id).email}]* `just #{action}` *#{Creator.find(creator_id).youtube_name}*
      _(#{DateTime.now.strftime("%b %e, %l:%M %p")})_
    TEXT

    SlackJob.perform_now('#product-usage', message)
  end

end
