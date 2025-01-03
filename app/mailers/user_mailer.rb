class UserMailer < ApplicationMailer
    # Địa chỉ email mặc định khi gửi
    default from: "thongbao@example.com"
  
    # Thêm đường dẫn đến view tùy chỉnh nếu có
    prepend_view_path "custom/path/to/mailer/view"
  
    def welcome_email
      @user = params[:user]
      @url  = "http://example.com/login" # URL đăng nhập
      mail(
        to: @user.email,
        subject: "Chào mừng bạn đến với Trang Web của chúng tôi"
      ) do |format|
        # Gửi dưới dạng HTML với layout "awesome"
        format.html { render layout: "awesome" }
        # Gửi dưới dạng văn bản thuần túy
        format.text { render plain: "Xin chào, chào mừng bạn đến với dịch vụ của chúng tôi! Vui lòng truy cập #{@url} để bắt đầu." }
      end
    end
  end
  