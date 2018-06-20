class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fname, :lname, :age, :gender, :height, :weight, :physical_activity, presence: true

    def total_cal

      formula_female = (((weight * 4.35) + (height * 4.7)) - (age * 4.7)) + 655
      formula_male = (((weight * 6.23) + (height * 12.7)) - (age * 6.8)) + 66

      if gender == "female" && physical_activity == "none"
        @total_cal = (formula_female * 1.2).to_d
      elsif gender == "female" && physical_activity == "light"
        @total_cal = (formula_female * 1.375).to_d
      elsif gender == "female" && physical_activity == "moderate"
        @total_cal = (formula_female * 1.55).to_d
      elsif gender == "female" && physical_activity == "active"
        @total_cal = (formula_female * 1.725).to_d

      elsif gender == "male" && physical_activity == "none"
        @total_cal = (formula_male * 1.2).to_d
      elsif gender == "male" && physical_activity == "light"
        @total_cal = (formula_male * 1.375).to_d
      elsif gender == "male" && physical_activity == "moderate"
        @total_cal = (formula_male * 1.55).to_d
      else gender == "male" && physical_activity == "active"
        @total_cal = (formula_male * 1.725).to_d
      end
      @total_cal
   end

   def total_carbs
     tot_carb = @total_cal * 0.5
     self.update_attributes(:carb => tot_carb)
     carb
   end

   def total_proteins
     tot_prot = @total_cal * 0.2
     self.update_attributes(:protein => tot_prot)
     protein
   end

   def total_fats
     tot_fat = @total_cal * 0.3
     self.update_attributes(:fat => tot_fat)
     fat
   end
end
