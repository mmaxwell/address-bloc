require_relative "../models/address_book"

RSpec.describe AddressBook do
    describe "attributes" do
        let (:book) { AddressBook.new }
        
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry("Ada Lovelace", "010.012.1815", "augusta.king@lovelace.com")
            
            expect(book.entries.size).to eq(1)
        end
 
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry("Ada Lovelace", "010.012.1815", "augusta.king@lovelace.com")
            new_entry = book.entries[0]
 
            expect(new_entry.name).to eq("Ada Lovelace")
            expect(new_entry.phone_number).to eq("010.012.1815")
            expect(new_entry.email).to eq("augusta.king@lovelace.com")
        end
    end
    
    describe "#remove_entry" do
        it "removes only one entry" do
            book = AddressBook.new
            book.add_entry("Ada Lovelace", "010.012.1815", "augusta.king@lovelace.com")
            book.add_entry("Peter Griffin", "123.867.5309", "p@griffin.com")
            
            book.remove_entry("Peter Griffin", "123.867.5309", "p@griffin.com")
            expect(book.entries.size).to eq(1)
        end
        
        it "removes the correct entry" do
            book = AddressBook.new
            book.add_entry("Ada Lovelace", "010.012.1815", "augusta.king@lovelace.com")
            book.add_entry("Peter Griffin", "123.867.5309", "p@griffin.com")
            book.add_entry("Louis Griffin", "123.867.5310", "l@griffin.com")
            
            book.remove_entry("Peter Griffin", "123.867.5309", "p@griffin.com")
            
            expect(book.entries[0].name).to eq("Ada Lovelace")
            expect(book.entries[1].name).to eq("Louis Griffin")
        end
    end
end