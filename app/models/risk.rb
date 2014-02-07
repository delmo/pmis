class Risk < ActiveRecord::Base
 belongs_to :program
 belongs_to :project
 belongs_to :activity
end
