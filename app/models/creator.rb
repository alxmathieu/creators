class Creator < ApplicationRecord
  # Dependency
  belongs_to :user
  belongs_to :batch
  has_many :upvotes

  # Validations
  validates :channel_url, presence: true, uniqueness: true, format: { with: /(?:https|http)\:\/\/(?:[\w]+\.)?youtube\.com\/(?:c\/|channel\/|user\/)?([a-zA-Z0-9\-]{1,})/, message: 'Channel url is invalid'}
  validates :youtube_name, presence: true
  validates :description, presence: true
  validates :video_url, presence: true, format: {with: /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/}
  validates :nb_followers, presence: true
  validates :batch, presence: true

  # Act as Taggable
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests
  # ONLY FOR RUBY 5.2
  # has_many :tag_taggings, class_name: 'ActsAsTaggableOn::Tagging'
end
