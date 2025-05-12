class User < ApplicationRecord
  rolify
  after_create :send_admin_approval_email
  has_many :articles, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def send_admin_approval_email
    admins = User.with_role(:admin)
    admins.each do |admin|
     AdminMailer.new_user_waiting_for_approval(self, admin).deliver_now
    end
  end
end
