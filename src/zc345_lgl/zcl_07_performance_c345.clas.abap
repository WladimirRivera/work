CLASS zcl_07_performance_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_performance_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_total,
             price    TYPE /dmo/flight_price,
             seatsocc TYPE /dmo/plane_seats_occupied,
           END OF ty_total.

    DATA: lt_flights TYPE TABLE OF /dmo/flight.

    SELECT FROM /dmo/flight
    FIELDS *
    INTO TABLE @lt_flights.

    DATA(lv_sum) = REDUCE i( INIT lv_result = 0
                             FOR ls_flight IN lt_flights
                             NEXT lv_result += ls_flight-price ).

    out->write( |Sum of Price: { lv_sum }| ).

    DATA(ls_totals) = REDUCE ty_total( INIT ls_total TYPE ty_total
                                       FOR ls_flight2 IN lt_flights WHERE ( carrier_id = 'AA' )
                                       NEXT ls_total-price += ls_flight2-price
                                            ls_total-seatsocc += ls_flight2-seats_occupied ).

    out->write( |Sum of Price and Seats OCC:| ).
    out->write( ls_totals ).

  ENDMETHOD.

ENDCLASS.
