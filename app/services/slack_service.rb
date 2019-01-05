class SlackService
  def self.send_user(id, channel, slack_user_id)
    user = User.find id
    message = "*#{user.name}さんのFFS診断結果*"
    attachments = attachments_by_user user
    Slack.chat_postEphemeral(text: message, channel: channel, user: slack_user_id, attachments: attachments)
  end

  def self.attachments_by_user(user)
    ffs = user.user_ffs # short
    attachments = [
      # google グラフ image API はサポート外だが、便利なので使う
      # @see https://developers.google.com/chart/image/docs/chart_params#gcharts_chs
      image_url: "https://chart.googleapis.com/chart?chs=200x200&cht=bvs&chd=t:#{ffs.a},#{ffs.b},#{ffs.c},#{ffs.d},#{ffs.e}&chds=a&chxt=x,y&chm=N,000000,0,-1,11&chxl=0:|A|B|C|D|E|",
      text: "*#{user.name}さんのFFS診断結果*"
      fields: [
        {
          title: '各因子',
          value: "A:#{ffs.a} B:#{ffs.b} C:#{ffs.c} D:#{ffs.d} E:#{ffs.e}",
          short: true
        },
        {
          title: '91Type',
          value: ffs['91_type'],
          short: true
        },
        {
          title: '説明',
          value: ffs.description,
          short: false
        }
      ],
      title: "FFS 一覧",
      title_link: "https://goo.gl/mxU3Hh"
    ]
  end
end
