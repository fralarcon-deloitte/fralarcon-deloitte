@EndUserText.label: 'Consumption - Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_FDAC_TRAVEL_LOG
  as projection on Z_I_FDAC_TRAVEL_LOG
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount: {
          currencyCode: 'CurrencyCode'
      }
      BookingFee,
      @Semantics.amount: {
          currencyCode: 'CurrencyCode'
      }
      TotalPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      Description,
      OverallStatus as TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking,
      _Currency,
      _Customer
}
