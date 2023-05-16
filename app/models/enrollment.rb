class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user
  
  validates :user, :course, :price, presence: true
  
  validates_uniqueness_of :user_id, scope: :course_id #user can't be subscribed to the same course twice
  validates_uniqueness_of :course_id, scope: :user_id #user can't be subscribed to the same course twice
  
  validate :cant_subscribe_to_own_course # user can't create a subscription if course.user == current_user.id
  
  extend FriendlyId
  friendly_id :to_s, use: :slugged
  
  scope :missing_review, -> { where(rating: [0, nil, ""], review: [0, nil, ""])}
  
  def to_s
    user.to_s + " " + course.to_s
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["course", "user"]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "review", "updated_at", "rating", "price", "user_email_cont", "course_title_cont"]
    # column_names + ['user_email_cont', 'course_title_cont']
  end
  
  protected
  def cant_subscribe_to_own_course
    if self.new_record?
      if self.user_id.present?
        if user_id == course.user_id && !user.has_role?(:admin) 
          errors.add(:base, "You can not subscribe to your own course")
        end
      end
    end
  end
end
