@ObjectModel.query.implementedBy: 'ABAP:ZRAPLG_CL_VH_PRODUCT_LGL'
@EndUserText.label: 'Value help for products'
define custom entity ZLGEXT01_VH_Product_LGL
{
  key Product : abap.char( 40 );
  ProductText : abap.char( 40 );
  ProductGroup : abap.char( 40 );
  @Semantics.amount.currencyCode: 'Currency'
  Price : abap.curr( 15, 2 );
  Currency : abap.cuky;
  BaseUnit : abap.unit( 3 );
  
}
