
require_relative "./list.rb"
require_relative "./item.rb"

class TodoBoard

def initialize(label)
    @list = List.new(label)
end

def get_command
    p "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')

    case cmd
    when 'mktodo'
        @list.add_item(*args)
        true
    when 'up'
        @list.up(*args)
        true
    when 'down'
        @list.down(*args)
        true
    when 'swap'
        @list.swap(*args)
        true
    when 'sort'
        @list.sort_by_date
        true
    when 'priority'
        @list.priority
        true
    when 'print'
        @list.print_list
        @list.print(*args)
        true
    when 'quit'
        return false
    else
        p "Sorry, that command is not recognized."
    end

    true
end


def run

    while self.get_command == true
    end
end











end