class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  ROLES = %w[teacher student] 

  validates :role, presence: true, inclusion: { in: ROLES }

  before_validation :set_default_role, on: :create

  def admin?
    role == "admin"
  end

  def teacher?
    role == "teacher"
  end

  def student?
    role == "student"
  end

  private

  def set_default_role
    self.role = "student" unless ROLES.include?(self.role)
  end
end
