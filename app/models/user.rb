class User < ApplicationRecord
  has_secure_password
  validates :email, :subdomain, presence: true, uniqueness: true
  after_create :create_tenant
  before_destroy :destroy_tenant

  private
  def create_tenant
    Apartment::Tenant.create subdomain
  end

  def destroy_tenant
    Apartment::Tenant.drop subdomain
  end
end
