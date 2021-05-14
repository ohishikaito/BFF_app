module Pagination
  def pagination(resources)
    {
      pagination: {
        current_page: resources.current_page,
        prev_page: resources.prev_page,
        next_page: resources.next_page,
        limit_value: resources.limit_value,
        total_pages: resources.total_pages,
        total_count: resources.total_count
      }
    }
  end
end