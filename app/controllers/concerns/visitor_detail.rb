module VisitorDetail 
   extend ActiveSupport::Concern

   def getdetails action
    ip = request.ip
    @visitor_details = VisitornewDetail.create(ip: ip, page: action)
    if request.location.city != nil && request.location.country != nil
      @visitor_details.update(city: request.location.city, country: request.location.country)
    end
   end 
end