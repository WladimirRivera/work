CLASS zcl_10_modify_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_modify_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*   Modify one record
    MODIFY zemployee_c345 FROM @( VALUE #( employeeid = 7
                                          first_name = 'Lenovo'
                                          role = 2
                                          adress-num = 60
                                          salary_amount = '850.99' ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were updated| ).
    ENDIF.

**   Modify multiple records
*    MODIFY zemployee_c345 FROM TABLE @( VALUE #( ( employeeid = 1
*                                                  first_name = 'Lenovo'
*                                                  role = 2
*                                                  adress-num = 90
*                                                  salary_amount = '850.99' )
*
*                                                  ( employeeid = 10
*                                                  first_name = 'MSI'
*                                                  role = 2
*                                                  adress-num = 90
*                                                  salary_amount = '850.99' ) ) ).
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were updated| ).
*    ENDIF.
  ENDMETHOD.

ENDCLASS.
