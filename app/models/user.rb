class User < ApplicationRecord
  has_many :items
  has_one_attached :avatar
  after_create :send_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  private      
  def send_email
    UserMailer.welcome_email(self).deliver_now
  end
end
