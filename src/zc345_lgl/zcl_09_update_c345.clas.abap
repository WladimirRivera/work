CLASS zcl_09_update_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_update_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**   Updating a record
*    UPDATE zemployee_c345 FROM @( VALUE #( employeeid = 1
*                                          first_name = 'Lenovo'
*                                          role = 2
*                                          adress-num = 75
*                                          salary_amount = '899.99' ) ).
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were updated| ).
*    ENDIF.

**   Updating multiple records
*    UPDATE zemployee_c345 FROM TABLE @( VALUE #( ( employeeid = 2
*                                                  first_name = 'ASUS'
*                                                  role = 2
*                                                  adress-num = 75
*                                                  salary_amount = '120' )
*
*                                                ( employeeid = 3
*                                                  first_name = 'Lenovo'
*                                                  role = 2
*                                                  adress-num = 75
*                                                  salary_amount = '120' ) ) ).
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were updated| ).
*    ENDIF.
*
**   Updating columns
*    UPDATE zemployee_c345  SET salary_amount = 50
*                          WHERE role eq 2.
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were updated| ).
*    ENDIF.
*
*   Updating columns with expressions
    UPDATE zemployee_c345  SET salary_amount = salary_amount + 50
                          WHERE employeeid ge 1.
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were updated| ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
