class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: %i(google)
end
