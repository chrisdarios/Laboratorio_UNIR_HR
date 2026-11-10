INSERT INTO auditoria_directorio_xml (id_auditoria, contenido_xml)
VALUES (
  1,
  XMLTYPE('<DirectorioEmpresa xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://unir.edu/esquemas/directorio_hr.xsd">
    <Departamento id="10" nombre="Administration">
      <ListaEmpleados>
        <Empleado id="200">
          <Nombre>Jennifer</Nombre>
          <Apellido>Whalen</Apellido>
          <Correo>JWHALEN</Correo>
          <Salario>4400</Salario>
        </Empleado>
      </ListaEmpleados>
    </Departamento>
  </DirectorioEmpresa>')
);
COMMIT;
