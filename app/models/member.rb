class Member < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_one :member_ffs, class_name: "MemberFFS"
  has_many :member_stresses, -> { order('diagnostic_at DESC') }

  def team_member(team_id)
    TeamMember.find_by member_id: id, team_id: team_id
  end

  def self.create_by_ethos!(data)
    m = new_by_ethos(data)
    m.save!
    m
  end

  def self.new_by_ethos(data)
    # emailを主キーに上書き
    m = find_or_initialize_by(
      email: data['メールアドレス']
    )
    m.key = data['社員番号']
    m.name = data['氏名']
    m.name_en = data['氏名(英語)']
    m
  end
end
