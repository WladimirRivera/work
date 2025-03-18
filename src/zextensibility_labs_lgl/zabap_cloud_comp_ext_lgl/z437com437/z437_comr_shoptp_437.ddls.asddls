@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forShop'
@ObjectModel.sapObjectNodeType.name: 'Z437_COMShop_437'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ '_Extension' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity Z437_COMR_ShopTP_437
  as select from Z437_COMI_Shop_437 as Shop
  association [1] to Z437_COME_Shop_437 as _Extension on $projection.OrderUUID = _Extension.OrderUUID
{
  key OrderUUID,
  OrderID,
  OrderedItem,
  CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  OrderItemPrice,
  DeliveryDate,
  OverallStatus,
  Notes,
  @Semantics.systemDateTime.lastChangedAt: true
  LastChangedAt,
  @Semantics.user.createdBy: true
  CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  LocalLastChangedBy,
  @Semantics.user.lastChangedBy: true
  LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LocalLastChangedAt,
  _Extension
  
}
