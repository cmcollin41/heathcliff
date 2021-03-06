class AssignmentMailer < ApplicationMailer
	 default from: "bradley@heathcliff.io"

  def assignment_email(member, prompt)
  	@member = member
  	@prompt = prompt
    mail(
    	to: "#{@member.email}",
    	subject: '[HEATHCLIFF] New prompt just for you :)'
    	)
  end
end
