class Listing < ApplicationRecord
    belongs_to :category
    mount_uploader :picture, AvatarUploader
end
