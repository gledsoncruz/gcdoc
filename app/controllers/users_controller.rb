class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    authorize User
  	@title = 'Lista de Usuários'
  	@q = User.ransack(params[:q])
    if current_user.role.eql?('super')
      @search = User.where(role: 'admin').search(params[:q])
  	  @users = @search.result
    elsif current_user.role.eql?('admin')
      @search = User.where(customer_id: current_user.id).search(params[:q])
      @users = @search.result
    end
  	respond_to do |format|
      format.html
      format.js
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if current_user.role == 'admin'
      @user.role = 'customer'
      @user.customer_id = current_user.id
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:user][:password].blank? || params[:user][:pass_changed].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        if params[:user][:pass_changed].blank?
          format.html { render :edit }
        else
          format.html { render :change_pass }
        end
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_pass
    @user = current_user
  end

  # def update_customer_password
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :cpf, :cel, :password, :password_confirmation, :pass_changed, :role, :plan_id)
    end

    def password_change_params
      params.require(:user).permit(:password, :password_confirmation, :pass_changed)
    end
end
