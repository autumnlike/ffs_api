class UserFFS < ApplicationRecord
  validates :a, numericality:
    { greater_than_or_equal_to: 0, less_than_or_equal_to: 20, message: 'A因子は0-20で設定してください' }
  validates :b, numericality:
    { greater_than_or_equal_to: 0, less_than_or_equal_to: 20, message: 'B因子は0-20で設定してください' }
  validates :c, numericality:
    { greater_than_or_equal_to: 0, less_than_or_equal_to: 20, message: 'C因子は0-20で設定してください' }
  validates :d, numericality:
    { greater_than_or_equal_to: 0, less_than_or_equal_to: 20, message: 'D因子は0-20で設定してください' }
  validates :e, numericality:
    { greater_than_or_equal_to: 0, less_than_or_equal_to: 20, message: 'E因子は0-20で設定してください' }
  validates :'4_type', inclusion: { in: %w(AN TG LM ML) }
  validates :'91_type', format: { with: /[ABCDE]/ }


  def self.create_by_ethos!(data, user_id)
    u = new_by_ethos(data, user_id)
    u.save!
    u
  end

  def self.new_by_ethos(data, user_id)
    u = find_or_initialize_by(
      user_id: user_id
    )
    u.a = data['A因子']
    u.b = data['B因子']
    u.c = data['C因子']
    u.d = data['D因子']
    u.e = data['E因子']
    u['4_type'] = data['4タイプ分類']
    u['91_type'] = data['91タイプ分類']
    u
  end
end
