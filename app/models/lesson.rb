class Lesson < ApplicationRecord
  belongs_to :section
  validates :title, :description, :section, presence: true
  accepts_nested_attributes_for :section
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  has_rich_text :description
  has_rich_text :links
  
  def to_s 
     title
  end
  
end
