class Paper < ActiveRecord::Base
belongs_to :user	


  PAPER_TYPES = [['Skrifstofupappír'], ['Dagblaðapappír'], ['Glans_&_tímaritapappír'], ['Annað']]

 def paper_weight_per_capita(current_user)
    paper_weight.to_i / current_user.profile.staff
  end

  def paper_weight_env_ratio
    (( env_paper_weight.to_f / paper_weight.to_f)* 100)
  end

  def paper_weight_trees_ratio
    (( paper_weight.to_f/1000)*15)
  end

end


