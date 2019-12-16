class User < ActiveRecord::Base #[6.0] why does this not work with version?]
    has_many :exercises
    has_secure_password
    validates_presence_of :name, :email, :password, :username
    validates_uniqueness_of :username
end

 