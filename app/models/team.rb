class Team < ApplicationRecord
  validates :name, presence: {message: 'チーム名を入力してください。'}
  validates :name, uniqueness: {message: 'すでに同じチーム名が存在します。'}
end
