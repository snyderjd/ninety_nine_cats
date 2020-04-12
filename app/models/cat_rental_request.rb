class CatRentalRequest < ApplicationRecord

    STATUSES = ['PENDING', 'APPROVED', 'DENIED'].freeze()

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: STATUSES #status must be included in STATUSES
    validate :start_must_come_before_end
    validate :does_not_overlap_approved_request

    belongs_to :cat

    after_initialize :assign_pending_status

    def denied?
        self.status == 'DENIED'
    end

    private
    
    def assign_pending_status
        self.status ||= 'PENDING'
    end

    def overlapping_requests
        # select CatRentalRequests where: 
        # id is not the id of this CatRentalRequest (other requests)
        # cat_id is the same as thie request's id
        # start_date of either this request or the other request is not greater than end_date

        CatRentalRequest
            .where.not(id: self.id)
            .where(cat_id: cat_id)
            .where.not('start_date > :end_date OR end_date < :start_date',
                        start_date: start_date, end_date: end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end

    def overlapping_pending_requests
        overlapping_requests.where(status: 'PENDING')
    end

    def does_not_overlap_approved_request
        # A denied request doesn't need to be checked. A pending request should be checked - users shouldn't be able to make requests for periods during which a cat has already been spoken for
        return if self.denied?

        unless overlapping_approved_requests.empty?
            errors[:base] << 'Request conflicts with an existing approved request.'
        end
    end

    def start_must_come_before_end
        return if start_date < end_date
        errors[:start_date] << 'Must come before end date'
        errors[:end_date] << 'Must come after start date'
    end
    
end

 