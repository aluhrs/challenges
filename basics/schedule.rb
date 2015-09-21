#     Relativity
# Diff Eq  IntroPhy
# Calc     SciThin

class Schedule
  attr_accessor :courses, :course_schedule

  def initialize
    @courses = {
      "relativity": [ "diff_eq", "intro_phy" ],
      "diff_eq": [ "calc" ],
      "intro_phy": [ "sci_thin" ],
      "calc": [ ],
      "sci_thin": [ ]
    }
    @course_schedule = []
  end

  def create_schedule
    while !courses.empty?
      check_courses
    end
  end

  def check_courses
    courses.each do |course|
      add_to_course_schedule(course)
    end
  end

  def add_to_course_schedule(course)
    if take_class_next?(course)
      course_schedule << course[0].to_s
      courses.delete(course[0])
      puts "#{course[0]}"
    end
  end

  def take_class_next?(course)
    !already_taken?(course) && met_prereqs?(course)
  end

  def met_prereqs?(course)
    courses.each do |name, prereqs|
      if course[0] == name
        if prereqs.empty?
          return true
        else
          prereqs.each do |p|
            if already_taken?(p)
              return true
            end
          end
          return false
        end
      end
    end
  end

  def already_taken?(course)
    course_schedule.include?(course)
  end
end
