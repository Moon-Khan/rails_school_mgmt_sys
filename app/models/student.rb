class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable
    before_save :downcase_email

    has_many :enrollments, dependent: :destroy
    has_many :courses, through: :enrollments

    validates :name, presence: true, length: { minimum: 2}
    validates :age, presence: true,   numericality: { only_integer: true, greater_than: 2, less_than: 25}
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    private
    def downcase_email
        self.email = email.downcase if email.present?
    end

end

