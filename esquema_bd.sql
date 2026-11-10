BEGIN
  DBMS_XMLSCHEMA.REGISTERSCHEMA(
    schemaURL => 'http://unir.edu/esquemas/directorio_hr.xsd',
    schemaDoc => '<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="DirectorioEmpresa">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="Departamento" maxOccurs="unbounded">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="ListaEmpleados">
                <xs:complexType>
                  <xs:sequence>
                    <xs:element name="Empleado" maxOccurs="unbounded">
                      <xs:complexType>
                        <xs:sequence>
                          <xs:element name="Nombre" type="xs:string"/>
                          <xs:element name="Apellido" type="xs:string"/>
                          <xs:element name="Correo" type="xs:string"/>
                          <xs:element name="Salario">
                            <xs:simpleType>
                              <xs:restriction base="xs:decimal">
                                <xs:minInclusive value="0"/>
                              </xs:restriction>
                            </xs:simpleType>
                          </xs:element>
                        </xs:sequence>
                        <xs:attribute name="id" type="xs:positiveInteger" use="required"/>
                      </xs:complexType>
                    </xs:element>
                  </xs:sequence>
                </xs:complexType>
              </xs:element>
            </xs:sequence>
            <xs:attribute name="id" type="xs:positiveInteger" use="required"/>
            <xs:attribute name="nombre" type="xs:string" use="required"/>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>',
    local     => TRUE,
    genTypes  => FALSE,
    genTables => FALSE
  );
END;
/

CREATE TABLE auditoria_directorio_xml (
    id_auditoria NUMBER PRIMARY KEY,
    fecha_registro DATE DEFAULT SYSDATE,
    contenido_xml XMLTYPE,
    CONSTRAINT chk_xml_valido CHECK (XMLIsValid(contenido_xml) = 1)
)
XMLTYPE COLUMN contenido_xml
XMLSCHEMA "http://unir.edu/esquemas/directorio_hr.xsd"
ELEMENT "DirectorioEmpresa";
