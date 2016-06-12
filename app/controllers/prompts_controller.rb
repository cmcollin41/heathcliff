class PromptsController < ApplicationController
	before_action :set_prompt, only: [:show, :edit, :destroy]
	before_action :authenticate_member!

  def index
    if current_member.business?
      @prompts = Prompt.where(business_id: current_member.id)
    elsif current_member.admin?
      @prompts = Prompt.all
    else
      @prompts = current_member.prompts
    end

    @writers = Member.where(member_type: [0,3])
    @editors = Member.where(member_type: [2,3])
  end

  def new
  	@prompt = current_member.prompts.build
  end

  def create

    @member = Member.find_by(id: current_member.id)

  	@prompt = current_member.prompts.build(prompt_params)
  	if @prompt.save

      customer = Stripe::Customer.retrieve(current_member.stripe_id)

      Stripe::Charge.create(
        amount: 7000,
        currency: "usd",
        customer: customer.id,
        description: "Charge for prompt id #{@prompt.id}"
      )

      ReceiptMailer.receipt_email(@member, @prompt).deliver

  		redirect_to prompts_path, notice: "Prompt was successfully posted and you have been charged $70"
  	else
  		render :new
  	end
  end

  def show
    @prompt = Prompt.find(params[:id])
    @writers = Member.where(member_type: 0)
    @editors = Member.where(member_type: 2)
  end

  def edit
  end

  def update
    @prompt = Prompt.find(params[:id])
    @prompt.update(prompt_params)
  	if @prompt.update(prompt_params)
  		redirect_to prompts_path, notice: "Prompt was successfully udpated."
    else
      redirect_to :back
    end
  end

  def update_status
    @prompt = Prompt.find(params[:id])
    @prompt.status = params[:prompt][:status]
    if @prompt.save(validate: false)
      redirect_to prompts_path, notice: "Prompt was successfully udpated."
    else
      redirect_to prompts_path, notice: "shit... something went wrong."
    end
  end

  def destroy
  	@prompt.destroy
  	redirect_to prompts_url
  end

  private

  def set_prompt
  	@prompt = Prompt.find(params[:id])
  end

  def prompt_params
  	params.require(:prompt).permit(:category, :description, :keyword, :target_audience, :length, :due_date, :status, :business_id, keywords_attributes:[:word, :_destroy, :id])
  end
end
