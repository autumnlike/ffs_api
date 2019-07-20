class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_one :user_ffs, class_name: "UserFFS"
  has_many :user_stresses, -> { order('diagnostic_at DESC') }

  def self.create_by_ethos!(data)
    u = new_by_ethos(data)
    u.save!
    u
  end

  def self.new_by_ethos(data)
    # emailを主キーに上書き
    u = find_or_initialize_by(
      email: data['メールアドレス']
    )
    u.key = data['社員番号']
    u.name = data['氏名']
    u.name_en = data['氏名(英語)']
    u
  end
end
