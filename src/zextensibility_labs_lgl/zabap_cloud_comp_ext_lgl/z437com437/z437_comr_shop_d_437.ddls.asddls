@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Draft query view forShop'
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: false, 
  dataSources: [ 'Shop' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity Z437_COMR_Shop_D_437
  as select from Z437COMSH00D_437 as Shop
{
  key OrderUUID as OrderUUID,
  OrderID as OrderID,
  OrderedItem as OrderedItem,
  CurrencyCode as CurrencyCode,
  OrderItemPrice as OrderItemPrice,
  DeliveryDate as DeliveryDate,
  OverallStatus as OverallStatus,
  Notes as Notes,
  LastChangedAt as LastChangedAt,
  CreatedBy as CreatedBy,
  CreatedAt as CreatedAt,
  LocalLastChangedBy as LocalLastChangedBy,
  LastChangedBy as LastChangedBy,
  LocalLastChangedAt as LocalLastChangedAt,
  draftentitycreationdatetime as Draftentitycreationdatetime,
  draftentitylastchangedatetime as Draftentitylastchangedatetime,
  draftadministrativedatauuid as Draftadministrativedatauuid,
  draftentityoperationcode as Draftentityoperationcode,
  hasactiveentity as Hasactiveentity,
  draftfieldchanges as Draftfieldchanges
  
}
