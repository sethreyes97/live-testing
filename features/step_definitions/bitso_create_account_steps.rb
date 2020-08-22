And(/^user changes residence country$/) do
  @user = FactoryBot.create(:user)
  BitsoCreateAccountPage.change_residence_country(@user.country)
end

And(/^user enters email$/) do
  BitsoCreateAccountPage.enter_email(@user.email)
end

And(/^user enters password$/) do
  BitsoCreateAccountPage.enter_password(@user.password)
end

And(/^user accepts terms and conditions$/) do
  BitsoCreateAccountPage.accept_terms
end

And(/^user accepts receiving news$/) do
  BitsoCreateAccountPage.accept_news
end

And(/^user accepts privacy policy/) do
  BitsoCreateAccountPage.accept_privacy_policy
end

Then(/^user should see error messages/) do
  raise "Error message not shown" unless BitsoCreateAccountPage.validate_email_error_message
  raise "Error message not shown" unless BitsoCreateAccountPage.validate_password_error_message
end