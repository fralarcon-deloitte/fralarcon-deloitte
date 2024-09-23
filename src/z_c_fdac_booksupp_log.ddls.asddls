@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption - Booking Supplement'
define view entity Z_C_FDAC_BOOKSUPP_LOG
  as projection on Z_I_FDAC_BOOKSUPP_LOG
{
  key TravelId,
  key BookingId,
  key BookingSuppId as Booking_Supplement_Id,
      SupplmentId,
      _SupplementText.Description as SupplementDescription: localized,
      @Semantics.amount: {
          currencyCode: 'CurrencyCode'
      }
      Price,
      @Semantics.currencyCode: true
      Currency      as CurrencyCode,
      /* Associations */
      _Travel : redirected to Z_C_FDAC_TRAVEL_LOG,
      _Booking : redirected to Z_C_FDAC_BOOKING_LOG,
      _Product,
      _SupplementText


}
