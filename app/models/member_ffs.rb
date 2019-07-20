class MemberFFS < ApplicationRecord
  belongs_to :member

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

  def description
    # 91type を因子ごとに分割
    types = self[:"91_type"].split('')

    # 1因子の場合は長い説明を使う
    return FFS.find_by(label: types.first).long_description if types.count == 1

    # 複数因子の場合は説明を連結
    ret = nil
    types.each_with_index do |t, index|
      if index == 0
        ret = 'まず、'
      elsif index == types.size - 1
        ret += '最後に、'
      else
        ret += '次に、'
      end
      ret += FFS.find_by(label: t).short_description
    end
    ret
  end

  def self.create_by_ethos!(data, member_id)
    m = new_by_ethos(data, member_id)
    m.save!
    m
  end

  def self.new_by_ethos(data, member_id)
    m = find_or_initialize_by(
      member_id: member_id
    )
    m.a = data['A因子']
    m.b = data['B因子']
    m.c = data['C因子']
    m.d = data['D因子']
    m.e = data['E因子']
    m['4_type'] = data['4タイプ分類']
    m['91_type'] = data['91タイプ分類']
    m
  end
end
