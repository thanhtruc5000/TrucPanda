class AdminMailer < ApplicationMailer
    # Sử dụng để xác định địa chỉ email mặc định cho người nhận
    default to: -> { Admin.pluck(:email) },
            from: "notification@example.com"
  
    def new_registration(user)
      @user = user
      mail(subject: "New User Signup: #{@user.email}")
    end
  end
  