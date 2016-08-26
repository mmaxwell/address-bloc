require_relative "entry"

class AddressBook
    attr_reader :entries
    
    def initialize
        @entries = []
    end
    
    def add_entry(name, phone_number, email)
        index = 0
        
        entries.each do | entry |
            if name < entry.name
                break
            end
            
            index += 1
        end
        
        entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    def remove_entry(name, phone_number, email) 
        # Find the index of the entry with the name, phone number, and email provided
        index = entries.index { | entry | entry.name == name && entry.phone_number && entry.email == email }
        # If the entry is not found, index will be nil and delete_at will error, so
        # only delete if the index is not nil.
        entries.delete_at index unless index.nil?
    end
end