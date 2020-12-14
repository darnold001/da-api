class UserNotifierMailer < ApplicationMailer
    default :from => 'dbarnold321@gmail.com'
  
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(user)
      @user = user
      puts(@user, 'check user')
      mail( :to => 'dbarnold321@gmail.com',
      :subject => 'Website Inquiry',
      :body => "name: #{@user.name}\n
                email: #{@user.username}\n
                phone: #{@user.phone}\n
                comment: #{user.comment}")
    end

  end