CLASS zcl_11_delete_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_delete_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*   Deleting a record
    DELETE zemployee_c345 FROM @( VALUE #( employeeid = 1 ) ).

    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were deleted| ).
    ENDIF.

*   Deleting multiple records
    DELETE zemployee_c345 FROM TABLE @( VALUE #( ( employeeid = 2 )
                                                ( employeeid = 3 ) ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were deleted| ).
    ENDIF.

*   Deleting records using filters
*    DELETE FROM zemployee_c345 WHERE salary_amount GT 100.
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were deleted| ).
*    ENDIF.
*  Warning delete all fields
*    DELETE FROM zemployee_c345.
  ENDMETHOD.

ENDCLASS.
