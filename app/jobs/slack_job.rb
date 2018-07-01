class SlackJob < ApplicationJob
  queue_as :default

  def perform(channel, message)
    notifier = Slack::Notifier.new ENV['SLACK_NOTIFIER_PRODUCT_USAGE_URL'],
                                   channel: channel,
                                   username: "Creatorzi"

    notifier.ping message
  end
end
