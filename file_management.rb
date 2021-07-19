require 'csv'

class Csv
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
end

#Header Data
headers = ['Name', 'Age', 'City']

# getting command line value
argument = ARGV
# first value as method
method = argument[0]
# other values as data
csv_data = [argument.drop(1)]
# csv object
csv = Csv.new

#Methods
csv.write(headers, csv_data) if method == 'write'
csv.append(csv_data) if method == 'append'
csv.read if method == 'read'
