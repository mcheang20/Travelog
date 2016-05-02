class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :role

  user_roles = {
    :standard => 0,
    :premium => 10,
    :admin => 20
  }
  has_many :wikis, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  after_initialize :user_default

  def user_default
    self.role ||= :standard
  end
end
