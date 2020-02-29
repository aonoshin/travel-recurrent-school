class Fee < ApplicationRecord
    validates:name, {presence:true, length:{maximum:15}}
    validates:price, presence:true
    validates:text, {presence:true, length:{maximum:80}}
end
