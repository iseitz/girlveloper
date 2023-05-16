class Course < ApplicationRecord
  validates :title, :short_description, :language, :level, :price, presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  has_rich_text :description
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :enrollments
  # after_validation :validate_course_decription
  extend FriendlyId
  friendly_id :title, use: :slugged
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  LANGUAGES = [:"English", :"Russian", :"French", :"Bhasa Indonesian"]
  
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  
  def self.levels
    LEVELS.map { |level| [level, level] }
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["users", "enrollments"]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "title", "description", "short_description", "language", "level", "price", "user", "user_email"]
  end
  
  def to_s
    title 
  end
  
  def purchased(user)
    self.enrollments.where(user_id: [user.id], course_id: [ self.id]).empty?
  end
  
  # def validate_course_decription
  #   if self.description.nil?
  #   self.errors[:description] << ["Course description can not be blanc"] 
  #   end
  # end
end
