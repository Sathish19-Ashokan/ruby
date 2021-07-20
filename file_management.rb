require 'csv'

class Input
    def initialize(header, data)
        @header = header
        @data = data
    end

    def getInput
        CSV.open('file_management.csv','wb') do |csv|
            csv << @header

            @data.each do |column|
                csv << column
            end
        end
    end
end

class Add
    def initialize(data)
        @data = data
    end

    def addInput
        CSV.open('file_management.csv','a') do |csv|

            @data.each do |column|
                csv << column
            end
        end
    end
end

class Display
    def read
        CSV.open('file_management.csv', 'r') do |csv|
            puts csv
            csv.each do |column|
                puts column.inspect
            end
        end
    end
end

#Header Data
headers = ['Name', 'Age', 'City']

# Methods

if ARGV[0] == 'write'
    puts "I am IN"
    csv_data = [ARGV.drop(1)]
    csv = Input.new(headers, csv_data)
    csv.getInput
end

if ARGV[0] == 'add'
    puts "Lets Add"
    csv_data = [ARGV.drop(1)]
    csv = Add.new(csv_data)
    csv.addInput
end

if ARGV[0] == 'read'
    puts "I am Reading..."
    csv = Display.new
    csv.read
end
