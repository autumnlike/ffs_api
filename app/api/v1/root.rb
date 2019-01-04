module V1
  class Root < Grape::API
    version :v1
    format :json

    mount V1::Users
    mount V1::UserFFS
    mount V1::FFSApi
  end
end