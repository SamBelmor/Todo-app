class User < ApplicationRecord
  has_many :items
  has_one_attached :avatar
  before_save :attach_image
  after_create :send_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def attach_image
    unless self.avatar.attachment.present?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')), 
      filename: 'default_avatar.png', 
      content_type: 'image/png')
    end
  end

  private      
  def send_email
    UserMailer.welcome_email(self).deliver_now
  end
end
