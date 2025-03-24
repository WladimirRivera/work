CLASS zcl_12_rollback_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_rollback_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**   Commit Work
*    INSERT zemployee_c345 FROM @( VALUE #( employeeid = 21
*                                          first_name = 'ONE PLUS'
*                                          role = 10
*                                          adress-num = 200
*                                          salary_amount = '25.99' ) ).
*    COMMIT WORK AND WAIT.
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were added| ).
*    ENDIF.

*   Rollback Work
    UPDATE zemployee_c345  SET salary_amount = '20.99'
                          WHERE employeeid = 6.

    ROLLBACK WORK.
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were updated| ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
