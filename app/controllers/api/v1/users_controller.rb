class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, #only: [:create, :show]

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'Failed to create account.' }, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: { user: UserSerializer.new(@user) }, status: :ok
  end

  def update
    @user = User.find_by(id: params[:id])
    render json: { user: UserSerializer.new(@user) }, status: :accepted
  end

  def destroy
    User.destroy(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end
end
