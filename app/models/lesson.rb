class Lesson < ApplicationRecord
  belongs_to :section, -> { includes :course }, counter_cache: true
  # to update the counter number run in console/server
  # Section.find_each { |section| Section.reset_counters(section.id, :lessons) }
  validates :title, :description, :section, presence: true
  accepts_nested_attributes_for :section
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  has_rich_text :description
  has_rich_text :links
  
  has_one_attached :clip
  has_one_attached :thumbnail
  
  def to_s 
     title
  end
  
end
