@AbapCatalog.sqlViewName: 'ZV_FD_BRANDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Brands'
@Metadata: {
    allowExtensions: true
}
define view Z_B_FDAC_brands as select from zfd_rent_brands
{
    key marca as Marca,
    @UI.hidden: true
        url   as Imagen
}
