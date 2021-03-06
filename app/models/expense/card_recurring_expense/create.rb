class Expense::CardRecurringExpense::Create < Micro::Case
  attributes :user, :params

  validates :user, type: User
  validates :params, type: ActionController::Parameters

  def call!
    expense_params = Expense::CardRecurringExpense::Params.to_save(params)
    expense = user.expenses.create(expense_params)

    Success { { expense: expense } }
  rescue => error
    Failure(error)
  end
end
