class Income::Params
  def self.to_save(params)
    params.require(:income).permit(
      :description,
      :card_id,
      :group_id,
      :category_id,
      :income_type,
      :end_at,
      income_recurrents_attributes: [
        :id, :date, :value, :_destroy
      ]
    ).merge(
      quantity: params[:quantity],
      value: params[:value],
      date: params[:date]
    )
  end
end
