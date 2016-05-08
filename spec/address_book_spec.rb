require_relative '../models/address_book'

RSpec.describe AddressBook do 
	describe "attributes" do
		it "respond to entries" do
			book = AddressBook.new
			expect(book).to respond_to(:entries)
		end

		it "initializes entries as an array" do
			book = AddressBook.new
			expect(book.entries.size).to eq(0)
		end
	end
	describe "#add_entry" do
		it "adds only one entry to the address book" do
			book = AddressBook.new
			book.add_entry('Ada Love', '123.123.123', 'asd@asd')			  
			expect(book.entries.size).to eq(1)
		end
		it "adds the correct information to entries" do
			book = AddressBook.new
			book.add_entry('Ada Love', '123.123.123', 'asd@asd')
			new_entry = book.entries[0]

			expect(new_entry.name).to eq('Ada Love')
			expect(new_entry.phone_number).to eq('123.123.123')
			expect(new_entry.email).to eq('asd@asd')
		end
	end
	describe "#remove_entry" do
		it "removes only one entry out of the address book" do
			book = AddressBook.new
			book.add_entry("Misa Zivkovic","123.123.123", "asd@asd")

			name = "Ada Love"
			phone_number = "123.123.123"
			email = "asd@asd"
			book.add_entry(name, phone_number, email)
			expect(book.entries.size).to eq(2)
			book.remove_entry(name, phone_number, email)
			expect(book.entries.size).to eq(1)
			expect(book.entries.first.name).to eq("Misa Zivkovic")


		end		
	end

end