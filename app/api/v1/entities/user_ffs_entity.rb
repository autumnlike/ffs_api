module V1
  module Entities
    class UserFFSEntity < Grape::Entity
      expose :a
      expose :b
      expose :c
      expose :d
      expose :e
      expose :'4_type'
      expose :'91_type'
      expose :description
    end
  end
end
