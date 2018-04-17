class Creator < ApplicationRecord
  # Dependency
  belongs_to :user
  belongs_to :batch
  has_many :upvotes, dependent: :destroy

  PATTERN_VIDEO = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/
  PATTERN_CHANNEL = /(?:https|http)\:\/\/(?:[\w]+\.)?youtube\.com\/((?:c\/|channel\/|user\/))?([a-zA-Z0-9\-\_]{1,})/

  def video_youtube_id
    regex = self.video_url.match(PATTERN_VIDEO)
    youtube_id = regex[1]
    return youtube_id
  end

  def self.find_all_languages
    array = []
    self.all.each do |creator|
      array << creator.language if !(array.include? creator.language)
    end
    return array
  end

  # For activeAdmin

  def name
    "#{id} - #{youtube_name}"
  end



  # Avatar Photo
  mount_uploader :avatar_photo, PhotoUploader

  # Validations
  validates :channel_url, presence: true,
    uniqueness: { message: 'This creator has already been proposed' },
    format: { with: PATTERN_CHANNEL, message: 'Channel url is invalid' }
  validates :youtube_name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :video_url, presence: true,
    format: {with: PATTERN_VIDEO }
  validates :nb_followers, presence: true
  validates :batch, presence: true
  validates :language, presence: true


  # Act as Taggable
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests
  # ONLY FOR RUBY 5.2
  # has_many :tag_taggings, class_name: 'ActsAsTaggableOn::Tagging'

  # Scope
  scope :ordered_upvotes, -> { joins("LEFT OUTER JOIN upvotes ON creators.id = upvotes.creator_id").group("creators.id").order('count(upvotes.id) DESC')}

end

