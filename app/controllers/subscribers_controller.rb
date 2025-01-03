class SubscribersController < ApplicationController
  before_action :set_product

  def create
    # Tạo hoặc tìm subscriber nếu đã tồn tại
    @subscriber = @product.subscribers.find_or_create_by(subscriber_params)

    # Kiểm tra nếu subscriber đã tồn tại
    if @subscriber.persisted?
      redirect_to @product, notice: "Bạn đã đăng ký nhận thông báo."
    else
      # Nếu là đăng ký mới
      redirect_to @product, notice: "Cảm ơn bạn đã đăng ký! Chúng tôi sẽ thông báo khi sản phẩm có sẵn trở lại."
    end
  end

  private

  # Kiểm tra sự tồn tại của sản phẩm
  def set_product
    @product = Product.find_by(id: params[:product_id])
    unless @product
      redirect_to products_path, alert: "Sản phẩm không tồn tại."
    end
  end

  # Chỉ cho phép email được gửi lên
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
