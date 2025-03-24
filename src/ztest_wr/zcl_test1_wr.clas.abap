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
*  Declaración de los estructuras
    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights,

           BEGIN OF ty_airlines,
             carrid    TYPE /dmo/carrier_id,
             connid    TYPE /dmo/connection_id,
             countryfr TYPE land1,
             cityfrom  TYPE /dmo/city,
             airpfrom  TYPE /dmo/airport_id,
             countryto TYPE land1,
           END OF ty_airlines,

*  Declaración de la estructura nested
           BEGIN OF ty_nested,
             flights  TYPE ty_flights,
             airlines TYPE ty_airlines,
           END OF ty_nested,

*  Declaración de la estructura deep
           BEGIN OF ty_deep,
             carrid  TYPE /dmo/carrier_id,
             connid  TYPE /dmo/connection_id,
             flights TYPE STANDARD TABLE OF ty_flights WITH EMPTY KEY,
           END OF ty_deep.

*  Añadir datos en las diferentes estructuras
    DATA: ls_flight  TYPE ty_flights,
          ls_airline TYPE ty_airlines,
          ls_nested  TYPE ty_nested,
          ls_deep    TYPE ty_deep.

* Añadir datos en estructuras
    ls_flight = VALUE #(    iduser = 'U123'
                            aircode = 'LH'
                            flightnum = '400'
                            key = 'DE'
                            seat = '123'
                            flightdate = '20230904' ).

    ls_airline = VALUE #(  carrid = 'LH'
                            connid = '400'
                            countryfr = 'DE'
                            cityfrom = 'Frankfurt'
                            airpfrom = 'FRA'
                            countryto = 'US' ).

* Añadir datos en estructuras nested n#1
    ls_nested-flights = ls_flight.
    ls_nested-airlines = ls_airline.

* Añadir datos en estructuras nested n#2
    ls_nested = VALUE #(
      flights = VALUE #(
        iduser = 'U123'
        aircode = 'LH'
        flightnum = '400'
        key = 'DE'
        seat = '123'
        flightdate = '20230904'
      )
      airlines = VALUE #(
        carrid = 'LH'
        connid = '400'
        countryfr = 'DE'
        cityfrom = 'Frankfurt'
        airpfrom = 'FRA'
        countryto = 'US'
      )
    ).

* Añadir datos en estructuras include
    TYPES BEGIN OF ty_include_flights.
    INCLUDE TYPE ty_flights AS flight.
    INCLUDE TYPE ty_airlines AS airline.
    TYPES END OF ty_include_flights.

    DATA ls_include TYPE ty_include_flights.

    ls_include = VALUE #( flight = ls_flight
                          airline = ls_airline ).

* Mostrar información en consola
    out->write( ls_include ).
  ENDMETHOD.
ENDCLASS.
