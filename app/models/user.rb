class User < ActiveRecord::Base
  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email 


end
