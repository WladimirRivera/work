CLASS zcl_03_constructor_exp_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_constructor_exp_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* Value

*    DATA(lt_msg) = VALUE string_table( ( `Welcome` )
*                                       ( `Student` ) ).
*
*    out->write( data = lt_msg name = 'lt_msg' ).
*
*
*    lt_msg = VALUE #( ).
*
*
*    out->write( data = lt_msg name = 'lt_msg' ).


*    DATA: BEGIN OF ls_emp_data,
*            emp_name TYPE /dmo/first_name,
*            BEGIN OF address,
*              street TYPE /dmo/street,
*              number TYPE i,
*            END OF address,
*          END OF ls_emp_data.
*
*    ls_emp_data = VALUE #( emp_name = 'Laura'
*                           address  = VALUE #( street = 'Street CA'
*                                               number = 123  ) ).
*
*    out->write( ls_emp_data ).

* CAST

*    TYPES: BEGIN OF t_struct,
*             col1 TYPE i,
*             col2 TYPE i,
*           END OF t_struct.
*
*    DATA: lo_data TYPE REF TO data,
*          ls_int  TYPE t_struct.
*
*
*    lo_data = NEW t_struct( ).
*
*    ls_int = CAST t_struct( lo_data )->*.
*
*    out->write( ls_int ).
*
*    out->write( cl_abap_char_utilities=>newline ).
*
*    ls_int = VALUE #( col1 = 4
*                      col2 = 6 ).
*
*    CAST t_struct( lo_data )->* = ls_int.

* REDUCE

*    DATA: numbers TYPE TABLE OF i,
*          sum     TYPE i.
*
*    numbers = VALUE #( ( 1 ) ( 2 ) ( 3 ) ).
*
*    sum = REDUCE #( INIT x = 0
*                    FOR n IN numbers
*                    NEXT x = x + n ).
*
*    out->write( sum ).
*
*    out->write( cl_abap_char_utilities=>newline ).


* CORRESPONDING

*    TYPES: BEGIN OF ty_old,
*             name TYPE string,
*             age  TYPE i,
*           END OF ty_old.
*
*    TYPES: BEGIN OF ty_new,
*             name    TYPE string,
*             age     TYPE i,
*             address TYPE string,
*           END OF ty_new.
*
*    DATA: old_data TYPE ty_old.
**          new_data TYPE ty_new.
*
*    old_data = VALUE #( name = 'Alice' age = 25 ).
*
*    DATA(new_data) = CORRESPONDING ty_new( old_data ).
*
*    out->write( old_data ).
*
*    out->write( new_data ).
*
*    out->write( cl_abap_char_utilities=>newline ).

* REF

*    DATA: lv_num  TYPE i,
*          ref_num TYPE REF TO i.
*
*    lv_num = 200.
*
*    ref_num = REF #( lv_num ). " Crear una referencia al valor de num
*
*    out->write( ref_num->* ). " Acceder al valor referenciado
*
*    out->write( cl_abap_char_utilities=>newline ).

* CONV

*    DATA: text TYPE string,
*          num  TYPE p LENGTH 5 DECIMALS 2 VALUE '3.4'.
*
**    num = 100.
*
*    text = CONV string( num ).
*
*    out->write( text ).


* NEW
*    DATA(lo_class) = NEW zcl_11_busniess_pr_log_c346( ).
*
*    DATA: lo_class2 TYPE REF TO zcl_11_busniess_pr_log_c346.
*
*    lo_class2 = NEW #( ).

* Exact

*    DATA: lv_int_value  TYPE i VALUE 327678,
*          lv_int2_value TYPE int2.
*    TRY.
*        lv_int2_value = EXACT int2( lv_int_value ).
*        out->write( data = lv_int2_value name = 'Converted value:' ).
*      CATCH cx_sy_conversion_error INTO DATA(lx_error).
*        out->write( data = lx_error->get_text( ) name = 'Error' ).
*    ENDTRY.

* Filter

    DATA: lt_flights_all   TYPE STANDARD TABLE OF /dmo/flight,
          lt_flights_final TYPE STANDARD TABLE OF /dmo/flight,
          "Filter table
          lt_filter        TYPE SORTED TABLE OF /dmo/flight-carrier_id WITH UNIQUE KEY table_line.

    SELECT FROM /dmo/flight
        FIELDS *
        INTO TABLE @lt_flights_all.

    "Filter values
    lt_filter = VALUE #( ( 'AA ' ) ( 'LH ' ) ( 'UA ' ) ).
    lt_flights_final =  FILTER #( lt_flights_all IN lt_filter WHERE carrier_id = table_line ) .
    out->write( lt_flights_all ).
    out->write( lt_flights_final ).

  ENDMETHOD.

ENDCLASS.
