require 'csv'

class EthosImporterService
  IGNORE_VALUE_STRING = 'data:'

  def self.import(file_name)
    encoding = "UTF-8"
    row = 1
    begin
      CSV.foreach(file_name, headers: true, encoding: encoding) do | data |
        row += 1
        data = shaping data
        user = User.create_by_ethos! data
        user_ffs = UserFFS.create_by_ethos! data, user.id
      end
    rescue => e
      fail "#{row}行目でエラーが発生しました。[#{e.message}]"
    end
  end

  # CSV値の整形
  def self.shaping(data)
    data.each do |k, v|
      data[k] = ignore_value_string v
    end
  end

  def self.ignore_value_string(val)
    val = val.gsub(IGNORE_VALUE_STRING, '') if val.class == String
    val
  end
end
