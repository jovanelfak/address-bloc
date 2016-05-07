require_relative '../models/entry.rb'

RSpec.describe Entry do
	describe "attributes" do
		let(:entry) {Entry.new('Ada Love', '123.123.123', 'asd@asd')}
		it "should respond to name" do
			expect(entry).to respond_to(:name)
		end
		it "should report its name" do
			expect(entry.name).to eq('Ada Love')
		end
		it "should respond to phone_number" do
			expect(entry).to respond_to(:phone_number)
		end
		it "should report its phone_number" do
			expect(entry.phone_number).to eq('123.123.123')
		end
		it "should respond to email" do
			expect(entry).to respond_to(:email)
		end
		it "should report to email" do
			expect(entry.email).to eq("asd@asd")
		end
	end
	describe "#to_s" do
		it "prints an entry as a string" do
			entry = Entry.new('Ada Love', '123.123.123', 'asd@asd')
			expected_string = "Name : Ada Love\nPhone Number: 123.123.123\nEmail:asd@asd"
		end
	end
end