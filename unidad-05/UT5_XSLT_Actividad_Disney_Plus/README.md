# Una noche de cine en Disney+ (UT5 · XSLT)

## Descripción del proyecto
Catálogo web generado a partir de un documento XML (`catalogo.xml`), transformado a HTML (`index.html`) mediante una hoja de estilos XSLT (`cartelera.xsl`) y diseñado con CSS propio (`estilos.css`).

## Criterios de agrupación y ordenación
- **Agrupación:** Las películas están organizadas en 4 categorías temáticas (`Disney`, `Terror`, `Acción` y `Risa`), con 3 títulos en cada una.
- **Ordenación:** Dentro de cada categoría, las películas se ordenan automáticamente de forma ascendente por su **año de estreno** (`<xsl:sort select="anio" data-type="number" order="ascending"/>`).

## Cómo ejecutar la transformación
- **Desde terminal (con `xsltproc`):**
  ```bash
  xsltproc cartelera.xsl catalogo.xml -o index.html