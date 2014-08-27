class Student < ActiveRecord::Base

  attr_writer :current_step

  validates_presence_of :first_name, :if => lambda { |o| o.current_step == "first" }  

  def current_step
    @current_step || steps.first
  end

COURSES = ['SAT', 'TOEFL']

  def steps
    %w[first second]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
  steps.all? do |step|
    self.current_step = step
    valid?
  end
  end

end
