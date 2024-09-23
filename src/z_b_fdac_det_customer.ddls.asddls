@AbapCatalog.sqlViewName: 'ZV_FD_DET_CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Determinate Customers Example'
@Metadata: {
    allowExtensions: true
}
define view Z_B_FDAC_det_customer as select from zfd_rent_costum
{
    key doc_id          as ID,
    key matricula       as Matricula,
        fecha_inicio    as FechaInicio,
        fecha_fin       as FechaFin,
        nombres         as Nombre,
        apellidos       as Apellidos,
        email           as Correo,
        cntr_type       as TipoContrato
}
