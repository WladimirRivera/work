CLASS zcl_08_insert_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_insert_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*    DELETE FROM zemployee_c345.
*   Insert a Record #1
*    DATA ls_employee TYPE zemployee_c345.
*    ls_employee-employeeid = 1.
*    ls_employee-first_name = 'Lenovo'.
*    ls_employee-role = 2.
*    ls_employee-adress-num = 1.
*    ls_employee-salary_amount = '200.05'.
*    ls_employee-salary_currency = 'USD'.
*    INSERT zemployee_c345 FROM @ls_employee.
*   Insert a Record #2
    INSERT zemployee_c345 FROM @( VALUE #( employeeid = 1
                                          first_name = 'Lenovo'
                                          role = 2
                                          adress-num = 1
                                          salary_amount = '200.05'
                                          salary_currency = 'USD' ) ).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were added| ).
    ENDIF.

**   Insert Multiple Records
*    INSERT zemployee_c345 FROM TABLE @( VALUE #( ( employeeid = 2
*                                                  first_name = 'ASUS'
*                                                  role = 2
*                                                  adress-num = 1
*                                                  salary_amount = '200.05'
*                                                  salary_currency = 'USD' )
*
*                                                  ( employeeid = 3
*                                                  first_name = 'Lenovo'
*                                                  role = 2
*                                                  adress-num = 1
*                                                  salary_amount = '200.05'
*                                                  salary_currency = 'USD' )
*
*                                                  ( employeeid = 4
*                                                  first_name = 'DELL'
*                                                  role = 2
*                                                  adress-num = 1
*                                                  salary_amount = '200.05'
*                                                  salary_currency = 'USD' )
*
*                                                  ( employeeid = 5
*                                                  first_name = 'HP'
*                                                  role = 2
*                                                  adress-num = 1
*                                                  salary_amount = '200.05'
*                                                  salary_currency = 'USD' )
*
*                                                  ( employeeid = 6
*                                                  first_name = 'APPLE'
*                                                  role = 2
*                                                  adress-num = 1
*                                                  salary_amount = '200.05'
*                                                  salary_currency = 'USD' ) ) ).
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were added| ).
*    ENDIF.
*
** Insert Multiple records with for
*    INSERT zemployee3_c345 FROM TABLE @( VALUE #( FOR i = 1 UNTIL i > 3
*                      ( employeeid = |{ 6 + i }|
*                        first_name = |Employee{ 6 + i }|
*                        role = '2'
*                        adress-num = |{ 6 + i }|
*                        salary_amount = '123'
*                        salary_currency = 'USD' )
*                       )
*     ).
**    INSERT zrole_c345 FROM TABLE @( VALUE #( FOR i = 1 UNTIL i > 3
*                      (
*                        role = i
*                        description = |Role{ i }|
*                       ) ) ).
*    IF sy-subrc EQ 0.
*      out->write( |{ sy-dbcnt } records were added| ).
*    ENDIF.
*
**   Inserting Records with Exception Handling
*    TRY.
*        INSERT zemployee_c345 FROM TABLE @( VALUE #( ( employeeid = 2
*                                                  first_name = 'ASUS'
*                                                  role = 2
*                                                  adress-num = 1
*                                                  salary_amount = '200.05'
*                                                  salary_currency = 'USD' ) ) ).
*        IF sy-subrc EQ 0.
*          out->write( |{ sy-dbcnt } records were added| ).
*        ENDIF.
*      CATCH cx_sy_open_sql_db INTO DATA(lx_error).
*        out->write( lx_error->get_text( ) ).
*        RETURN.
*    ENDTRY.

  ENDMETHOD.

ENDCLASS.
