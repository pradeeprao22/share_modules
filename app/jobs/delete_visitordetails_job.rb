class DeleteVisitordetailsJob < ApplicationJob
  def delete_details
    # Date logic
    return unless VisitornewDetail.all.count > 10_000

    VisitornewDetail.last(500).delete
  end
end
