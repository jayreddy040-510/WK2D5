class Item

attr_accessor :title, :description
attr_reader :deadline

def self.valid_date?(date_string)

unless (0..31) === date_string[-2..-1].to_i
    return false
end

unless (0..12) === date_string[-5..-4].to_i
    return false
end

unless (1900..2022) === date_string[0..3].to_i
    return false
end

return true

end

def initialize(title, deadline, description)

@title = title

unless Item.valid_date?(deadline)
    raise ArgumentError.new "that's not a valid deadline"
end

@deadline = deadline
@description = description


end


def deadline=(new_deadline)

    if Item.valid_date?(new_deadline)    
        @deadline = new_deadline
    else
        raise ArgumentError.new "that's not a valid deadline"
    end
end



end