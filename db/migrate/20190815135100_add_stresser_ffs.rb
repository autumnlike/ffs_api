class AddStresserFfs < ActiveRecord::Migration[5.2]
  def change
    add_column :ffs, :stresser, :string, comment: 'ストレス要因', after: :short_description
  end
end
