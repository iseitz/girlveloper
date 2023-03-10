class Course < ApplicationRecord
  validates :title, :short_description, :language, :level, :price, presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  has_rich_text :description
  belongs_to :user
  # after_validation :validate_course_decription
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def to_s
    title 
  end
  
  # def validate_course_decription
  #   if self.description.nil?
  #   self.errors[:description] << ["Course description can not be blanc"] 
  #   end
  # end
end
