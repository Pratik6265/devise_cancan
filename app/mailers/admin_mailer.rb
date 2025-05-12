class AdminMailer < ApplicationMailer
    def new_user_waiting_for_approval(user, admin)
      @user = user
      @admin = admin
      mail(to: @admin.email, subject: 'New User Awaiting Approval')
    end
  end