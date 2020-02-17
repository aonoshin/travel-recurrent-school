class Faculty < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates:name, {presence:true, length:{maximum:15}}
    validates:image, presence:true
    validates:content, {presence:true, length:{maximum:100}}
end
