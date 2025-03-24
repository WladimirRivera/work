CLASS zcl_13_select_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_select_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*   Select Single
    SELECT SINGLE FROM zemployee_c345
           FIELDS *
           WHERE employeeid EQ 4
           INTO @DATA(ls_employee).
    IF sy-subrc EQ 0.
      out->write( | The product consulted is: { ls_employee-first_name } | ).
    ENDIF.

    out->write( cl_abap_char_utilities=>newline ).

*   Select Bypassing buffer
    SELECT SINGLE FROM zemployee_c345
           FIELDS *
           WHERE employeeid EQ 4
           INTO @ls_employee
           BYPASSING BUFFER.
    IF sy-subrc EQ 0.
      out->write( | The product consulted is: { ls_employee-first_name } | ).
    ENDIF.

    out->write( cl_abap_char_utilities=>newline ).

*   Select Into/Appending table
    SELECT FROM zemployee_c345
           FIELDS *
           WHERE role EQ 2
           INTO TABLE @DATA(lt_products).
*          APPENDING TABLE @DATA(lt_products).
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were consulted| ).
    ENDIF.

    out->write( cl_abap_char_utilities=>newline ).

*   Select corresponding fields
    TYPES: BEGIN OF ty_corr,
             employeeid TYPE i,
             first_name TYPE string,
           END OF ty_corr.

    DATA lt_corresponding TYPE STANDARD TABLE OF ty_corr.

    SELECT FROM zemployee_c345
        FIELDS employeeid, first_name
        WHERE role EQ 2
        INTO CORRESPONDING FIELDS OF TABLE @lt_corresponding.
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were consulted| ).
    ENDIF.

    out->write( cl_abap_char_utilities=>newline ).

*   Select Up to n rows
    SELECT FROM zemployee_c345
           FIELDS *
           WHERE role EQ 2
           INTO TABLE @lt_products
           UP TO 3 ROWS.
    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } records were consulted| ).
    ENDIF.

    out->write( cl_abap_char_utilities=>newline ).

*   Select/End selection
    SELECT FROM zemployee_c345
           FIELDS *
           WHERE salary_amount GE 100
           INTO @ls_employee.
      out->write( | { ls_employee-first_name } = { ls_employee-salary_amount }| ).
    ENDSELECT.

    out->write( cl_abap_char_utilities=>newline ).

*   Select Packet size
    SELECT FROM zemployee_c345
           FIELDS *
           WHERE salary_amount GE 100
           INTO TABLE @lt_products
           PACKAGE SIZE 2.
      LOOP AT lt_products INTO ls_employee.
        out->write( | { ls_employee-first_name } = { ls_employee-salary_amount }| ).
      ENDLOOP.
      out->write( cl_abap_char_utilities=>newline ).
    ENDSELECT.
  ENDMETHOD.

ENDCLASS.
