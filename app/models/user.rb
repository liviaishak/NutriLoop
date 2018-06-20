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
        (formula_female * 1.2).to_d
      elsif gender == "female" && physical_activity == "light"
        (formula_female * 1.375).to_d
      elsif gender == "female" && physical_activity == "moderate"
        (formula_female * 1.55).to_d
      elsif gender == "female" && physical_activity == "active"
        (formula_female * 1.725).to_d

      elsif gender == "male" && physical_activity == "none"
        (formula_male * 1.2).to_d
      elsif gender == "male" && physical_activity == "light"
        (formula_male * 1.375).to_d
      elsif gender == "male" && physical_activity == "moderate"
        (formula_male * 1.55).to_d
      else gender == "male" && physical_activity == "active"
        (formula_male * 1.725).to_d
      end
   end

   def total_carbs
     self.total_cal * 0.5
   end

   def total_proteins
     self.total_cal * 0.2
   end

   def total_fats
     self.total_cal * 0.3
   end
end
