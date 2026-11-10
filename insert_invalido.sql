INSERT INTO auditoria_directorio_xml (id_auditoria, contenido_xml)
VALUES (
  2,
  XMLTYPE('<DirectorioEmpresa xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://unir.edu/esquemas/directorio_hr.xsd">
    <Departamento id="10" nombre="Administration">
      <ListaEmpleados>
        <Empleado id="200">
          <Nombre>Jennifer</Nombre>
          <EtiquetaInexistente>ErrorDeEstructura</EtiquetaInexistente>
          <Correo>JWHALEN</Correo>
          <Salario>VALOR_INVALIDO</Salario>
        </Empleado>
      </ListaEmpleados>
    </Departamento>
  </DirectorioEmpresa>')
);
