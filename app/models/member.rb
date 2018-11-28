class Member < ApplicationRecord
  extend FriendlyId
  friendly_id :custom_slug, use: [:slugged, :finders]

  has_one :tenant, dependent: :destroy
  accepts_nested_attributes_for :tenant, allow_destroy: true

  validates_associated :tenant, if: Proc.new { |m| m.rented? }

  before_save :create_login

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :login, uniqueness: true
  validates :name, :block, :floor, :flat, :owner, :phone, presence: true
  validates :password_confirmation, presence: true, on: :create
  validates_uniqueness_of :flat, scope: %i[floor block], message: "is already registered"

  def floor_name
    case floor
    when 0
      'GF'
    when 1
      'FF'
    when 2
      'SF'
    when 3
      'TF'
    when 4
      'FOF'
    else
      ""
    end
  end

  def flat_name
    ('%02d' % self.flat.to_i)
  end

  def custom_slug
    self.floor_name.to_s + self.flat_name.to_s + "-" + self.block.to_s
  end

  # // Override devise method to accept lower case login //
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(login) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:login].nil?
        where(conditions).first
      else
        where(login: conditions[:login]).first
      end
    end
  end

  private

  def create_login
    self.login = self.custom_slug
  end
end
