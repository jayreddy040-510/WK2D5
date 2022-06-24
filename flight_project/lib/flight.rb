require_relative "passenger.rb"

class Flight
    attr_reader :passengers
    def initialize(string, capacity)
        @flight_number = string
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length >= @capacity
            true
        else
            false
        end
    end


    def board_passenger()

        
    end



end






























