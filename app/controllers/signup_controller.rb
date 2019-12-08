class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3
  before_action :validates_step3, only: :step4


  # 各アクションごとに新規インスタンスを作成し
  # 各アクションごとに、遷移元のページのデータをsessionに保管
  def step1
    @user = User.new # 新規インスタンス作成
  end


  def step2

    @profile = Profile.new # 新規インスタンスの作成
  
  end


  def step3
    @profile = Profile.new # 新規インスタンスを再度作成
  end

  def step4
    @user = User.new(
      name: session[:name], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
    )
    
    @profile = Profile.new(
      avatar: session[:avatar], # sessionに保存された値をインスタンスに渡す
      self_introduction: session[:self_introduction],
      prefectures: session[:prefectures],
      city: session[:city],
      phone_number: session[:phone_number],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      age: session[:age],
      gender: session[:gender],
      occupation: session[:occupation],
      expert: session[:expert],
      release: session[:release],
    )
    # redirect_to done_signup_index_path
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end



  # before_actionごとに、遷移元のページのデータをsessionに保管
  # 仮でインスタンスを作成しバリデーションチェックを行う
  def validates_step1
    # step1で入力された値をsessionに保存
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]

    # バリデーション用に、仮でインスタンスを作成
    @user = User.new(
      name: session[:name], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う

    render '/signup/step1' unless @user.valid?(:validates_step1)
  
  end

  def validates_step2
    # step2で入力された値をsessionに保存
    # session[:phone_number] = user_params[:phone_number]
    # バリデーション用に、仮でインスタンスを作成する
    session[:phone_number] = profile_params[:phone_number]

    @profile = Profile.new(
      phone_number: session[:phone_number],
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
    render '/signup/step2' unless @profile.valid?(:validates_step2)
  end 


  def validates_step3
    session[:self_introduction] = profile_params[:self_introduction]
    session[:avatar] = profile_params[:avatar]
    session[:prefectures] = profile_params[:prefectures]
    session[:city] = profile_params[:city]
    session[:birth_year] = profile_params[:birth_year]
    session[:birth_month] = profile_params[:birth_month]
    session[:birth_day] = profile_params[:birth_day]
    session[:age] = profile_params[:age]
    session[:gender] = profile_params[:gender]
    session[:occupation] = profile_params[:occupation]
    session[:expert] = profile_params[:expert]
    session[:release] = profile_params[:release]


    # バリデーション用に、仮でインスタンスを作成する
    @profile = Profile.new(
      avatar: session[:avatar], # sessionに保存された値をインスタンスに渡す
      self_introduction: session[:self_introduction],
      prefectures: session[:prefectures],
      city: session[:city],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      age: session[:age],
      gender: session[:gender],
      occupation: session[:occupation],
      expert: session[:expert],
      release: session[:release],

    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
    render '/signup/step3' unless @profile.valid?(:validates_step3)
    
  end


  def create

    @user = User.new(
      name: session[:name], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
    )
    
    if @user.save
      

      # ログインするための情報を保管
      session[:id] = @user.id

      @profile = Profile.new(
        user_id: @user.id,
        avatar: session[:avatar], # sessionに保存された値をインスタンスに渡す
        self_introduction: session[:self_introduction],
        prefectures: session[:prefectures],
        city: session[:city],
        phone_number: session[:phone_number],
        birth_year: session[:birth_year],
        birth_month: session[:birth_month],
        birth_day: session[:birth_day],
        age: session[:age],
        gender: session[:gender],
        occupation: session[:occupation],
        expert: session[:expert],
        release: session[:release],
      )
      @profile.save

      redirect_to done_signup_index_path

    else
      render '/signup/entry_signup'
    end
  end




  private
  # 許可するキーを設定します
    def user_params
      params.require(:user).permit(
        :name, 
        :email,
        :password, 
        :password_confirmation, 
      )
  end

  def profile_params
    params.require(:profile).permit(
      :phone_number,
      :self_introduction,
      :avatar, 
      :prefectures, 
      :city, 
      :birth_year, 
      :birth_month, 
      :birth_day, 
      :age, 
      :gender, 
      :occupation, 
      :expert,
      :release
      
    )
  end

end
