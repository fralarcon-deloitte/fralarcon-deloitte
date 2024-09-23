CLASS zcls4d100_fdac_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcls4d100_fdac_hello_world IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  " Full Solution Code


    out->write( | Hello World! | ).
  ENDMETHOD.

ENDCLASS.
