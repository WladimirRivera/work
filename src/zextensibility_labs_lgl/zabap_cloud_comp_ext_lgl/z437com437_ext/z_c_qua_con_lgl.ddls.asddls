@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Consumption Quality Control'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['ReviewId']
define view entity z_C_qua_con_lgl
  as projection on z_r_qua_con_lgl
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
      /* Associations */
      _Shop : redirected to parent Z437_COMC_ShopTP_437
}
