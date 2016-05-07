require_relative 'entry'
class AddressBook
	attr_accessor :entries
	def initialize
		@entries = []
	end
	def add_entry(name, phone_number, email)
		i = 0
		entries.each do |x|
			if name < entry.name
				break
			end
			i += 1
		end
		entries.insert(i, Entry.new(name, phone_number, email))
	end			


end