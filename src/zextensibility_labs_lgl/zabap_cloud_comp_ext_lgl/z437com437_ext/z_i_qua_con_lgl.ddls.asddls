@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Interface Quality Control'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_i_QUA_CON_LGL
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
      _Shop : redirected to parent Z437_COMI_ShopTP_437
}
