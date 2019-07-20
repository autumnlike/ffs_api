class MemberStress < ApplicationRecord
  def self.create_by_ethos!(data, member_id)
    # ストレス診断は最大6件取れる
    for num in 1..6 do
      m = new_by_ethos(data, member_id, num)
      next if m.nil?
      m.save!
    end
    true
  end

  def self.new_by_ethos(data, member_id, num)
    return if data['ストレス' + String(num)].nil?

    return if find_by(
      member_id: member_id,
      diagnostic_at: data['ストレス' + String(num) + '受検日']
    )

    new member_id: member_id, point: data['ストレス' + String(num)], diagnostic_at: data['ストレス' + String(num) + '受検日']
  end
end
