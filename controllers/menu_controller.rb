require_relative "../models/address_book"

class MenuController
    attr_reader :address_book
    
    # Just for fun with an Enum-style thing
    module MainMenu
        VIEW_ALL = 1
        CREATE = 2
        FIND_BY_ID = 3
        SEARCH = 4
        READ_CSV = 5
        EXIT = 6
    end
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "#{MainMenu::VIEW_ALL} - View all entries"
        puts "#{MainMenu::CREATE} - Create an entry"
        puts "#{MainMenu::FIND_BY_ID} - Find an entry by ID"
        puts "#{MainMenu::SEARCH} - Search for any entry"
        puts "#{MainMenu::READ_CSV} - Import entries from a CSV"
        puts "#{MainMenu::EXIT} - Exit"
        print "Enter your selection: "
        
        selection = gets.to_i
        
        case selection
            when MainMenu::VIEW_ALL
                system "clear"
                view_all_entiries
                main_menu
            when MainMenu::CREATE
                system "clear"
                create_entry
                main_menu
            when MainMenu::FIND_BY_ID
                system "clear"
                find_by_id
                main_menu
            when MainMenu::SEARCH
                system "clear"
                search_entries
                main_menu
            when MainMenu::READ_CSV
                system "clear"
                read_csv
                main_menu
            when MainMenu::EXIT
                puts "Good-bye!"
                exit(0)
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end
    end
    
    def find_by_id
        puts "Enter the ID or e to exit"
        print "ID: "
        
        selection = gets.chomp
        
        if selection == "e"
            system "clear"
            main_menu
        else
            entry = address_book.entries[selection.to_i]
            
            if entry == nil
                puts "ID not found"
                find_by_id
            else
                puts entry.to_s
            end
        end
    end
    
    def view_all_entiries
        address_book.entries.each do | entry |
            system "clear"
            puts entry.to_s
            
            entry_submenu(entry)
        end
        system "clear"
    end
    
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        print "Enter your selection: "
        
        selection = gets.chomp
        
        case selection
            when "n"
            when "d"
            when "e"
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
    end
    
    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        
        print "Name: "
        name = gets.chomp
        
        print "Phone number: "
        phone = gets.chomp
        
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        
        system "clear"
        puts "New entry created"
    end
    
    def search_entries
    end
    
    def read_csv
    end
end