class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  validates :fname, :lname, :age, :gender, :height, :weight, :physical_activity, presence: true

  def total_cal

    formula_female = (((weight * 4.35) + (height * 4.7)) - (age * 4.7)) + 655
    formula_male = (((weight * 6.23) + (height * 12.7)) - (age * 6.8)) + 66

    if gender == "female" && physical_activity == "none"
      formula_female * 1.2
    elsif gender == "female" && physical_activity == "light"
      formula_female * 1.375
    elsif gender == "female" && physical_activity == "moderate"
      formula_female * 1.55
    elsif gender == "female" && physical_activity == "active"
      formula_female * 1.725

    elsif gender == "male" && physical_activity == "none"
      formula_male * 1.2
    elsif gender == "male" && physical_activity == "light"
      formula_male * 1.375
    elsif gender == "male" && physical_activity == "moderate"
      formula_male * 1.55
    else gender == "male" && physical_activity == "active"
      formula_male * 1.725
    end
  end


end
