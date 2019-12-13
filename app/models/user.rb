class User < ActiveRecord::Base #[6.0] why does this not work with version?]
    has_many :exercises
    has_secure_password
end