class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :movies

  attr_accessor :skip_password_validation

  def update_resource(params)
    if params[:password].present?
      self.update params
    else
      self.update_without_password(params)
    end
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
