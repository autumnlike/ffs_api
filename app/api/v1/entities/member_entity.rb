module V1
  module Entities
    class MemberEntity < Grape::Entity
      expose :id
      expose :key
      expose :name
      expose :name_en
      expose :email
      expose :member_ffs, using: V1::Entities::MemberFFSEntity
    end
  end
end
