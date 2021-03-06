class PaymentsController < ApplicationController
  before_action :current_user_must_be_payment_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_payment_user
    payment = Payment.find(params[:id])

    unless current_user == payment.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Payment.ransack(params[:q])
    @payments = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("payments/index.html.erb")
  end

  def show
    @payment = Payment.find(params[:id])

    render("payments/show.html.erb")
  end

  def new
    @payment = Payment.new

    render("payments/new.html.erb")
  end

  def create
    @payment = Payment.new

    @payment.user_id = params[:user_id]

    save_status = @payment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/payments/new", "/create_payment"
        redirect_to("/payments")
      else
        redirect_back(:fallback_location => "/", :notice => "Payment created successfully.")
      end
    else
      render("payments/new.html.erb")
    end
  end

  def edit
    @payment = Payment.find(params[:id])

    render("payments/edit.html.erb")
  end

  def update
    @payment = Payment.find(params[:id])

    save_status = @payment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/payments/#{@payment.id}/edit", "/update_payment"
        redirect_to("/payments/#{@payment.id}", :notice => "Payment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Payment updated successfully.")
      end
    else
      render("payments/edit.html.erb")
    end
  end

  def destroy
    @payment = Payment.find(params[:id])

    @payment.destroy

    if URI(request.referer).path == "/payments/#{@payment.id}"
      redirect_to("/", :notice => "Payment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Payment deleted.")
    end
  end
end
