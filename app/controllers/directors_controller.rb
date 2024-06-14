class DirectorsController < ApplicationController
  def index
    render ({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({:id => the_id})

    @the_director = matching_records.at(0)

    render({:template =>"director_templates/details"})
  end

  def junior
    junior_records = Director.where.not({ :dob => nil }).order({ :dob => :desc })
    @junior_director = junior_records.at(0)
    render({:template =>"director_templates/junior_result"})
  end

  def older
    eldest_records = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @eldest_director = eldest_records.at(0)
    render({:template =>"director_templates/older_result"})

  end



end
