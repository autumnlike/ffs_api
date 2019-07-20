class SlackService
  def self.send_member(id, channel, slack_member_id)
    member = Member.find id
    message = "*#{member.name}さんのFFS診断結果*"
    attachments = attachments_by_member member
    Slack.chat_postEphemeral(text: message, channel: channel, member: slack_member_id, attachments: attachments)
  end

  def self.attachments_by_ffs
    fields = []
    FFS.all.each do |f|
      fields << {
        title: "#{f.label}: #{f.name}",
        value: f.overview
      }
    end
    [
      text: "FFS 因子説明",
      title_link: "https://goo.gl/mxU3Hh",
      title: "全社のFFS診断結果はこちら",
      fields: fields
    ]
  end

  def self.attachments_by_member(member)
    ffs = member.member_ffs # short
    attachments = [
      # google グラフ image API はサポート外だが、便利なので使う
      # @see https://developers.google.com/chart/image/docs/chart_params#gcharts_chs
      image_url: "https://chart.googleapis.com/chart?chs=200x200&cht=bvs&chd=t:#{ffs.a},#{ffs.b},#{ffs.c},#{ffs.d},#{ffs.e}&chds=a&chxt=x,y&chm=N,000000,0,-1,11&chxl=0:|A|B|C|D|E|",
      text: "*#{member.name}さんのFFS診断結果*",
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

  def self.attachments_by_same_member(member)
    fields = []
    MemberFFS.where('91_type': member.member_ffs[:'91_type']).each do |d|
      fields << {
        title: "#{d.member.name} さん",
        value: "`/ffs #{d.member.email.split('@').first}`",
        short: true,
      }
    end
    [
      text: "あなたと同質である *#{member.member_ffs[:"91_type"]}* の一覧です。",
      title_link: "https://goo.gl/mxU3Hh",
      title: "全社のFFS診断結果はこちら",
      fields: fields
    ]
  end

  def self.attachments_by_91_type(type)
    fields = []
    MemberFFS.where('91_type': type).each do |d|
      fields << {
        title: "#{d.member.name} さん",
        value: "`/ffs #{d.member.email.split('@').first}`",
        short: true,
      }
    end
    if fields.empty?
      return [
        text: "#{type} に該当する人はいませんでした"
      ]
    end
    [
      text: "*#{type}* の一覧です。",
      title_link: "https://goo.gl/mxU3Hh",
      title: "全社のFFS診断結果はこちら",
      fields: fields
    ]
  end
end
