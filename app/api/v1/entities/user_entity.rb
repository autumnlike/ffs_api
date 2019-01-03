module V1
  module Entities
    class UserEntity < Grape::Entity
      expose :id
      expose :key
      expose :name
      expose :name_en
      expose :email
      expose :user_ffs do
        expose :a
        expose :b
        expose :c
        expose :d
        expose :e
        expose :'4_type'
        expose :'91_type'
      end
    end
  end
end
