class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  def self.generate(params, user)
    Contact.create(

      user_id: user.id,
      listing_id: params[:listing_id],
      message: params[:message]

    )

    UserMailer.new_contact(params[:listing_id],user.email,params[:message]).deliver_now
  end
  def self.my_messages(user)
    @contacts = Contact.joins('LEFT JOIN listings ON listings.id = contacts.listing_id')
                       .where(['listings.user_id = ?', user.id])
                       .order('contacts.created_at DESC')
  end
end
