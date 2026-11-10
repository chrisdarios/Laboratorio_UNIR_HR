SELECT XMLSERIALIZE(DOCUMENT
         XMLELEMENT("DirectorioEmpresa",
           XMLAGG(xml_depto)
         ) AS CLOB INDENT SIZE = 2
       ) AS documento_xml
FROM (
  SELECT XMLELEMENT("Departamento",
           XMLATTRIBUTES(
             d.department_id AS "id",
             d.department_name AS "nombre"
           ),
           XMLELEMENT("ListaEmpleados",
             XMLAGG(
               XMLELEMENT("Empleado",
                 XMLATTRIBUTES(e.employee_id AS "id"),
                 XMLFOREST(
                   e.first_name AS "Nombre",
                   e.last_name AS "Apellido",
                   e.email AS "Correo",
                   e.salary AS "Salario"
                 )
               )
             )
           )
         ) AS xml_depto
  FROM hr.departments d
  INNER JOIN hr.employees e ON d.department_id = e.department_id
  WHERE d.department_id IN (10, 20, 30)
  GROUP BY d.department_id, d.department_name
);
