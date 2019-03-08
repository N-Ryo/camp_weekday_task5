class FortunetellingsController < ApplicationController
  # 計算用のモジュールCommon、検証用のモジュールFortunetellingsHelperをincludeする。
  include FortunetellingsHelper, Common
  # before_actionでshowアクションが実行される前にset_dateメソッドを実行する。
  before_action :set_date, only: [:show]
  def show
    # set_dateで@dateが格納されていない場合は、以下の変数は不必要なため条件分岐させる。
    if @date
      # 年月日をそれぞれString型の@dateから分割する。
      @year = @date[0,4]
      @month = @date[4,2]
      @day = @date[6,2]
      # Commonモジュールのconstellationメソッドを実行して、インスタンス変数に格納する。
      @constellation = constellation(@month, @day.to_i)
      # パラメタと今日の日付の差分をとり、年に当たる10,000で商を計算することで年齢がでる。
      @age = (Date.today.strftime("%Y%m%d").to_i - params[:date].to_i) / 10000
    end
  end

  private
    def set_date
      # FortunetellingsHelperのvalid_birthdayメソッドを実行して、有効な誕生日か判定する。
      # 有効な場合は@dateを定義して、無効な場合は@error_messageを定義して、Viewに渡す。
      if valid_birthday?(params[:date])
        @date = params[:date]
      else
        @error_message = "半角英数字8桁であなたの誕生日を入力してください"
      end
    end
end
