extend view entity Z437_COMC_ShopTP_437 with
{
@UI.facet: [{
    id : 'Review',
    purpose: #STANDARD,
    type: #LINEITEM_REFERENCE,
    label: 'Reviews',
    position: 20,
    targetElement: 'ZZ_quality_ZAA'
}]
  Shop.ZZ_quality_ZAA : redirected to composition child z_C_qua_con_lgl
}
