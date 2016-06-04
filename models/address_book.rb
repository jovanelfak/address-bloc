require_relative 'entry'
require "csv"

class AddressBook
	attr_accessor :entries
	def initialize
		@entries = []
	end
	def add_entry(name, phone_number, email)
		i = 0
		entries.each do |x|
			if name < x.name
				break
			end
			i += 1
		end
		entries.insert(i, Entry.new(name, phone_number, email))
	end	
	def remove_entry(name, phone_number, email)
		del_entry = nil
		@entries.each do |x| 
			if name == x.name && phone_number == x.phone_number && email == x.email
				del_entry = x
			end
		end
		@entries.delete(del_entry)

	end		
	def import_from_csv(file_name)
		csv_text = File.read(file_name)
		csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

		csv.each do |row|
			row_hash = row.to_hash
			add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])

		end
	end
	def iterative_search(name)
		@entries.each do |entry|
			if entry.name == name
				return entry
			end
		end
		return nil
	end
	def binary_search(name)
		lower = 0
     	upper = entries.length - 1
 
     # #2
     	while lower <= upper
       # #3
       	mid = (lower + upper) / 2
       	mid_name = entries[mid].name
 
       # #4
       	if name == mid_name
         return entries[mid]
       	elsif name < mid_name
         upper = mid - 1
       	elsif name > mid_name
         lower = mid + 1
       	end
     end
 
     # #5
     	return nil
	end
end