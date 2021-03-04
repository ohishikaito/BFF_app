module Pagination
  def resources_with_pagination(resources)
    {
      current_page: resources.current_page,
      prev_page: resources.prev_page,
      next_page: resources.next_page,
      total_pages: resources.total_pages,
      total_count: resources.total_count
    }
  end
end