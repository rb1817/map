class Product < ApplicationRecord
    mount_uploader :image_address, ImageUploader
    has_many :likes
    has_many :users,through: :likes
end
