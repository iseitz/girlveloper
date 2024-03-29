class Course < ApplicationRecord
  validates :title, :short_description, :language, :level, :price, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :short_description, length: { maximum: 300 }
  validates :title, uniqueness: true, length: { maximum: 70 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  has_rich_text :description
  has_one_attached :preview_thumbnail
  # validates :preview_thumbnail, attached: true, content_type: [ 'image/png', 'image/jpg', 'image/jpeg'], size: {less_than: 500.kilobytes, message: 'image size has to be under 500 kilobytes'}
  validates :preview_thumbnail, presence: true,
    content_type: [ 'image/png', 'image/jpg', 'image/jpeg'],
    size: { less_than: 500.kilobytes, message: 'image size has to be under 500 kilobytes' }
  belongs_to :user, counter_cache: true
  # to update the counter number run in console/server
  # User.find_each { |user| User.reset_counters(user.id, :courses) }
 
  has_many :sections, dependent: :destroy
  has_many :enrollments, dependent: :restrict_with_error
  has_many :lessons, through: :sections
  has_many :user_lessons, through: :lessons
  
  # after_validation :validate_course_decription
  extend FriendlyId
  friendly_id :title, use: :slugged
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  LANGUAGES = [:"English", :"Russian", :"French", :"Bhasa Indonesian"]
  
  scope :latest, -> { order(created_at: :desc).limit(5) }
  scope :top_rated, -> { order(average_rating: :desc, created_at: :desc).limit(5) }
  scope :popular, -> { order(enrollments_count: :desc, created_at: :desc).limit(5) }
  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:"All levels", :"Beginner", :"Intermediate", :"Advanced"]
  
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
    self.enrollments.where(user_id: [user.id], course_id: [ self.id]).any?
  end
  
  def progress(user)
    unless self.lessons.count == 0
      user_lessons.where(user: user).count/self.lessons.count.to_f*100
    end
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
