class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  has_many :access_tokens, :dependent => :delete_all
  has_many :authentications, :dependent => :destroy

  accepts_nested_attributes_for :authentications
end
