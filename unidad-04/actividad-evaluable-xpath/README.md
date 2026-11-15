# 8. Actividad evaluable: catálogo de libros actuales con XPath

## Estructura básica del ejercicio

```
unidad-04/
└── actividad-evaluable-xpath/
    ├── README.md
    ├── biblioteca.xml
    └── img/
        ├── consulta-01.png
        ├── consulta-02.png
        └── consulta-03.png
```

- Enlace al código completo de biblioteca.xml:
[Ver código completo de biblioteca.xml](./biblioteca.xml)


### Selecciones básicas

1. Seleccionar el elemento raíz <biblioteca>:

```xpath
xmllint --xpath "/biblioteca" biblioteca.xml
```

biblioteca fecha_actualizacion="2026-11-15"

2. Seleccionar todos los libros:
```xpath
xmllint --xpath "/biblioteca/libro" biblioteca.xml
```

alumno@lnd-debian:~/lenguajes-de-marcas/unidad-04/actividad-evaluable-xpath$ 

```xml
<libro id="L001" disponible="true">
    <titulo>Wigetta: Un viaje mágico</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2015</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    etc
```

3. Seleccionar los títulos de todos los libros:

```xpath
xmllint --xpath "/biblioteca/libro/titulo" biblioteca.xml
```
```bash
<titulo>Wigetta: Un viaje mágico</titulo>
<titulo>Wigetta y el báculo dorado</titulo>
<titulo>Wigetta y el antídoto secreto</titulo>
<titulo>Los secretos de YouTube</titulo>
<titulo>Rescate en el tiempo</titulo>
<titulo>El secreto del valor</titulo>
<titulo>La isla de los dinosaurios</titulo>
<titulo>El instituto</titulo>
<titulo>Nuestra parte de noche</titulo>
<titulo>El hombre de tiza</titulo>
```

4. Seleccionar todos los identificadores id:
```xpath
xmllint --xpath "/biblioteca/libro/@id" biblioteca.xml
```

id="L001"
id="L002"
id="L003"
id="L004"
id="L005"
id="L006"
id="L007"
id="L008"
id="L009"
id="L010"

5. Seleccionar todos los géneros, aunque se repitan:
```xpath
xmllint --xpath "//genero" biblioteca.xml
```
```bash
<genero>Juvenil</genero>
<genero>Aventuras</genero>
<genero>Juvenil</genero>
<genero>Ensayo</genero>
<genero>Juvenil</genero>
<genero>Aventuras</genero>
<genero>Infantil</genero>
<genero>Fantasía</genero>
<genero>Infantil</genero>
<genero>Aventuras</genero>
<genero>Terror</genero>
<genero>Thriller</genero>
<genero>Terror</genero>
<genero>Fantasía</genero>
<genero>Terror</genero>
<genero>Thriller</genero>
```

### Predicados y operadores

1. Seleccionar un libro mediante un identificador concreto (L001):

```xpath
xmllint --xpath "/biblioteca/libro[@id='L001']" biblioteca.xml
```
```bash
<libro id="L001" disponible="true">
    <titulo>Wigetta: Un viaje mágico</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2015</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">16.95</precio>
    <valoracion>4.6</valoracion>
    <saga>Wigetta</saga>
  </libro>
```

2. Seleccionar los títulos de los libros disponibles:

```xpath
xmllint --xpath "/biblioteca/libro[@disponible='true']/titulo" biblioteca.xml
```
```bash
<titulo>Wigetta: Un viaje mágico</titulo>
<titulo>Wigetta y el báculo dorado</titulo>
<titulo>Los secretos de YouTube</titulo>
<titulo>Rescate en el tiempo</titulo>
<titulo>El secreto del valor</titulo>
<titulo>El instituto</titulo>
<titulo>Nuestra parte de noche</titulo>
<titulo>El hombre de tiza</titulo>
```

3. Seleccionar los libros de un género determinado (ej. "Terror"):

```xpath
xmllint --xpath "/biblioteca/libro[generos/genero='Terror']" biblioteca.xml
```
```bash
 <libro id="L008" disponible="true">
    <titulo>El instituto</titulo>
    <autor>
      <nombre>Stephen King</nombre>
      <nacionalidad>Estadounidense</nacionalidad>
    </autor>
    <anio_publicacion>2019</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Thriller</genero>
    </generos>
    <editorial>Plaza &amp; Janés</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
      <formato>Audiolibro</formato>
    </formatos>
    <precio moneda="EUR">22.90</precio>
    <valoracion>4.6</valoracion>
  </libro>
<libro id="L009" disponible="true">
    <titulo>Nuestra parte de noche</titulo>
    <autor>
      <nombre>Mariana Enríquez</nombre>
      <nacionalidad>Argentina</nacionalidad>
    </autor>
    <anio_publicacion>2019</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Anagrama</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">23.90</precio>
    <valoracion>4.7</valoracion>
  </libro>
<libro id="L010" disponible="true">
    <titulo>El hombre de tiza</titulo>
    <autor>
      <nombre>C. J. Tudor</nombre>
      <nacionalidad>Británica</nacionalidad>
    </autor>
    <anio_publicacion>2018</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Thriller</genero>
    </generos>
    <editorial>Plaza &amp; Janés</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
      <formato>Audiolibro</formato>
    </formatos>
    <precio moneda="EUR">19.90</precio>
    <valoracion>4.2</valoracion>
  </libro>
```
4. Seleccionar los libros publicados desde 2020, incluido:

```xpath
xmllint --xpath "/biblioteca/libro[anio_publicacion >= 2020]" biblioteca.xml
```

```bash
XPath set is empty
```
> Esto se debe a que no hay ningun libro después de 2020


5. Seleccionar los libros disponibles cuyo precio sea inferior a 20 euros:

```xpath
xmllint --xpath "/biblioteca/libro[@disponible='true' and precio < 20]" biblioteca.xml
```
> La mayoría valen menos de 20

6. Seleccionar los libros pertenecientes a uno de dos géneros utilizando or:

```xpath
xmllint --xpath "/biblioteca/libro[generos/genero='Terror' or generos/genero='Fantasía']" biblioteca.xml
```

```bash
 <libro id="L001" disponible="true">
    <titulo>Wigetta: Un viaje mágico</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2015</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">16.95</precio>
    <valoracion>4.6</valoracion>
    <saga>Wigetta</saga>
  </libro>
<libro id="L002" disponible="true">
    <titulo>Wigetta y el báculo dorado</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2015</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">16.95</precio>
    <valoracion>4.7</valoracion>
    <saga>Wigetta</saga>
  </libro>
<libro id="L006" disponible="true">
    <titulo>El secreto del valor</titulo>
    <autor>
      <nombre>Geronimo Stilton</nombre>
      <nacionalidad>Italiana</nacionalidad>
    </autor>
    <anio_publicacion>2016</anio_publicacion>
    <generos>
      <genero>Infantil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Destino Infantil &amp; Juvenil</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">19.95</precio>
    <valoracion>4.8</valoracion>
    <saga>Crónicas del Reino de la Fantasía</saga>
  </libro>
<libro id="L008" disponible="true">
    <titulo>El instituto</titulo>
    <autor>
      <nombre>Stephen King</nombre>
      <nacionalidad>Estadounidense</nacionalidad>
    </autor>
    <anio_publicacion>2019</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Thriller</genero>
    </generos>
    <editorial>Plaza &amp; Janés</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
      <formato>Audiolibro</formato>
    </formatos>
    <precio moneda="EUR">22.90</precio>
    <valoracion>4.6</valoracion>
  </libro>
<libro id="L009" disponible="true">
    <titulo>Nuestra parte de noche</titulo>
    <autor>
      <nombre>Mariana Enríquez</nombre>
      <nacionalidad>Argentina</nacionalidad>
    </autor>
    <anio_publicacion>2019</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Anagrama</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">23.90</precio>
    <valoracion>4.7</valoracion>
  </libro>
<libro id="L010" disponible="true">
    <titulo>El hombre de tiza</titulo>
    <autor>
      <nombre>C. J. Tudor</nombre>
      <nacionalidad>Británica</nacionalidad>
    </autor>
    <anio_publicacion>2018</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Thriller</genero>
    </generos>
    <editorial>Plaza &amp; Janés</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
      <formato>Audiolibro</formato>
    </formatos>
    <precio moneda="EUR">19.90</precio>
    <valoracion>4.2</valoracion>
  </libro>

```
7. Seleccionar los libros que no tengan el elemento opcional <saga>:

```xpath
xmllint --xpath "/biblioteca/libro[not(saga)]" biblioteca.xml
```

```bash
 <libro id="L004" disponible="true">
    <titulo>Los secretos de YouTube</titulo>
    <autor>
      <nombre>TheGrefg</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2018</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Ensayo</genero>
    </generos>
    <editorial>Martínez Roca</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">15.90</precio>
    <valoracion>4.4</valoracion>
  </libro>
<libro id="L005" disponible="true">
    <titulo>Rescate en el tiempo</titulo>
    <autor>
      <nombre>TheGrefg</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2016</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Aventuras</genero>
    </generos>
    <editorial>Martínez Roca</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">14.95</precio>
    <valoracion>4.3</valoracion>
  </libro>
<libro id="L008" disponible="true">
    <titulo>El instituto</titulo>
    <autor>
      <nombre>Stephen King</nombre>
      <nacionalidad>Estadounidense</nacionalidad>
    </autor>
    <anio_publicacion>2019</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Thriller</genero>
    </generos>
    <editorial>Plaza &amp; Janés</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
      <formato>Audiolibro</formato>
    </formatos>
    <precio moneda="EUR">22.90</precio>
    <valoracion>4.6</valoracion>
  </libro>
<libro id="L009" disponible="true">
    <titulo>Nuestra parte de noche</titulo>
    <autor>
      <nombre>Mariana Enríquez</nombre>
      <nacionalidad>Argentina</nacionalidad>
    </autor>
    <anio_publicacion>2019</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Anagrama</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">23.90</precio>
    <valoracion>4.7</valoracion>
  </libro>
<libro id="L010" disponible="true">
    <titulo>El hombre de tiza</titulo>
    <autor>
      <nombre>C. J. Tudor</nombre>
      <nacionalidad>Británica</nacionalidad>
    </autor>
    <anio_publicacion>2018</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Thriller</genero>
    </generos>
    <editorial>Plaza &amp; Janés</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
      <formato>Audiolibro</formato>
    </formatos>
    <precio moneda="EUR">19.90</precio>
    <valoracion>4.2</valoracion>
  </libro>
alumno@lnd-deb
```

### Posiciones y funciones

1. Seleccionar el primer y el último libro:

```xpath
xmllint --xpath "/biblioteca/libro[1] | /biblioteca/libro[last()]" biblioteca.xml
```

```bash
<libro id="L001" disponible="true">
    <titulo>Wigetta: Un viaje mágico</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2015</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">16.95</precio>
    <valoracion>4.6</valoracion>
    <saga>Wigetta</saga>
  </libro>
<libro id="L010" disponible="true">
    <titulo>El hombre de tiza</titulo>
    <autor>
      <nombre>C. J. Tudor</nombre>
      <nacionalidad>Británica</nacionalidad>
    </autor>
    <anio_publicacion>2018</anio_publicacion>
    <generos>
      <genero>Terror</genero>
      <genero>Thriller</genero>
    </generos>
    <editorial>Plaza &amp; Janés</editorial>
    <formatos>
      <formato>Tapa blanda</formato>
      <formato>Libro electrónico</formato>
      <formato>Audiolibro</formato>
    </formatos>
    <precio moneda="EUR">19.90</precio>
    <valoracion>4.2</valoracion>
  </libro>
```

2. Seleccionar los tres primeros libros del catálogo:

```xpath
xmllint --xpath "/biblioteca/libro[position() <= 3]" biblioteca.xml
```

```bash
<libro id="L001" disponible="true">
    <titulo>Wigetta: Un viaje mágico</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2015</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">16.95</precio>
    <valoracion>4.6</valoracion>
    <saga>Wigetta</saga>
  </libro>
<libro id="L002" disponible="true">
    <titulo>Wigetta y el báculo dorado</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2015</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Fantasía</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    <formatos>
      <formato>Tapa dura</formato>
      <formato>Libro electrónico</formato>
    </formatos>
    <precio moneda="EUR">16.95</precio>
    <valoracion>4.7</valoracion>
    <saga>Wigetta</saga>
  </libro>
<libro id="L003" disponible="false">
    <titulo>Wigetta y el antídoto secreto</titulo>
    <autor>
      <nombre>Willyrex &amp; Vegetta777</nombre>
      <nacionalidad>Española</nacionalidad>
    </autor>
    <anio_publicacion>2016</anio_publicacion>
    <generos>
      <genero>Juvenil</genero>
      <genero>Aventuras</genero>
    </generos>
    <editorial>Temas de Hoy</editorial>
    <formatos>
      <formato>Tapa dura</formato>
    </formatos>
    <precio moneda="EUR">16.95</precio>
    <valoracion>4.5</valoracion>
    <saga>Wigetta</saga>
 </libro>
```

3. Contar el número total de libros:

```xpath
xmllint --xpath "count(/biblioteca/libro)" biblioteca.xml
```

```bash
10
```

4. Contar cuántos libros pertenecen a un género concreto (ej. "Terror"):

```xpath
xmllint --xpath "count(/biblioteca/libro[generos/genero='Terror'])" biblioteca.xml
```

```bash
3
```
5. Buscar títulos que contengan una palabra mediante contains() (ej. "Wigetta"):

```xpath
xmllint --xpath "/biblioteca/libro[contains(titulo, 'Wigetta')]/titulo" biblioteca.xml
```

```bash
<titulo>Wigetta: Un viaje mágico</titulo>
<titulo>Wigetta y el báculo dorado</titulo>
<titulo>Wigetta y el antídoto secreto</titulo>
```

6. Calcular el precio medio utilizando sum(), count() y div:

```xpath
xmllint --xpath "sum(/biblioteca/libro/precio) div count(/biblioteca/libro)" biblioteca.xml
```
```bash
17.83
```

### Consultas con ejes de navegación

1. Partir de un elemento <genero> y utilizar ancestor::libro para obtener el título de su libro:

```xpath
xmllint --xpath "//genero/ancestor::libro/titulo" biblioteca.xml
```

```bash
<titulo>Wigetta: Un viaje mágico</titulo>
<titulo>Wigetta y el báculo dorado</titulo>
<titulo>Wigetta y el antídoto secreto</titulo>
<titulo>Los secretos de YouTube</titulo>
<titulo>Rescate en el tiempo</titulo>
<titulo>El secreto del valor</titulo>
<titulo>La isla de los dinosaurios</titulo>
<titulo>El instituto</titulo>
<titulo>Nuestra parte de noche</titulo>
<titulo>El hombre de tiza</titulo>
```
2. Partir de <titulo> y utilizar following-sibling para seleccionar el elemento <autor> del mismo libro:

```xpath
xmllint --xpath "/biblioteca/libro/titulo/following-sibling::autor" biblioteca.xml
```

```bash
<autor>
      <nombre>Geronimo Stilton</nombre>
      <nacionalidad>Italiana</nacionalidad>
    </autor>
<autor>
      <nombre>Stephen King</nombre>
      <nacionalidad>Estadounidense</nacionalidad>
    </autor>
<autor>
      <nombre>Mariana Enríquez</nombre>
      <nacionalidad>Argentina</nacionalidad>
    </autor>
<autor>
      <nombre>C. J. Tudor</nombre>
      <nacionalidad>Británica</nacionalidad>
    </autor>
```
