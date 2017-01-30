class User < ActiveRecord::Base
  has_many :test_results, dependent: :destroy
  has_many :assessments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_authentication(conditions)
    find_by(username: conditions[:email]) || find_by(email: conditions[:email])
  end
end
