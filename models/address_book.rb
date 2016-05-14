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
end