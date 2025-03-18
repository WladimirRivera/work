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
    DATA(gv_user) = cl_abap_context_info=>get_user_technical_name( ).
  ENDMETHOD.
ENDCLASS.
