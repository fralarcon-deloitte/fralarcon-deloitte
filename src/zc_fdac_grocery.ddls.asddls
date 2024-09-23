@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_FDAC_GROCERY
  provider contract transactional_query
  as projection on ZR_FDAC_GROCERY
{
  key Id,
  @Search: {
      defaultSearchElement: true
  }
  Product,
  @Search: {
      defaultSearchElement: true
  }
  Category,
  @Search: {
      defaultSearchElement: true
  }
  Brand,
  Price,
  @Semantics.currencyCode: true
  Currency,
  Quantity,
  Purchasedate,
  Expirationdate,
  Expired,
  Rating,
  Note,
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat,
  Locallastchanged
  
}
