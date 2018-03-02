class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  LEVELS = ['Viewer', 'Basic digger', 'Advanced digger', 'Expert digger']
  LEVEL_UP_CONDITIONS = [{}, {},
                         {nb_dig: 1, upvotes_received: 10},
                         {nb_dig: 2, upvotes_received: 20}]


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :creators
  has_many :upvotes, dependent: :destroy
  validates :username, presence: true, uniqueness: true

  # Photo Uploader
  mount_uploader :avatar, PhotoUploader

  def level_name
    LEVELS[self.level]
  end

  def upvotes_received
    upvotes = 0
    self.creators.each do |creator|
      upvotes += creator.upvotes.length
    end
    return upvotes
  end

  def number_upvoted
    self.upvotes.length
  end

  def number_digged
    self.creators.length
  end

  def level_1?
    self.number_upvoted > 9
  end

  def level_2?
    self.number_digged > LEVEL_UP_CONDITIONS[2][:nb_dig] &&
      self.upvotes_received > LEVEL_UP_CONDITIONS[2][:upvotes_received]
  end

  def level_3?
    self.number_digged > LEVEL_UP_CONDITIONS[3][:nb_dig] &&
      self.upvotes_received > LEVEL_UP_CONDITIONS[3][:upvotes_received]
  end

  def update_level
    if level_3?
      self.level = 3
    elsif level_2?
      self.level = 2
    elsif level_1?
      self.level = 1
    end
    self.save
  end

  def dig_needed
    LEVEL_UP_CONDITIONS[self.level + 1][:nb_dig]
  end

  def upvotes_needed
    LEVEL_UP_CONDITIONS[self.level + 1][:upvotes_received]
  end
end
