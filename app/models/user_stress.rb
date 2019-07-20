class UserStress < ApplicationRecord
  def self.create_by_ethos!(data, user_id)
    # ストレス診断は最大6件取れる
    for num in 1..6 do
      u = new_by_ethos(data, user_id, num)
      next if u.nil?
      u.save!
    end
    true
  end

  def self.new_by_ethos(data, user_id, num)
    return if data['ストレス' + String(num)].nil?

    return if find_by(
      user_id: user_id,
      diagnostic_at: data['ストレス' + String(num) + '受検日']
    )

    new user_id: user_id, point: data['ストレス' + String(num)], diagnostic_at: data['ストレス' + String(num) + '受検日']
  end
end
