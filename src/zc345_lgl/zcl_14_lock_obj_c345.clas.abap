CLASS zcl_14_lock_obj_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_14_lock_obj_c345 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |Trying to update employee| ).

*   Get Instance of Lock Object
    TRY.
        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance(
        iv_name =  'EZ_EMPLOYEE_C345' ).
      CATCH cx_abap_lock_failure.
        out->write( |Lock Object Instance Not Created| ).
    ENDTRY.

*   Get the write lock object for component employeeid
    DATA lt_parametr TYPE if_abap_lock_object=>tt_parameter.

    lt_parametr = VALUE #( (  name = 'employeeid'
                              value = REF #( '1' ) ) ).
    TRY.
        lo_lock_object->enqueue( it_parameter  = lt_parametr  ).
      CATCH cx_abap_foreign_lock cx_abap_lock_failure.
        out->write( |Not possible to write on the database. Object is Locked| ).
        RETURN.
    ENDTRY.

*   Add timeout to check lock object
    WAIT UP TO 10 SECONDS.

*   Adding records to the table using Modify
    MODIFY zemployee_c345 FROM TABLE @( VALUE #( ( employeeid = '1'
                                                    first_name = 'employee'
                                                    role = '1'
                                                    salary_amount = '300.55'
                                                    salary_currency = 'USD'
                                                    adress-num = '6' ) ) ).
    IF sy-subrc EQ 0.
      out->write( |Rows Affected: { sy-dbcnt }| ).
    ENDIF.

    TRY.
        lo_lock_object->dequeue( it_parameter  = lt_parametr  ).
      CATCH cx_abap_lock_failure.
        out->write( |Locked Object was released| ).
        RETURN.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
