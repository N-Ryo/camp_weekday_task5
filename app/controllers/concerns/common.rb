module Common
  # 呪文。複数のモデルやコントローラから参照するときに活きてくる。今回はなくてもいいかも。
  extend ActiveSupport::Concern
  
  # 星座を計算するプログラム。
  # border_dayに各星座の切り替わる直前の日をハッシュに格納。（key => 月、value => 日）
  # keyがStringなのはIntegerだとエラーになるから。
  def constellation(month, day)
    border_day = {
      "01": 19,  "02": 18,  "03": 20,  "04": 19,  "05": 20,  "06": 21,
      "07": 22,  "08": 22,  "09": 22,  "10": 23,  "11": 22,  "12": 21 
    }
    # ハッシュに対応するようにconstellations配列を定義
    constellations = %w(山羊 水瓶 魚 牡羊 牡牛 双子 蟹座 獅子 乙女 天秤 蠍座 射手)
    # 配列のindexが0始まりなので、monthも調整するためにindexに1引いた値を格納する。
    index = month.to_i - 1

    # monthがString型なので、Symbol型に変更して、パラメタのdayとborder_dayのvalueを比較する。
    # パラメタのdayの方が大きい場合は、参照するconstellation配列を一つ進める。（12月はindexを0にする。）
    if border_day[month.to_sym] <= day
      month == "12" ? index = 0 : index += 1
    end
    constellations[index]
  end
end
