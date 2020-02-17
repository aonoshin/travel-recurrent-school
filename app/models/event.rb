class Event < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates:title, {presence:true, length:{maximum:40}}
    validates:image, presence:true
    validates:place, {presence:true, length:{maximum:10}}
    validates:starttime, presence:true
    validates:endtime, presence:true
end
