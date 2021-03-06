class Team < ApplicationRecord
  validates :name, presence: {message: 'チーム名を入力してください。'}
  validates :name, uniqueness: {message: 'すでに同じチーム名が存在します。'}
  has_many :team_members, dependent: :destroy

  def members
    Member.where(id: TeamMember.where(team_id: id).pluck(:member_id))
  end

  def member_ffs
    MemberFFS.where(member_id: TeamMember.where(team_id: id).pluck(:member_id))
  end

  def a_avg
    return 0 if member_ffs.blank?
    member_ffs.pluck(:a).sum / member_ffs.pluck(:a).count
  end

  def b_avg
    return 0 if member_ffs.blank?
    member_ffs.pluck(:b).sum / member_ffs.pluck(:b).count
  end

  def c_avg
    return 0 if member_ffs.blank?
    member_ffs.pluck(:c).sum / member_ffs.pluck(:c).count
  end

  def d_avg
    return 0 if member_ffs.blank?
    member_ffs.pluck(:d).sum / member_ffs.pluck(:d).count
  end

  def e_avg
    return 0 if member_ffs.blank?
    member_ffs.pluck(:e).sum / member_ffs.pluck(:e).count
  end

  def stress_avg
    stresses = []
    members.each do |m|
      stresses << m.member_stresses.last.point
    end
    return 0 if stresses.blank?
    stresses.sum / stresses.count
  end
end
