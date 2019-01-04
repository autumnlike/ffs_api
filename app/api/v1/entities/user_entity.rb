module V1
  module Entities
    class UserEntity < Grape::Entity
      expose :id
      expose :key
      expose :name
      expose :name_en
      expose :email
      expose :user_ffs, using: V1::Entities::UserFFSEntity
    end
  end
end
