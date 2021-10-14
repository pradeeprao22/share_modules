class DeleteVisitordetailsJob < ApplicationJob
    def delete_details
      # Date logic
      if VisitornewDetail.all.count > 10000
        VisitornewDetail.last(500).delete
      end
    end
end