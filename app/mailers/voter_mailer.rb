class VoterMailer < ActionMailer::Base
  default from: ""

  def approval_email(voter)
  	@voter = voter
  	mail(to: @voter.email, subject: "Welcome to ChaguoLako!")
  end
end
