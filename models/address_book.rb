require_relative 'entry'
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


end