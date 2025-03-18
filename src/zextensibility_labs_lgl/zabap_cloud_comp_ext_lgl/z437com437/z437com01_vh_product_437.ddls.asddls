@ObjectModel.query.implementedBy: 'ABAP:ZRAPLG_CL_VH_PRODUCT_437'
@EndUserText.label: 'Value help for products'
define custom entity Z437COM01_VH_Product_437
{
  key Product : abap.char( 40 );
  ProductText : abap.char( 40 );
  ProductGroup : abap.char( 40 );
  @Semantics.amount.currencyCode: 'Currency'
  Price : abap.curr( 15, 2 );
  Currency : abap.cuky;
  BaseUnit : abap.unit( 3 );
  
}
