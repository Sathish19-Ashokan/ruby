require 'csv'

def write(header, data)
    CSV.open('file_management.csv','wb') do |csv|
        csv << header

        data.each do |column|
            csv << column
        end
    end
end

def append(data)
    CSV.open('file_management.csv','a') do |csv|

        data.each do |column|
            csv << column
        end
    end
end

def read
    CSV.foreach('file_management.csv') do |row|
        puts row.inspect
    end
end


headers = ['Name', 'Age', 'City']

arr = ['Sathish', 22, 'salem']

argument = ARGV
method = argument[0]
csv_data = [argument.drop(1)]

write(headers, csv_data) if method == 'write'
append(csv_data) if method == 'append'
read if method == 'read'
