class ReceiptMailer < ApplicationMailer
	default from: "brad@heathcliff.io"

	def receipt_email(member, prompt)
  	@member = member
  	@prompt = prompt
    mail(
    	to: "#{@member.email}",
    	subject: '[HEATHCLIFF] You ordered a new prompt :)'
    	)
  end
end
