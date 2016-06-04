class AssignmentsController < ApplicationController
  before_action :authenticate_member!
  
  def create
    @prompt = Prompt.find(params[:prompt_id])
    @member = Member.find(params[:member_id])
    @assignment = Assignment.create(member_id: @member.id, prompt_id: @prompt.id)

    AssignmentMailer.assignment_email(@member, @prompt).deliver

    respond_to do |format|
      format.html { redirect_to prompts_path }
      format.js
    end
  end


  def destroy
    @prompt = Prompt.find(params[:id])
    @assignment = Assignment.find_by(member_id: current_member.id, prompt_id: @prompt.id)
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to prompts_path }
      format.js
    end
  end

end