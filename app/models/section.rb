class Section < ApplicationRecord
  belongs_to :course
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
