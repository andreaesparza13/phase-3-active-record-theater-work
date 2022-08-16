class Role < ActiveRecord::Base
   has_many :auditions

   def self.actors
      self.audtions.pluck(:actor)
   end

   def self.locations
      self.audtions.pluck(:location)
   end

   def self.lead
      self.actors.find_by(:lead = true)
   end

   def self.understudy
      self.actors.find_by(:lead = true)[1]
   end
end