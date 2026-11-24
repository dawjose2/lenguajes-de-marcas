# Sesión autónoma 1. Introducción a XSLT

- **Repositorio de la activdad**
```
unidad-05/
└── sesion-01-introduccion-xslt/
    └── README.md
```

1. **¿Qué significan las siglas XSLT?**
- Las siglas "XSLT" significan eXtensible Styesheet Languague for Transformations.

2. **¿Para qué se utiliza XSLT?**
- Para transformar un documento XML dandole reglas y plantillas de como deben reorganizarse o mostrarse los datos.

3. **¿Qué relación existe entre XML, XPath y XSLT?**
- Pues su principal relación se basa en que XSLT trabaja sobre un archivo XML, mientras también XSLT utiliza XPath como su motor de búsqueda para ubicar cierta parte del archivo XML.

4. **¿Qué tipos de documentos se pueden generar mediante una transformación XSLT?**
- Los documentos que pueden llegar a generar son archivos XML convertirlos en documentos XHTML o incluso en otro archivo XML.

5. **¿Qué es una hoja de estilos XSLT?**
- Es donde define las reglas para transformar un archivo XML en otro formato.

6. **¿Qué función tiene un procesador XSLT?**
- El procesador es un software que lee un XML origen junto con su hoja de estilos XSLT donde contiene las reglas de la transofmración y con ello genera el nuevo documento de salida con un formato y una estructura distinta.

7. **¿Qué extensión suelen utilizar los archivos XSLT?**
- La extensión que utilizan los archivos XSLT es .xsl

8. **¿Qué es una plantilla en XSLT?**
- Una plantilla son directrices en una transformación de un arbol fuente en un arbol transformado. Se componen de dos partes, la primera se conoce como patrones de búsqueda y la segunda como plantillas. A partir del patrón se identifican los nodos del árbol fuente a los cuales se aplica la regla.

9. **¿Para qué sirve el elemento xsl:stylesheet?**
- Es la etiqueta raiz de una hoja de estilos XSLT.

10. **¿Para qué sirve xsl:template?**
- Es el bloque fundamental en una hoja de estilos XSLT. Está creado para definir como debe transformarse o mostrarse una parte específica de un nodo en un documento XML cuando el procesador XSLT lo encuentra.

11. **¿Qué función tiene xsl:value-of?**
- Sirve para calcular el valor de una expresión xpath e insertarlo diceramente en el aŕbol de resultados.

12. **¿Para qué se utiliza xsl:for-each?**
- Se utiliza para recorrer un conjunto de nodos seleccionados mediante una expresión xpath y aplicarles la misma plantilla o un conjunto de reglas a cada uno.

13. **¿Qué función tiene xsl:output?**
- Su función se trata de indicar al procesador el formato, la codificación y las características que debe tener el documento de resultado al finalizar la transformación.

14. **¿Qué diferencia existe entre los atributos match y select?**
- La diferencia se basa entre que los archivos match definen la condición para interceptar un nodo sin embargo select ejecuta una consulta directa para extraer un conjunto de nodos.

15. **¿Por qué es necesario utilizar XPath dentro de XSLT?**
- Porque XSLT es una hoja de estilos no es capaz de buscar por si solo en un archivo XML por lo tanto es necesario el uso de XPath.

16. **¿Cuál es la diferencia entre utilizar CSS y utilizar XSLT sobre un documento XML?**
- CSS le da estilo visual a los elementos del documento XML mientras que XSLT transforma la estructura y genera un nuevo árbol de nodos o un formato de salida distinto en el documento XML.

17. **Busca un ejemplo sencillo de una hoja XSLT que genere HTML a partir de XML. Incluye el código y explica brevemente qué hace.**

- Código XML
```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="catalogo.xsl"?>
<catalogo>
  <libro>
    <titulo>Cien años de soledad</titulo>
    <autor>Gabriel García Márquez</autor>
    <precio>15.50</precio>
  </libro>
  <libro>
    <titulo>1984</titulo>
    <autor>George Orwell</autor>
    <precio>12.00</precio>
  </libro>
</catalogo>
```
- Código XML transformado a XSLT
```XSLT
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Catálogo de Libros</title>
        <style>
          table { border-collapse: collapse; width: 50%; }
          th, td { border: 1px solid black; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>Lista de Libros</h2>
        <table>
          <tr>
            <th>Título</th>
            <th>Autor</th>
            <th>Precio</th>
          </tr>
          <xsl:for-each select="catalogo/libro">
            <tr>
              <td><xsl:value-of select="titulo"/></td>
              <td><xsl:value-of select="autor"/></td>
              <td><xsl:value-of select="precio"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
```

- La transformación incluye un nuevo elemento raiz que se basa en xslt:stylesheet para definir que es una hoja de estilos XSLT, xslt:template match="/" donde indicamos la regla que se aplica desde la raíz del documento XML y xslt:for-each select="catalogo/libro" que recorre cada elemento de cada libro que está dentro del catálogo.

- Webgrafía

- [Documentación sobre XSLT](https://developer.mozilla.org/es/docs/Web/XML/XSLT/Reference/Element/for-each)

- [Documentación sobre XSLT](https://www.data2type.de/es/xml-xslt-xslfo/xslt/xslt-introduccion/reglas-de-plantilla)

- [Documentación sobre XSLT](https://programacion.net/articulo/xslt-xsl-xpath-que-es-cada-cosa_1)

- [Documentación sobre XSLT](https://www.ticarte.com/contenido/que-es-el-lenguaje-de-transformacion-xslt)

- [Documentación sobre XSLT](https://learn.microsoft.com/es-es/office-project/xml-data-interchange/how-to-use-xslt-transformations-with-project-xml-data-interchange-files?view=project-client-2016)
