class VoterMailer < ActionMailer::Base
  default from: "admin@nds.org"

  def approval_email(voter)
  	@voter = voter
  	mail(to: @voter.email, subject: "Welcome to ChaguoLako!")
  end
end
