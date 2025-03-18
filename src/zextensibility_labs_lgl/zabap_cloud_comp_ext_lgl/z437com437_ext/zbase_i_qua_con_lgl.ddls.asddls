@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Base Quality Control'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zbase_i_qua_con_lgl
  as select from zquality_con_lgl
{
  key order_uuid            as OrderUuid,
  key review_id             as ReviewId,
      ordered_item          as OrderedItem,
      rating                as Rating,
      free_text_comment     as FreeTextComment,
      helpful_count         as HelpfulCount,
      helpful_total         as HelpfulTotal,
      supervisor            as Supervisor,
      sup_name              as SupName,
      local_created_at      as LocalCreatedAt,
      local_last_changed_at as LocalLastChangedAt
}
