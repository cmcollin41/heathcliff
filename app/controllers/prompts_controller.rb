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

    @writers = Member.where(member_type: 0)
    @editors = Member.where(member_type: 2)
  end

  def new
  	@prompt = current_member.prompts.build
  end

  def create

    customer = if member.stripe_id?
                 Stripe::Customer.retrieve(current_member.stripe_id)
               else
                 Stripe::Customer.create(email: current_member.email)
               end





  	@prompt = current_member.prompts.build(prompt_params)
  	if @prompt.save
  		redirect_to prompts_path, notice: "Prompt was successfully posted"
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
  	if @prompt.update(prompt_params)
  		redirect_to :back, notice: "Prompt was successfully udpated."
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
