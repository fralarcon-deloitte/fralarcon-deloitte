@EndUserText.label: 'Consumption - Travel Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity Z_C_FDAC_ATRAVEL_LOG
  as projection on Z_I_FDAC_TRAVEL_LOG
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.name as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.last_name as CustomerName,
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
      _Booking,
      _Customer
}
