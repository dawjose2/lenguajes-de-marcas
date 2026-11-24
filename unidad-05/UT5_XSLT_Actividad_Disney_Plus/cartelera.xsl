<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/cartelera">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Una noche de cine en <xsl:value-of select="@plataforma"/></title>
        <link rel="stylesheet" href="estilos.css"/>
      </head>
      <body>
        <header>
          <h1>Una noche de cine en <xsl:value-of select="@plataforma"/></h1>
          <p>Cartelera seleccionada por categorías y ordenada por año de estreno</p>
        </header>
        
        <main>
          <xsl:for-each select="categoria">
            <section class="categoria">
              <h2><xsl:value-of select="@nombre"/></h2>
              
              <div class="grid-peliculas">
                <xsl:for-each select="pelicula">
                  <!-- Ordenación dentro de cada categoría por año de estreno -->
                  <xsl:sort select="anio" data-type="number" order="ascending"/>
                  
                  <article class="tarjeta">
                    <div class="poster">
                      <img src="{imagen}" alt="Cartel de {titulo}"/>
                      <span class="badge-id"><xsl:value-of select="@id"/></span>
                    </div>

                    <div class="info">
                      <h3><xsl:value-of select="titulo"/></h3>
                      
                      <div class="metadatos">
                        <span><strong>Año:</strong> <xsl:value-of select="anio"/></span>
                        <span><strong>Duración:</strong> <xsl:value-of select="duracion"/> min</span>
                      </div>

                      <p class="sinopsis"><xsl:value-of select="sinopsis"/></p>

                      <div class="reparto">
                        <strong>Reparto:</strong>
                        <ul>
                          <xsl:for-each select="reparto/actor">
                            <li><xsl:value-of select="."/></li>
                          </xsl:for-each>
                        </ul>
                      </div>
                    </div>
                  </article>
                </xsl:for-each>
              </div>
            </section>
          </xsl:for-each>
        </main>

        <footer>
          <p>Práctica UT5 · Transformación XML con XSLT y XPath</p>
        </footer>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>