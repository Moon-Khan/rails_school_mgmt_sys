class Teacher < ApplicationRecord

    has_one :course, dependent: :destroy
    validates :contact, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits" }
    validates :name, presence: true, length: { minimum: 2}
end