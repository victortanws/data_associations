class PaymentMethodsController < ApplicationController
  def index
    @q = PaymentMethod.ransack(params[:q])
    @payment_methods = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("payment_methods/index.html.erb")
  end

  def show
    @payment_method = PaymentMethod.find(params[:id])

    render("payment_methods/show.html.erb")
  end

  def new
    @payment_method = PaymentMethod.new

    render("payment_methods/new.html.erb")
  end

  def create
    @payment_method = PaymentMethod.new

    @payment_method.user_id = params[:user_id]

    save_status = @payment_method.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/payment_methods/new", "/create_payment_method"
        redirect_to("/payment_methods")
      else
        redirect_back(:fallback_location => "/", :notice => "Payment method created successfully.")
      end
    else
      render("payment_methods/new.html.erb")
    end
  end

  def edit
    @payment_method = PaymentMethod.find(params[:id])

    render("payment_methods/edit.html.erb")
  end

  def update
    @payment_method = PaymentMethod.find(params[:id])

    @payment_method.user_id = params[:user_id]

    save_status = @payment_method.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/payment_methods/#{@payment_method.id}/edit", "/update_payment_method"
        redirect_to("/payment_methods/#{@payment_method.id}", :notice => "Payment method updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Payment method updated successfully.")
      end
    else
      render("payment_methods/edit.html.erb")
    end
  end

  def destroy
    @payment_method = PaymentMethod.find(params[:id])

    @payment_method.destroy

    if URI(request.referer).path == "/payment_methods/#{@payment_method.id}"
      redirect_to("/", :notice => "Payment method deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Payment method deleted.")
    end
  end
end
