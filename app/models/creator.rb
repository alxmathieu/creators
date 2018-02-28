class Creator < ApplicationRecord
  belongs_to :user
  belongs_to :batch
  has_many :upvotes
  validates :channel_url, presence: true, uniqueness: true


  # Act as Taggable
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests
end

  # ONLY FOR RUBY 5.2
  # has_many :tag_taggings, class_name: 'ActsAsTaggableOn::Tagging'
