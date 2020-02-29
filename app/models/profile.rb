class Profile < ApplicationRecord
    mount_uploader :image, ImageUploader
    # validates:name, presence:true
    # validates:birthday, presence:true
    # validates:age, presence:true
    # validates:place, presence:true
    # validates:area, presence:true
    # validates:work, presence:true
    # validates:hobby, presence:true
    # validates:career, presence:true
    # validates:content, presence:true
    # validates:country, presence:true
end
