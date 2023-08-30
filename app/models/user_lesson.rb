class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  
  validates :user, :lesson, presence: true
  
  validates_uniqueness_of :user_id, scope: :lesson_id #user can't see the same lesson for the first time if already seen once
  validates_uniqueness_of :lesson_id, scope: :user_id 
end
