require_relative "./item.rb"

class List
    attr_reader :label
    def initialize(label)
    
    @label = label
    @items = []

    
    end


    def label=(new_label)
        @label = new_label
    end


    def add_item(title, deadline, description="")
    

        if Item.valid_date?(deadline)
            x = Item.new(title, deadline, description)
            @items << x
            return true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)

    (0..(@items.length - 1)) === index

    
    end

    def swap(index_1, index_2)

        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
             return false
        end

    end

    def [](index)
    
    @items[index]
    
    end

    def priority
    
    @items[0]
    end

    def print_list

      

        

    p "#{self.label.upcase.ljust(30, ' ')}"
    p "-----------------------------------------------------------------------------"
     @items.each_with_index do |x,i|
      
        p "#{i.to_s.ljust(10, " ")}      #{x.title.ljust(20, " ")}                        #{x.deadline.to_s.ljust(30, " ")}       "                 
        p "-----------------------------------------------------------------------------"
       
        end
       
    end




    def print_full_item(index)

        p "-----------------------------------------------------------------------------"
        p 
        p "#{@items[index].title}                                          #{@items[index].deadline}"
        p 
        p @items[index].description
        p 
        p "-----------------------------------------------------------------------------"
    end

    def print_priority

        p "-----------------------------------------------------------------------------"
        p 
        p "#{@items[0].title}                                          #{@items[0].deadline}"
        p 
        p @items[0].description
        p 
        p "-----------------------------------------------------------------------------"
    end


    def down(index, amount=1)

        if index >= @items.length - 1
            p "This item is already at the bottom of your list!"
        end

        if index + amount > @items.length - 1
            amount = (@items.length - 1) - index
        end

        if valid_index?(index)

            amount.times do @items[index], @items[index + 1] = @items[index + 1], @items[index]
            end

            return true
        else
            return false
        end
         
    end

    def up(index, amount=1)
        if index == 0
            p "This item is already at the top of your list!"
        end

        if index - amount < 0
            amount = index
        end

        if valid_index?(index)

            amount.times do @items[index], @items[index - 1] = @items[index - 1], @items[index]
            end

            return true

        else
            return false
        end
    

    end
    


    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end
    
    

end