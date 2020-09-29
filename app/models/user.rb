class User < ActiveRecord::Base
    has_many :exercises
    has_secure_password
    validates_presence_of :name, :email, :password, :username
    validates_uniqueness_of :username, :email
end

 