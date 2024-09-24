@AbapCatalog.sqlViewName: 'ZVFDBOOKING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking'
define view Z_I_FDAC_BOOKING_LOG
  /*  as select from zfd_booksupp_log as BookingSupplement
    association        to parent z_i_fdac_booking_log as _Booking        on  $projection.travelid   = _Booking.travelid
                                                                         and $projection.booking_id = _Booking.booking_id
    association [1..1] to z_i_fdac_travel_log         as _Travel         on  $projection.travelid = _Travel.travelid
    association [1..1] to /DMO/I_Supplement           as _Product        on  $projection.supplement_id = _Product.SupplementID
    association [1..*] to /DMO/I_SupplementText       as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID */
  as select from zfd_booking_log as Booking
  composition [0..*] of Z_I_FDAC_BOOKSUPP_LOG as _BookingSupplement
  association        to parent Z_I_FDAC_TRAVEL_LOG   as _Travel on $projection.TravelId = _Travel.TravelId
  association [1..1] to /dmo/customer         as _Customer      on $projection.CustomerId = _Customer.customer_id
  association [1..1] to /dmo/carrier          as _Carrier       on $projection.CarrierId = _Carrier.carrier_id
  association [1..*] to /dmo/connection       as _Connection    on $projection.ConnectionId = _Connection.connection_id
  //  association [1..1] to I_Currency            as _Currency      on $projection.CurrencyCode = _Currency.Currency

{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as CarrierId,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      @Semantics.amount: {
          currencyCode: 'CurrencyCode'
      }
      flight_price          as FlightPrice,
      @Semantics: {
          currencyCode: true
      }
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,
      last_change_at        as LastChangeAt,
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
