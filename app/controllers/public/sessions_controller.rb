# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :customer_state, only: [:create]

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    flash[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  #退会しているかを判断するメソッド
  def customer_state
    #[処理内容1]入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    #アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    #[処理内容2]取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
      #falseだった場合、項目を入力する
    else
      #[処理内容3]trueだった場合、サインアップ画面に遷移する
      flash[:notice] = "退会済みです。再度、ご登録をしてご利用ください。"
      redirect_to new_customer_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
