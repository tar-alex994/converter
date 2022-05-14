module Pagination 
  def get_a_current_page
    page = (params[:current_page]&.match(/\A\d+/)&.to_s&.to_i || 1)
    page = 1 if page == 0
    page > @last_page ? @last_page : page
  end

  def get_a_last_page(total_elements)
    page  = total_elements / @page_size
    page += 1 unless (total_elements % @page_size) == 0
    page == 0 ? 1 : page
  end

  def get_an_offset
    (@current_page - 1) * @page_size
  end
end