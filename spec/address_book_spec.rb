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
			check_entry(entry_two, "Cona", "555-555-124", "asd@asd")

		end
		it "imports the 3rd entry" do
			book.import_from_csv("entries.csv")
			entry_three = book.entries[2]
			check_entry(entry_three, "Dzoni", "555-555-125", "asd@asd")
		end
		it "imports the 4th entry" do
			book.import_from_csv("entries.csv")
			entry_four = book.entries[3]
			check_entry(entry_four, "Joe", "555-555-126", "asd@asd")
		end
		it "imports the 5th entry" do
			book.import_from_csv("entries.csv")
			entry_five = book.entries[4]
			check_entry(entry_five, "Johnny", "555-555-127", "asd@asd")
		end
	end
	context "importing from entries_2.csv" do
		it "imports the correct number of entries" do
			book.import_from_csv("entries_2.csv")

			expect(book.entries.size).to eq 3
		end
	end
	describe "#iterative_search" do
		it "searches AddressBook for a non-existent entry" do
			book.import_from_csv("entries.csv")
			entry = book.iterative_search("Dan")
			expect(entry).to be_nil
		end
		it "searches AddressBook for Bill" do
       		book.import_from_csv("entries.csv")
       		entry = book.iterative_search("Bill")
       		expect(entry).to be_a Entry
       		check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
     	end
     	it "searches AddressBook for Bob" do
       		book.import_from_csv("entries.csv")
      	 	entry = book.iterative_search("Bob")
       		expect(entry).to be_a Entry
       		check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
     	end
 
     	it "searches AddressBook for Joe" do
       		book.import_from_csv("entries.csv")
       		entry = book.iterative_search("Joe")
       		expect(entry).to be_a Entry
       		check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
     	end
 
     	it "searches AddressBook for Sally" do
       		book.import_from_csv("entries.csv")
       		entry = book.iterative_search("Sally")
       		expect(entry).to be_a Entry
       		check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
     	end
 
     	it "searches AddressBook for Sussie" do
       		book.import_from_csv("entries.csv")
       		entry = book.iterative_search("Sussie")
       		expect(entry).to be_a Entry
       		check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
     	end
     	it "searches AddressBook for Billy" do
       		book.import_from_csv("entries.csv")
       		entry = book.iterative_search("Billy")
       		expect(entry).to be_nil
     	end
	end
	context "#nuke" do
		it "should delete all entries" do
			book.add_entry("Ada Lovelace", "010.012.1815", "augusta.king@lovelace.com")
			book.add_entry("Ada Lovelace", "010.012.1815", "augusta.king@lovelace.com")
			book.add_entry("Ada Lovelace", "010.012.1815", "augusta.king@lovelace.com")

			book.nuke
			expect(book.entries.size).to eq 0
		end
	end
end