class Paper < ActiveRecord::Base
belongs_to :user	

def paper_weight_per_capita(current_user)
    paper_weight.to_i / current_user.profile.staff
  end

  def paper_weight_env_ratio
    (( env_paper_weight / paper_weight)* 100)
  end

  def paper_weight_trees_ratio
    (( paper_weight.to_f/1000)*15)
  end

end


