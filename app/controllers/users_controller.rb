class UsersController < ApplicationController
    # Action để tạo người dùng mới
    def create
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
          # Gửi email chào mừng sau khi người dùng được lưu thành công
          UserMailer.with(user: @user).welcome_email.deliver_later
  
          format.html { redirect_to user_url(@user), notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # Các phương thức khác như 'show', 'edit', v.v.
  
    private
  
    # Phương thức mạnh mẽ để bảo mật thông tin người dùng
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
  