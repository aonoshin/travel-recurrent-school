class Fee < ApplicationRecord
    validates:name, {presence:true, length:{maximum:15}}
    validates:price, presence:true
end
