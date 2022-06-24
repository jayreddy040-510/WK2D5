require_relative "./passenger.rb"

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
        elsif @passengers.length < @capacity
            false
        end
    end


    def board_passenger(passenger)
        
        if !self.full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end

        
    end

    def list_passengers
        @passengers.map! {|x| x.name}
    end

    def [](index)

@passengers[index]


    end

    def <<(passenger)
        board_passenger(passenger)
    end



end






























