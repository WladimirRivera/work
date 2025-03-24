CLASS zcl_04_field_symbols_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_field_symbols_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA: gv_employee TYPE string.
*
**    FIELD-SYMBOLS <fs_employee> TYPE string.
*
*    ASSIGN gv_employee TO FIELD-SYMBOL(<fs_employee>).
*
*    out->write( <fs_employee> ).
*
*    <fs_employee> = 'Laura'.
*
*    out->write( <fs_employee> ).


    SELECT FROM /dmo/flight
    FIELDS *
     WHERE carrier_id = 'AA'
     INTO TABLE @DATA(lt_flights).

*    out->write( lt_flights ).
*
*
*    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).
*
*      <fs_flights>-currency_code = 'EUR'.
*      <fs_flights>-flight_date = cl_abap_context_info=>get_system_date( ).
*
*
*      out->write( |flight: { <fs_flights>-carrier_id }-{ <fs_flights>-connection_id }| ).
*
*    ENDLOOP.
*
*    out->write( lt_flights ).

*    APPEND INITIAL LINE TO lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).
*
*    IF <fs_flights> IS ASSIGNED.
*
*      out->write( <fs_flights> ).
*
**      UNASSIGN <fs_flights>.
*
*    ENDIF.

*    FIELD-SYMBOLS <fs_flights> TYPE /dmo/flight.
*
*    INSERT INITIAL LINE INTO lt_flights ASSIGNING <fs_flights> INDEX 1.
*
*    IF <fs_flights> IS ASSIGNED.
*
*      <fs_flights> = VALUE #( carrier_id = 'MX'
*                              connection_id = '0002'
*                              flight_date = '20250320'
*                              price = '3000'
*                              currency_code = 'MXN' ).
*
*      out->write( <fs_flights> ).
*
*    ELSE.
*
*      out->write( 'Field symbol UNASSIGNED' ).
*
*    ENDIF.


*    READ TABLE lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>) INDEX 1.
*
*    out->write( <fs_flights> ).
*
*    <fs_flights>-carrier_id = 'MX'.
*    <fs_flights>-currency_code = 'MXN'.
*
*    out->write( <fs_flights> ).
*
*    UNASSIGN <fs_flights>.

    TYPES: BEGIN OF ty_date,
             day   TYPE n LENGTH 2,
             month TYPE n LENGTH 2,
             year  TYPE n LENGTH 4,
           END OF ty_date.

    DATA: lv_date     TYPE d.

*     Implicit casting of date type to a field symbol
    FIELD-SYMBOLS: <lv_date>  TYPE d,
                   <lv_date2> TYPE any,
                   <lv_date3> TYPE n.

    lv_date = cl_abap_context_info=>get_system_date( ).
    lv_date = lv_date+6(2) && lv_date+4(2) && lv_date+0(4).

    ASSIGN lv_date TO <lv_date>.
    out->write( |Today's Date: { <lv_date> }| ).

    ASSIGN lv_date TO <lv_date2> CASTING TYPE ty_date.


    DO.

      ASSIGN COMPONENT sy-index OF STRUCTURE <lv_date2> TO <lv_date3>.

      IF sy-subrc <> 0.

        EXIT.

      ENDIF.

      out->write( |Today's Date: { <lv_date3> }| ).

    ENDDO.














  ENDMETHOD.

ENDCLASS.
