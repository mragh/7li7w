#Modify the CSV application to support an each method to return a CsvRow object. Use method_missing on that 
# CsvRow to return the value for the column for a given heading.
# e.g. csv = RubyCsv.new
#      csv.each {|row| puts row.one}

class CsvRow
    def initialize row, headers
        @contents = row
        @headers = headers
    end

    def to_s
        "CsvRow #{@contents}"
    end

    def to_ary
        @contents
    end

    def method_missing name, *args
        index = @headers.find_index(name.to_s)
        if index
            return @contents[index]
        else
            return ""
        end
    end
end

module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << CsvRow.new(row.chomp.split(', '), headers)
            end
        end

        attr_accessor :headers, :csv_contents
        def initialize
            read
        end

        def each(&block)
            @csv_contents.each(&block)
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts "row one: #{row.one}" }