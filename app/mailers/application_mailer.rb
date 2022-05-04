# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'spanwar@deqode.com'
  layout 'mailer'
end
