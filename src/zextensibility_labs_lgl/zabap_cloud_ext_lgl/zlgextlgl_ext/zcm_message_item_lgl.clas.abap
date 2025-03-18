CLASS zcm_message_item_lgl DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF invalid_disc,
        msgid TYPE symsgid VALUE 'ZMC_MESSAGE_ITEM_LGL',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_disc.

    METHODS constructor
      IMPORTING
        textid   TYPE scx_t100key OPTIONAL
        attr1    TYPE scx_attrname OPTIONAL
        attr2    TYPE scx_attrname OPTIONAL
        attr3    TYPE scx_attrname OPTIONAL
        attr4    TYPE scx_attrname OPTIONAL
        previous LIKE previous OPTIONAL
        severity TYPE if_abap_behv_message=>t_severity OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mv_attr1 TYPE string,
          mv_attr2 TYPE string,
          mv_attr4 TYPE string,
          mv_attr3 TYPE string.
ENDCLASS.

CLASS zcm_message_item_lgl IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.

    me->mv_attr1 = attr1.
    me->mv_attr2 = attr2.
    me->mv_attr3 = attr3.
    me->mv_attr4 = attr4.

    if_abap_behv_message~m_severity = severity.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
