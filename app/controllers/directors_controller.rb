class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/lists"})
  end
  def show
    the_id = params.fetch("the_id")
    matching_records = Director.where({:id => the_id})
    @the_director = matching_records.at(0)
    render({ :template => "director_templates/details"})
  end

  def junior
    youngest = Director.where.not(dob: nil).order(dob: :desc).first
    if youngest.nil?
      redirect_to(some_path, alert: "No directors found.") and return
    else
      @the_director = youngest
      render template: "director_templates/youngest"
    end
  end
  
  def senior
    eldest = Director.where.not(dob: nil).order(dob: :asc).first
    if eldest.nil?
      redirect_to(some_path, alert: "No directors found.") and return
    else
      @the_director = eldest
      render template: "director_templates/eldest"
    end
  end
  

end
