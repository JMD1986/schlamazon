class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.find_or_create_by(user_id session[:user_id], completed: false)
    @order.save

    @product_order = ProductOrder.find_or_create_by(order_id: @order.id, item_id: params[:item_id])
    @product_order[:quantity] += params[:quantity].to_i

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
def create
     if authenticate_user!
      @order = Order.find_or_create_by(user_id: session[:user_id], completed: false)
      @order.save

      @product_order = ProductOrder.find_or_create_by(order_id: @order.id, item_id: params[:item_id])
      @order_item[:quantity] += params[:quantity].to_i

      if @order_item.save
        render json: {order: @order_item, msg: "order saved"}
      else
        render :new, flash[:alert] = "log in"
      end
     else
       redirect_to root_path
     end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :completed)
    end
end
