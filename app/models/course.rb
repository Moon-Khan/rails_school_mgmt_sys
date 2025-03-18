class Course < ApplicationRecord

    belongs_to :teacher
    has_many :enrollments, dependent: :destroy
    has_many :students, through: :enrollments

    validates :name, presence: true, length: { minimum: 2}
end
