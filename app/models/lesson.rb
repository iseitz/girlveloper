class Lesson < ApplicationRecord
  belongs_to :section, -> { includes :course }, counter_cache: true
  has_many :user_lessons, dependent: :destroy
  # to update the counter number run in console/server
  # Section.find_each { |section| Section.reset_counters(section.id, :lessons) }
  validates :title, :description, :section, presence: true
  validates :title, length: { maximum: 70 }
  validates_uniqueness_of :title, scope: :section_id
  accepts_nested_attributes_for :section
  
  # scope :course_lessons, -> { Lesson.joins(:sections).where(enrollments: {user: current_user}).order(created_at: :desc).limit(5)}
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  has_rich_text :description
  has_rich_text :links
  
  has_one_attached :clip
  has_one_attached :clip_thumbnail
  validates :clip,
    content_type: ['video/mp4'], 
    size: { less_than: 50.megabytes , message: 'size should be under 50 megabytes' }
  validates :clip_thumbnail,
    content_type: ['image/png', 'image/jpg', 'image/jpeg'], 
    size: { less_than: 500.kilobytes , message: 'size should be under 500 kilobytes' }
  
  def to_s 
     title
  end
  
  def viewed(user)
    self.user_lessons.where(user: user).present?
  end
  
  def course
    self.section.course
  end
end
