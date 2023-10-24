class Public::TicketOrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @ticketorder = TicketOrder.new
  end

  def confirm
    @cart_tickets = current_customer.cart_tickets

    @ticketorder = TicketOrder.new(
      payment_method:params[:ticketorder][:paymetn_method])
      @ticketorder.postage = 800
  end

  def complete
  end

  def create
    @ticketorder = current_customer.ticketorders.new(ticket_order_params)
    @ticketorder.current_id = current_customer.id
    @ticketorder.save

    #カートを空にするため、ticketorder_detailに保存する
    #カート内チケットを１つずつ取り出しループ
    current_customer.cart_tickets.each do |cart_ticket|
      #初期化宣言
      @ticket_order_detail = TicketOrderDetail.new
      #チケット注文idを紐づけておく
      @ticket_order_detail.ticketorder_id = @ticketorder.id
      #カート内チケットidを注文チケットidに代入
      @ticket_order_detail.event_ticket_id = cart_ticket.event_ticket_id
      #カート内チケットの枚数を注文チケットの枚数を代入
      @ticket_order_detail.amount = cart_ticket.amount
      #消費税込に計算して代入
      @ticket_order_detail.price = ((cart_ticket.ticket.add_tax_sales_ticketprice*cart_ticket.amount)*1.1).to_i
      #注文チケットを保存
      @ticket_order_detail.save
    end
    current_customer.cart_ticket.destroy.all
    redirect_to complete_ticket_orders_path
  end

  def index
    @ticketorders = current_customer.ticketorders.all.page(paramas[:page]).per(6).order('created_at DESC')
  end

  def show
    @ticketorder = TickertOrder.find(params[:id])
    @ticket_order_details = @ticketorder.ticket_order_details.all
  end

  private

  def ticket_order_params
    params.require(:ticket_order).permit(:postcode, :address, :name, :postage, :payment, :payment_method, :price, :event_ticket_id)
  end
end
