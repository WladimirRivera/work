@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Root Quality Control'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z_r_qua_con_lgl
  as select from zbase_i_qua_con_lgl
  association to parent Z437_COMR_ShopTP_437 as _Shop on _Shop.OrderUUID = $projection.OrderUuid
{
  key OrderUuid,
  key ReviewId,
      OrderedItem,
      Rating,
      FreeTextComment,
      HelpfulCount,
      HelpfulTotal,
      Supervisor,
      SupName,
      LocalCreatedAt,
      LocalLastChangedAt,
      _Shop // Make association public
}
