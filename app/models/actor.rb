class Actor < ActiveRecord::Base
  
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end 
  
  def list_roles
    roles =  []
    character_list = self.characters.map {|c| c.name}
    show_list = self.shows.map {|s| s.name}
    role = character_list.concat(show_list)
    roles << role.join(" - ")
    roles
  end 
end