@AbapCatalog.sqlViewName: 'ZVFDBOOKSPP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Booking Supplement'
define view Z_I_FDAC_BOOKSUPP_LOG
  as select from zfd_booksupp_log as BookingSupplement
  association        to parent Z_I_FDAC_BOOKING_LOG as _Booking        on  $projection.TravelId   = _Booking.TravelId
                                                                       and $projection.BookingId = _Booking.BookingId
  association [1..1] to Z_I_FDAC_TRAVEL_LOG         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement           as _Product        on  $projection.SupplmentId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText       as _SupplementText on  $projection.SupplmentId = _SupplementText.SupplementID
  
  
  
  
/*  
association to parent Z_I_FDAC_BOOKING_LOG as _Booking on $projection.TravelId  = _Booking.TravelId
                                                      and $projection.BookingId = _Booking.BookingId 
association [1..1] to Z_I_FDAC_TRAVEL_LOG        as _Travel         on $projection.TravelId     = _Travel.TravelId 
association [1..1] to /DMO/I_Supplement          as _Product        on $projection.SupplmentId = _Product.SupplementID
association [1..*] to /DMO/I_SupplementText      as _SupplementText on $projection.SupplmentId = _SupplementText.SupplementID*/  
/*  association        to parent Z_I_FDAC_BOOKING_LOG as _Booking        on  $projection.TravelId    = _Booking.TravelId
                                                                       and $projection.BookingId   = _Booking.BookingId
  association [1..1] to Z_I_FDAC_TRAVEL_LOG         as _Travel         on  $projection.TravelId    = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement           as _Product        on  $projection.SupplmentId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText       as _SupplementText on  $projection.SupplmentId = _SupplementText.SupplementID*/
{
  key travel_id                         as TravelId,
  key booking_id                        as BookingId,
  key BookingSupplement.booking_supp_id as BookingSuppId,

      supplment_id                      as SupplmentId,
      @Semantics: {
          amount: {
              currencyCode: 'currency'
          }
      }
      price                             as Price,
      @Semantics: { currencyCode: true }
      currency                          as Currency,
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
