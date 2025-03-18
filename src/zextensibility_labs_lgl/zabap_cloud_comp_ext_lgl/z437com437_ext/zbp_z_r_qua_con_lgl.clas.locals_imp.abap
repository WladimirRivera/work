CLASS lhc_zz_quality DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ZZ_Quality RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZZ_Quality RESULT result.

    METHODS negativeCal FOR MODIFY
      IMPORTING keys FOR ACTION ZZ_Quality~negativeCal RESULT result.

    METHODS positiveCal FOR MODIFY
      IMPORTING keys FOR ACTION ZZ_Quality~positiveCal RESULT result.

    METHODS ratingInRange FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZZ_Quality~ratingInRange.

    CONSTANTS rating_in_range TYPE string VALUE 'RAITING_IN_RANGE'.
ENDCLASS.

CLASS lhc_zz_quality IMPLEMENTATION.

  METHOD get_instance_features.
    DATA le_supervisor TYPE string.
    DATA le_tech_user TYPE string.
    READ ENTITIES OF Z437_COMI_ShopTP_437 IN LOCAL MODE
      ENTITY ZZ_Quality
      FIELDS ( Supervisor )
      WITH CORRESPONDING #( keys )
      RESULT DATA(reviews)
      FAILED failed.

    le_tech_user = cl_abap_context_info=>get_user_technical_name( ).

    SELECT SINGLE FROM zquality_sup_lgl
         FIELDS supervisor
*         WHERE supervisor EQ @le_tech_user " Correct user
         WHERE supervisor EQ @le_supervisor " wrong user
         INTO @le_supervisor.

    result = VALUE #(
      FOR review IN reviews LET enabled = COND #( WHEN sy-subrc = 0
                                                 THEN if_abap_behv=>fc-o-enabled
                                                 ELSE if_abap_behv=>fc-o-disabled ) IN
    (
        %tky = review-%tky
        %update = enabled
        %delete = enabled
        %action-negativeCal = enabled
        %action-positiveCal = enabled
    )
  ).
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD negativeCal.
    READ ENTITIES OF Z437_COMI_ShopTP_437 IN LOCAL MODE
  ENTITY ZZ_Quality
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(reviews)
    FAILED failed.

    LOOP AT reviews ASSIGNING FIELD-SYMBOL(<review>).
      <review>-helpfulcount -= 1.
      <review>-helpfultotal -= 1.

      APPEND VALUE #(
        %tky    = <review>-%tky
        %param  = CORRESPONDING #( <review> )
      ) TO result.
    ENDLOOP.

    MODIFY ENTITIES OF Z437_COMI_ShopTP_437 IN LOCAL MODE
      ENTITY ZZ_Quality
        UPDATE FIELDS ( helpfulcount helpfultotal )
        WITH CORRESPONDING #( reviews ).
  ENDMETHOD.

  METHOD positiveCal.
    READ ENTITIES OF Z437_COMI_ShopTP_437 IN LOCAL MODE
    ENTITY ZZ_Quality
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(reviews)
      FAILED failed.

    LOOP AT reviews ASSIGNING FIELD-SYMBOL(<review>).
      <review>-helpfulcount += 1.
      <review>-helpfultotal += 1.

      APPEND VALUE #(
        %tky    = <review>-%tky
        %param  = CORRESPONDING #( <review> )
      ) TO result.
    ENDLOOP.

    MODIFY ENTITIES OF Z437_COMI_ShopTP_437 IN LOCAL MODE
      ENTITY ZZ_Quality
        UPDATE FIELDS ( helpfulcount helpfultotal )
        WITH CORRESPONDING #( reviews ).
  ENDMETHOD.

  METHOD ratingInRange.
    READ ENTITIES OF Z437_COMI_ShopTP_437 IN LOCAL MODE
    ENTITY ZZ_Quality
      FIELDS ( rating )
      WITH CORRESPONDING #( keys )
      RESULT DATA(reviews)
    ENTITY ZZ_Quality BY \_Shop
      FROM CORRESPONDING #( keys )
      LINK DATA(orders_links).

    LOOP AT reviews INTO DATA(review).
      APPEND VALUE #(
        %tky        = review-%tky
        %state_area = rating_in_range
      ) TO reported-ZZ_Quality.

      IF review-rating > 5 OR review-rating < 1.
        APPEND VALUE #(
          %tky        = review-%tky
          %state_area = rating_in_range
          %msg        = NEW /dmo/zz_cx_agency_review( /dmo/zz_cx_agency_review=>rating_invalid )
          %element-rating = if_abap_behv=>mk-on
          %path-shop-%tky = VALUE #( orders_links[ KEY draft source-%tky = review-%tky ]-target-%tky OPTIONAL )
        ) TO reported-ZZ_Quality.
        APPEND VALUE #( %tky = review-%tky ) TO failed-ZZ_Quality.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZRAPLGR_SHOPTP_01 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS adjust_numbers REDEFINITION.
    METHODS save_modified REDEFINITION.
ENDCLASS.

CLASS lsc_ZRAPLGR_SHOPTP_01 IMPLEMENTATION.
  METHOD adjust_numbers.
    TYPES: t_mapped_review TYPE STRUCTURE FOR MAPPED LATE z_i_qua_con_lgl.
    DATA: orders TYPE STANDARD TABLE OF sysuuid_x16 WITH KEY table_line.
    FIELD-SYMBOLS: <mapped_review> TYPE t_mapped_review.

    CHECK mapped-zz_quality IS NOT INITIAL.

    LOOP AT mapped-zz_quality ASSIGNING <mapped_review> GROUP BY <mapped_review>-%tmp-OrderUUID.
      APPEND <mapped_review>-%tmp-OrderUUID TO orders.
    ENDLOOP.

    ASSERT orders IS NOT INITIAL.

    SELECT
      FROM zquality_con_lgl AS db
      JOIN @orders AS itab
      ON db~order_uuid = itab~table_line
      FIELDS DISTINCT
        db~order_uuid,
        MAX( db~review_id ) AS max_review_id
      GROUP BY db~order_uuid
      INTO TABLE @DATA(max_reviews).

    LOOP AT mapped-zz_quality INTO DATA(mapped_review_group) GROUP BY mapped_review_group-%tmp-OrderUUID.
      DATA(max_review_id) = VALUE #( max_reviews[ order_uuid = mapped_review_group-%tmp-OrderUUID ]-max_review_id OPTIONAL ).
      LOOP AT mapped-zz_quality ASSIGNING <mapped_review> WHERE %tmp-OrderUUID = mapped_review_group-%tmp-OrderUUID.
        <mapped_review>-OrderUUID = <mapped_review>-%tmp-OrderUUID.
        max_review_id += 1.
        <mapped_review>-reviewid = max_review_id.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD save_modified.
  ENDMETHOD.
ENDCLASS.


*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
