CLASS zcl_name_test_wr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_name_test_wr IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    DATA(gv_user) = cl_abap_context_info=>get_user_technical_name( ).
* First query
    SELECT FROM /dmo/travel
    FIELDS *
    WHERE travel_id = '00000004'
    INTO TABLE @DATA(lt_univ)
    UP TO 10 ROWS.
    IF sy-subrc EQ 0.
      out->write( data = lt_univ  name = 'Successful First query' ).
    ELSE.
      out->write( 'Unsuccessful First query' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
