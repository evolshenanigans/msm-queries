class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/lists"})
  end
end
