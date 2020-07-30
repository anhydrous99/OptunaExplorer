class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_tenant
  before_destroy :destroy_tenant

  attr_writer :login
  def login
    @login || self.username || self.email
  end

  private
  def create_tenant
    Apartment::Tenant.create username
  end

  def destroy_tenant
    Apartment::Tenant.drop username
  end
end
