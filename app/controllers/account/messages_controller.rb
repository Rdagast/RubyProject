class Account::MessagesController < Account::AccountController
  def index
    @contacts = Contact.my_messages(current_user)
  end
end
