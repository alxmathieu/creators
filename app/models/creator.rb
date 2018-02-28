class Creator < ApplicationRecord
  belongs_to :user
  belongs_to :batch
  has_many :upvotes
  validates :channel_url, presence: true, uniqueness: true

  def video_youtube_id
      pattern = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/
      regex = self.video_url.match(pattern)
      youtube_id = regex[1]
      return youtube_id

  end


  # Act as Taggable
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests
end

  # ONLY FOR RUBY 5.2
  # has_many :tag_taggings, class_name: 'ActsAsTaggableOn::Tagging'
