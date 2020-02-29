class Faculty < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates:name, {presence:true, length:{maximum:20}}
    validates:image, presence:true
    validates:content, {presence:true, length:{minimum:40}, length:{maximum:95}}
end
