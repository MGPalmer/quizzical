class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         #:recoverable, :rememberable,
         :validatable,
         :confirmable

  scope :confirmed, -> { where("confirmed_at IS NOT NULL") }

  has_one_attached :avatar

  # This causes all Devise mails to be scheduled via ActiveJob to Redis with #deliver_later
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
