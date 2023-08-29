class Course < ApplicationRecord
  validates :title, :short_description, :language, :level, :price, presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  validates :title, uniqueness: true
  has_rich_text :description
  belongs_to :user, counter_cache: true
  # to update the counter number run in console/server
  # User.find_each { |user| User.reset_counters(user.id, :courses) }
  has_many :sections, dependent: :destroy
  has_many :enrollments
  # after_validation :validate_course_decription
  extend FriendlyId
  friendly_id :title, use: :slugged
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  LANGUAGES = [:"English", :"Russian", :"French", :"Bhasa Indonesian"]
  
  scope :latest, -> { order(created_at: :desc).limit(5) }
  scope :top_rated, -> { order(average_rating: :desc, created_at: :desc).limit(5) }
  scope :popular, -> { order(enrollments_count: :desc, created_at: :desc).limit(5) }
  
  
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
    ["created_at", "title", "description", "short_description", "language", "level", "price", "user", "user_email", "enrollments_count", "average_rating"]
  end
  
  def to_s
    title 
  end
  
  def purchased(user)
    self.enrollments.where(user_id: [user.id], course_id: [ self.id]).empty?
  end
  
  def update_rating
    if enrollments.any? && enrollments.where.not(rating: nil).any?
      update_column :average_rating, (enrollments.average(:rating).round(2).to_f)
    else
      update_column :average_rating, (0)
    end
  end
  # def validate_course_decription
  #   if self.description.nil?
  #   self.errors[:description] << ["Course description can not be blanc"] 
  #   end
  # end
end
