class ApplicationMailer < ActionMailer::Base
  default to: 'girlveloper@gmail.com'
  default from: 'girlveloper@gmail.com'
  layout 'mailer'
end
