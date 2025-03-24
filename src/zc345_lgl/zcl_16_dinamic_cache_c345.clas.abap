CLASS zcl_16_dinamic_cache_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_16_dinamic_cache_c345 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM zemployee_c345
          FIELDS employeeid,
                SUM( salary_amount ) AS salary_sum
            GROUP BY employeeid
      INTO TABLE @DATA(lt_sum_salary).

    IF sy-subrc EQ 0.
      out->write( lt_sum_salary ).
    ELSE.
      out->write( 'Unsuccessful Query' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
