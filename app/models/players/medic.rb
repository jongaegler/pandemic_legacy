class Medic < Character
  def move(city)
    Disease.cured.each { |disease| cure(city, disease.color) }
    super
  end

  def treat_all?(_color)
    true
  end
end
