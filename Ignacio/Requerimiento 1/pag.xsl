<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
        <html>
            <head>
                <title>Actividad 4</title>
            </head>
            <body>
                <h2><a href="https://institutotecnologico.edix.com/group/campus/home">Instituto Tecnológico</a></h2>
                <!-- Tabla 1-->
                <table border="1">
                
                    <tr>
                        <th style="text-aling:left">id</th>
                        <th style="text-aling:left">Nombre</th>
                    </tr>
                    <xsl:for-each select="ite/profesores/profesor">
                    <tr>
                        <td><xsl:value-of select="id"/></td>
                        <td><xsl:value-of select="nombre"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
                <br/>
                <!-- Tabla 2-->
                <table border="2">
                    <tr>
                        <th style="text-aling:left">Ciclo</th>
                        <th style="text-aling:left">Nombre</th>
                        <th style="text-aling:left">Grado</th>
                        <th style="text-aling:left">Año</th>
                    </tr>
                    <xsl:for-each select="ite/ciclos/ciclo">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="grado"/></td>
                            <td><xsl:value-of select="decretoTitulo/@año"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <br/>
                <!-- Inicio de lista-->
                <ul>
                    <xsl:for-each select="ite/director">
                    <li>Director
                        <ol>
                            <li>Nombre: <xsl:value-of select="nombre"/></li>
                            <li>Despacho: <xsl:value-of select="despacho"/></li>
                        </ol>
                    </li>
                    </xsl:for-each>
                    <xsl:for-each select="ite/jefe_estudios">
                        <li>Jefe de Estudio
                            <ul>
                                <li>Nombre: <xsl:value-of select="nombre"/></li>
                                <li>Despacho: <xsl:value-of select="despacho"/></li>
                            </ul>
                        </li>
                    </xsl:for-each>
                </ul>
                <br/>
                <!-- Formulario-->
                <form method="post">
                    <p>
                        Nombre:
                        <input type="text" name="Nombre" size="30" required=""/>
                    </p>
                    <p>
                        Apellido 1:
                        <input type="text" name="Apellido1" size="50" required=""/>
                    </p>
                    <p>
                        Apellido 2:
                        <input type="text" name="Apellido2" size="50" required=""/>
                    </p>
                    <p>
                        Año Nacimiento:
                        <input type="number" name="Nacimiento" min="1900" required="" placeholder="dd/mm/aaaa"/>
                    </p>
                    <p>
                        Dirección:
                        <input type="text" name="Direccion" required=""/>
                    </p>
                    <p>
                        Codigo Postal:
                        <input type="number" name="CP" maxlenght="5" required=""/>
                    </p>
                    <p>
                        Sexo:
                        <input type="radio" name="Sexo" value="h" required=""/>Hombre
                        <input type="radio" name="Sexo" value="m" required=""/>Mujer
                    </p>
                    <input type="submit" value="Enviar"/>
                    <input type="reset" value="Borrar"/>
                </form>
                <br/>
                <footer>
                    <xsl:for-each select="ite">
                    <p>Empresa: <xsl:value-of select="empresa"/></p>
                    <p>Telefono de contacto: <xsl:value-of select="telefono"/></p>
                    <a href="{@web}">Sitio web: <xsl:value-of select="@web"/></a>
                    </xsl:for-each>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 