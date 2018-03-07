class Batch < ApplicationRecord
  has_many :creators


  def self.current_batch
    Batch.where("status = 'active'").first
  end

  def self.last_batch
    Batch.where("number = #{Batch.current_batch.number - 1}").first
  end

  def self.next_batch
    Batch.where("number = #{Batch.current_batch.number + 1}").first
  end

  def name
    string = self.number.to_s
    return "Week " + "#" + string[4..5] + ", " + string[0..3]
  end

end
