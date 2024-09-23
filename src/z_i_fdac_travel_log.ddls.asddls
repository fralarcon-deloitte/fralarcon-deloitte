@AbapCatalog.sqlViewName: 'ZVFDTRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Travel'
define root view Z_I_FDAC_TRAVEL_LOG
  as select from zfd_travel_log as travel
  composition [0..*] of Z_I_FDAC_BOOKING_LOG as _Booking
  association [0..1] to /dmo/agency          as _Agency   on $projection.AgencyId     = _Agency.agency_id
  association [0..1] to /dmo/customer        as _Customer on $projection.CustomerId   = _Customer.customer_id
  association [0..1] to I_Currency           as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key travel_id       as TravelId,
      agency_id       as AgencyId,
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount: {
          currencyCode: 'CurrencyCode'
      }
      booking_fee     as BookingFee,
      @Semantics.amount: {
          currencyCode: 'CurrencyCode'
      }
      total_price     as TotalPrice,
      @Semantics.currencyCode: true
      currency_code   as CurrencyCode,
      description     as Description,
      overall_status  as OverallStatus,
      @Semantics.user: {
          createdBy: true
      }
      created_by      as CreatedBy,
      @Semantics.systemDateTime: {
          createdAt: true
      }
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Booking,
      _Agency,
      _Customer,
      _Currency
}
