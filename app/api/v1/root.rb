module V1
  class Root < Grape::API
    version :v1
    format :json

    mount V1::SlackApi
    # 使ってないので、一旦停止
    #mount V1::Members
    #mount V1::MemberFFS
    #mount V1::FFSApi
  end
end
