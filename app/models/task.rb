class Task < ActiveRecord::Base
 WORK_PERCENTAGES = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
 belongs_to :portfolio

 validates :title, :description, :start_date, :due_date, presence: true
 validate :dates_must_make_sense
# validates :done, inclusion: WORK_PERCENTAGES

 after_validation :check_start_date
 after_validation :check_end_date
 

 private
  def dates_must_make_sense
   if due_date <= start_date
    errors.add(:start, ' date has to be before the due date')
   end
  end

  def check_start_date
   ppa = Portfolio.find(portfolio_id)
   if start_date < ppa.start
    errors.add(:start_date, "Start date should be within PPA's implementation date.")
   end
  end

  def check_end_date
   ppa = Portfolio.find(portfolio_id)
   if due_date > ppa.completion
    errors.add(:due_date, "Due date should be within PPA's implementation date.")
   end
  end
end
