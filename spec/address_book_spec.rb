require_relative '../models/address_book'

RSpec.describe AddressBook do 
	let(:book) {AddressBook.new}

	def check_entry(entry, expected_name, expected_number, expected_email)
		expect(entry.name).to eq expected_name
		expect(entry.phone_number).to eq expected_number
		expect(entry.email).to eq expected_email

	end
	describe "attributes" do
		it "respond to entries" do
			expect(book).to respond_to(:entries)
		end

		it "initializes entries as an array" do
			book = AddressBook.new
			expect(book.entries.size).to eq(0)
		end
	end
	describe "#add_entry" do
		it "adds only one entry to the address book" do
			book.add_entry('Ada Love', '123.123.123', 'asd@asd')			  
			expect(book.entries.size).to eq(1)
		end
		it "adds the correct information to entries" do
			book.add_entry('Ada Love', '123.123.123', 'asd@asd')
			new_entry = book.entries[0]

			expect(new_entry.name).to eq('Ada Love')
			expect(new_entry.phone_number).to eq('123.123.123')
			expect(new_entry.email).to eq('asd@asd')
		end
	end
	describe "#remove_entry" do
		it "removes only one entry out of the address book" do
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
	describe "#import_from_csv" do
		it "imports the correct number of entries" do
			book.import_from_csv("entries.csv")

			expect(book.entries.size).to eq 5

		end
		it "imports the 1st entry" do
			book.import_from_csv("entries.csv")
			entry_one = book.entries[0]

		check_entry(entry_one,"Bob", "555-555-123", "asd@asd")
		end
		it "import the 2nd entry" do
			book.import_from_csv("entries.csv")
			entry_two = book.entries[1]
			check_entry(entry_two, "Joe", "555-555-124", "asd@asd")

		end
		it "imports the 3rd entry" do
			book.import_from_csv("entries.csv")
			entry_three = book.entries[2]
			check_entry(entry_three, "Johnny", "555-555-125", "asd@asd")
		end
		it "imports the 4th entry" do
			book.import_from_csv("entries.csv")
			entry_four = book.entries[3]
			check_entry(entry_four, "Cona", "555-555-126", "asd@asd")
		end
		it "imports the 5th entry" do
			book.import_from_csv("entries.csv")
			entry_five = book.entries[4]
			check_entry(entry_five, "Dzoni", "555-555-127", "asd@asd")
		end
	end

end