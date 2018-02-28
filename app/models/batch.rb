class Batch < ApplicationRecord
  has_many :creators

  def self.current_batch
    current_batch = Batch.where("status = 'active'").first
    return current_batch
  end

  def self.last_batch
    Batch.where("number = #{Batch.current.number - 1}").first
  end

  def self.next_batch
    Batch.where("number = #{Batch.current.number + 1}").first
  end

end
