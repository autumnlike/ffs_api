module V1
  module Entities
    class FFSEntity < Grape::Entity
      expose :label
      expose :name
      expose :overview
      expose :long_description
      expose :short_description
    end
  end
end
