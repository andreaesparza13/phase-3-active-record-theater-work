class Role < ActiveRecord::Base
   has_many :auditions

   def actors
      self.audtions.pluck(:actor)
   end

   def locations
      self.audtions.pluck(:location)
   end

   def lead
      if auditions.where(hired: true).length > 0
         self.auditions.find_by(hired: true)
      else 
         "no actor has been hired for this role"
      end
   end

   def understudy
      if auditions.where(hired: true).length > 1
         self.auditions.where(hired: true)[1]
      else 
         "no actor has been hired for this role"
      end
   end
end