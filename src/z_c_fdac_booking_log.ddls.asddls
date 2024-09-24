@EndUserText.label: 'Consumption - Booking'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_FDAC_BOOKING_LOG
  as projection on Z_I_FDAC_BOOKING_LOG
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      _Carrier.name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount: {
          currencyCode: 'CurrencyCode'
      }
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      BookingStatus,
      LastChangeAt,
      /* Associations */
      _Travel : redirected to parent Z_C_FDAC_TRAVEL_LOG,
      _BookingSupplement : redirected to composition child Z_C_FDAC_BOOKSUPP_LOG,
      _Carrier,
      _Connection,
      _Customer
}
