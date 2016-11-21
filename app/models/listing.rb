class Listing < ApplicationRecord
    belongs_to :category
    belongs_to :user
    mount_uploader :picture, AvatarUploader

    has_many :contacts
    has_many :comments
    
    def self.search(params)
      if params[:category_id]
        @listing = Listing.where(["category_id = ?", params[:category_id]])
      else
        @listing = Listing.where("title ILIKE :query", query: "#{params[:keywords]}%")
      end
    end

end
