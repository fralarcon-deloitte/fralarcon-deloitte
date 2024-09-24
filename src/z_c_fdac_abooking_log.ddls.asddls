@EndUserText.label: 'Consumption - Booking Approval'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_FDAC_ABOOKING_LOG
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
      _Travel : redirected to parent Z_C_FDAC_ATRAVEL_LOG,
      _Customer,
      _Carrier
      
}
