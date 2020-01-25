class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true

    def to_token_payload
        {
            sub: id,
            email: email
        }
    end

    def can_modify_user?(user_id)
        role == 'admin' || id.to_s == user_id.to_s
    end

    def is_admin?
        role == 'admin'
    end
end
