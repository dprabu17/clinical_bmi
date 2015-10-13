require "clinical_bmi/version"

class ClinicalBmi
  attr_accessor :weight, :height

  def bmi
    handle_error unless weight && height
    calculateBMI
  end

  def hints
    casses(calculateBMI)
  end

  private

  def calculateBMI
    ((weight * 703.06957964) / (height * height)).round
  end

  def casses(result)
    case
    when result < 18.5
      msg = "Underweight"
    when result.between?(18.5,25)
      msg = "Normal"
    when result.between?(25,30)
      msg = "Overweight"
    when result.between?(30,35)
      msg = "Obese Class I"
    when result.between?(35,40)
      msg = "Obese Class II"
    when result > 40
      msg = "Obese Class III"
    end
    return msg
  end

  def handle_error
    if weight
      raise StandardError, 'height can not be empty'
    else
      raise StandardError, 'weight can not be empty'
    end
  end
end
