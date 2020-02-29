class News < ApplicationRecord
    validates:content, {presence:true, length:{maximum:30}}
end
