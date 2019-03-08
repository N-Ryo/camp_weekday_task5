module FortunetellingsHelper
  # 入力されたparams[:date]が
  #   8桁の半角数字・有効な日付・過去の日付
  # になっているか判別する。
  #有効でない場合はfalseを返す。
  def valid_birthday?(date)
    begin
    date.length == 8 &&
    Time.new(date[0,4], date[4,2], date[6,2]).strftime('%Y%m%d') <= Time.now.strftime('%Y%m%d')
    rescue
      false
    end
  end

  #今日が誕生日かどうか判定する。
  def birthday?(date)
    date[4,4] == Time.now.strftime('%m%d')
  end
end
