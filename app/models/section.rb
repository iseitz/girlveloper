class Section < ApplicationRecord
  belongs_to :course, counter_cache: true
    # to update the counter number run in console/server
  # Course.find_each { |course| Course.reset_counters(course.id, :sections) }
  has_many :lessons, dependent: :destroy
  validates :title, :overview, :course, presence: true
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  has_rich_text :overview
  
  def to_s
    title 
  end
  
end
