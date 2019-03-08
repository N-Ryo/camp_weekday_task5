class FortunetellingsController < ApplicationController
  # 計算用のモジュールCommon、検証用のモジュールFortunetellingsHelperをincludeする。
  include FortunetellingsHelper, Common
  # before_actionでshowアクションが実行される前にset_dateメソッドを実行する。
  before_action :set_date, only: [:show]
  def show
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
