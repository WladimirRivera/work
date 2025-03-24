CLASS zcl_lock_obj_lgl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lock_obj_lgl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        "Instantiate lock object
        DATA(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = '/DMO/ETRAVEL' ).
      CATCH cx_abap_lock_failure INTO DATA(exception).
        RAISE SHORTDUMP exception.
    ENDTRY.


*    LOOP AT keys ASSIGNING FIELD-SYMBOL(<travel>).
    TRY.
        "enqueue travel instance
        lock->enqueue( ).

      CATCH cx_abap_foreign_lock INTO DATA(foreign_lock).
        RAISE SHORTDUMP exception.
      CATCH cx_abap_lock_failure INTO exception.
        RAISE SHORTDUMP exception.
    ENDTRY.
    WAIT UP TO 10 SECONDS.
    out->write( 'Lock release' ).
*    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
