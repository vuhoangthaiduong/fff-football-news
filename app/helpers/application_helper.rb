module ApplicationHelper
  
  def get_no_in_table(index)
    page = params[:page].nil? ? 0 : params[:page].first.to_i - 1
    return page * 10 + index.to_i
  end

end
