CLASS zcl_test1_wr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test1_wr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA gv_int TYPE int1 VALUE 100.
    out->write( gv_int ).
  ENDMETHOD.
ENDCLASS.
