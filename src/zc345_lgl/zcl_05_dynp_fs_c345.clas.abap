CLASS zcl_05_dynp_fs_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_dynp_fs_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    FIELD-SYMBOLS: <gt_employees> TYPE ANY TABLE,
                   <gs_employee>  TYPE any,
                   <gs_data>      TYPE any.

*    DATA: gt_employee TYPE STANDARD TABLE OF zemploy_table.
*
*    gt_employee = VALUE #( ( mandt         = 100
*                                             id            = '10001'
*                                             first_name    = 'Laura'
*                                             last_name     = 'Martinez'
*                                             email         = 'lmartinez@logali.com'
*                                             phone_numer   = 21825963
*                                             salary        = '5000'
*                                             currency_code = 'EUR' )
*
*                                             ( mandt         = 100
*                                             id            = '10002'
*                                             first_name    = 'Raul'
*                                             last_name     = 'Martinez'
*                                             email         = 'lmartinez@logali.com'
*                                             phone_numer   = 21825963
*                                             salary        = '4000'
*                                             currency_code = 'USD' )
*
*                                             ( mandt         = 100
*                                             id            = '10003'
*                                             first_name    = 'Pedro'
*                                             last_name     = 'Martinez'
*                                             email         = 'lmartinez@logali.com'
*                                             phone_numer   = 21725963
*                                             salary        = '3000'
*                                             currency_code = 'MXN' ) ).
*
*    MODIFY zemploy_table FROM TABLE @gt_employee.

*    DATA(gs_employee) = VALUE zemploy_table(  mandt         = 100
*                                              id            = '10001'
*                                              first_name    = 'Laura'
*                                              last_name     = 'Martinez'
*                                              email         = 'lmartinez@logali.com'
*                                              phone_numer   = 21825963
*                                              salary        = '5000'
*                                              currency_code = 'EUR' ).

*    ASSIGN gs_employee TO FIELD-SYMBOL(<gs_employee>).
*
*    IF <gs_employee> IS ASSIGNED.
*
**      ASSIGN COMPONENT 'FIRST_NAME' OF STRUCTURE <gs_employee> TO <gs_data>.
**
**      IF  <gs_data> IS   ASSIGNED.
**
**        <gs_data> = 'Maria'.
**
**        UNASSIGN <gs_data>.
**
**      ENDIF.
*
*      <gs_employee>-first_name = 'Bianca'.
*
*      UNASSIGN <gs_employee>.
*
*    ENDIF.
*
*    out->write( gs_employee ).


*    SELECT FROM zemploy_table
*         FIELDS *
*         INTO TABLE @DATA(gt_employees).
*
*    IF lines( gt_employees ) GT 0.
*
*      ASSIGN gt_employees TO <gt_employees>.
*
*      LOOP AT <gt_employees> ASSIGNING <gs_employee>.
*
*        IF <gs_employee> IS ASSIGNED.
*
*          ASSIGN COMPONENT 'EMAIL' OF STRUCTURE <gs_employee> TO <gs_data>.
*
*          IF  <gs_data> IS ASSIGNED.
*
*            <gs_data> = |{ <gs_data> }.es|.
*
*            UNASSIGN <gs_data>.
*
*          ENDIF.
*
*        ENDIF.
*
*      ENDLOOP.
*
*      UNASSIGN <gs_employee>.
*
*      UNASSIGN <gt_employees>.
*
*      out->write( gt_employees ).
*
*    ENDIF.
*

    " Data Reference

*  data lr_data type ref to i.
*
*  CREATE DATA lr_data.

*    DATA(lr_data) = NEW i(  ).
*
*    ASSIGN lr_data->* TO FIELD-SYMBOL(<fs_value>).
*
*    <fs_value> = 30.
*
*    out->write( <fs_value> ).
*
*    DATA(lo_class) = NEW zcl_05_dynp_fs_c345( ).
*
*
*    TYPES: BEGIN OF ty_data,
*             field1 TYPE i,
*             field2 TYPE string,
*             field3 TYPE string,
*           END OF ty_data.


* Anonymous data objects

*    DATA lr_data01 TYPE REF TO string.
*    CREATE DATA lr_data01.
*
*    DATA lr_data02 TYPE REF TO data.
*    CREATE DATA lr_data02 TYPE p LENGTH 10 DECIMALS 2.
*
*    DATA lt_data TYPE TABLE OF zemploy_table.
*    CREATE DATA lr_data02 LIKE lt_data.
*
*    CREATE DATA lr_data02 TYPE HASHED TABLE OF zemploy_table WITH UNIQUE KEY id.
*
*
** Anonymous structures
*    CREATE DATA lr_data02 LIKE LINE OF lt_data.
*    CREATE DATA lr_data02 TYPE zemploy_table.
*
** New
*    DATA(lr_data03) = NEW i( 123 ).
*    DATA(lr_data04) = NEW zemploy_table( id = 10005 first_name = 'Jose' ).
*
** Select
*    SELECT FROM zemploy_table
*           FIELDS *
*           INTO TABLE NEW @DATA(lr_data05).
*
*    out->write( lr_data05 ).
*
*    SELECT SINGLE * FROM zemploy_table
*          INTO NEW @DATA(lr_data06).
*
*    out->write( lr_data06 ).

* Assign
*    TYPES: BEGIN OF ty_data,
*             field1 TYPE i,
*             field2 TYPE string,
*             field3 TYPE string,
*           END OF ty_data.
*
*    DATA ls_data TYPE ty_data.
*
*    DATA lt_data TYPE TABLE OF ty_data WITH EMPTY KEY.
*
*    ls_data = VALUE #( field1 = 1
*                       field2 = 'aaa'
*                       field3 = 'Z' ).
*
*    APPEND ls_data TO lt_data.
*
*    DATA(lr_data) = NEW ty_data( field1 = 2
*                                 field2 = 'b'
*                                 field3 = 'Y' ).
*
*    FIELD-SYMBOLS <fs_generic> TYPE data.
*
*    ASSIGN ls_data-('FIELD1') TO <fs_generic>.
*    out->write( <fs_generic> ).
*
*    ASSIGN lt_data[ 1 ]-('FIELD1') TO <fs_generic>.
*    out->write( <fs_generic> ).
*
*    ASSIGN lr_data->('FIELD2') TO <fs_generic>.
*    out->write( <fs_generic> ).
*
*    ASSIGN lr_data->*-('FIELD3') TO <fs_generic>.
*    out->write( <fs_generic> ).
*
*    DATA lv_field TYPE string VALUE 'FIELD2'.
*    ASSIGN ls_data-(lv_field) TO <fs_generic>.
*    out->write( <fs_generic> ).
*
*    ASSIGN ('LS_DATA-FIELD1') TO <fs_generic>.
*    out->write( <fs_generic> ).
*
*    ASSIGN ls_data-(3) TO <fs_generic>.
*    out->write( <fs_generic> ).

* ITAB Dyn

    TYPES: BEGIN OF ty_data,
             field1 TYPE i,
             field2 TYPE string,
             field3 TYPE string,
           END OF ty_data.

    DATA lt_data_dyn TYPE TABLE OF ty_data WITH EMPTY KEY.

    DATA lt_data_dyn2 TYPE TABLE OF ty_data
      WITH NON-UNIQUE KEY field1
      WITH UNIQUE SORTED KEY sortk COMPONENTS field2.

    TYPES lt_type LIKE lt_data_dyn2.

    DATA lt_ref TYPE TABLE OF REF TO ty_data WITH EMPTY KEY.

    lt_data_dyn = VALUE #( ( field1 = 1 field2 = 'aaa' field3 = 'zzz' )
                           ( field1 = 2 field2 = 'bbb' field3 = 'YYY' )
                           ( field1 = 3 field2 = 'ccc' field3 = 'xxx' ) ).

    lt_data_dyn2 = lt_data_dyn.

* Sort
    DATA(lv_field_name) = 'FIELD1'.
    SORT lt_data_dyn BY (lv_field_name) DESCENDING.
    out->write( lt_data_dyn ).

    SORT lt_data_dyn BY ('FIELD2').
    out->write( lt_data_dyn ).

* Read table
    DATA(ls_read) = VALUE ty_data( field2 = 'aaa' ).

    READ TABLE lt_data_dyn2 FROM ls_read USING KEY ('SORTK') REFERENCE INTO DATA(lr_read).
    out->write( lr_read->* ).

    READ TABLE lt_data_dyn2 WITH KEY ('PRIMARY_KEY') COMPONENTS ('FIELD1') = 3 REFERENCE INTO lr_read.
    out->write( lr_read->* ).

    READ TABLE lt_data_dyn2 INDEX 2 USING KEY ('SORTK') REFERENCE INTO lr_read.
    out->write( lr_read->* ).

* ITAB

    DATA(ls_read2) = lt_data_dyn2[ KEY ('SORTK') INDEX 2 ].
    out->write( ls_read2 ).

    DATA(ls_read3) = lt_data_dyn2[ ('FIELD2') = 'bbb' ('FIELD3') = 'YYY' ].
    out->write( ls_read3 ).

    DATA(ls_read4) = lt_data_dyn2[ KEY ('SORTK') ('FIELD2') = 'ccc' ].
    out->write( ls_read4 ).































  ENDMETHOD.

ENDCLASS.
