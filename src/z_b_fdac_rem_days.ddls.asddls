@AbapCatalog.sqlViewName: 'ZV_FD_REMDAYS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Remaining Days Example'
@Metadata: {
    allowExtensions: true
}
define view Z_B_FDAC_rem_days as select from zfd_rent_cars
{
 key matricula as Matricula,
     marca     as Marca,
     case
     when alq_hasta <> ''
     then dats_days_between(cast($session.system_date as abap.dats),alq_hasta) 
     else 0
     end as Dias
}
