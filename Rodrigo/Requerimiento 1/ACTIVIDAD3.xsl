<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <link rel="stylesheet" type="text/css" href="css/estilos.css" />
<body>
  <h2>Profesores</h2>
  <table>
    <tr bgcolor="#9acd32">
      <th>Id</th>
      <th>Nombre</th>
    </tr>
    <xsl:for-each select="ite/profesores/profesor">
    <tr>
      <td><xsl:value-of select="id"/></td>
      <td><xsl:value-of select="nombre"/></td>
    </tr>
    </xsl:for-each>
  </table>

  <h2>Directora:</h2>

  <xsl:for-each select="/ite/director">
  <p>
      Nombre: <span style="color:red"> <xsl:value-of select="nombre"/>
     </span> <br/>
      Despacho: <b><xsl:value-of select="despacho"/></b> <br/>
      </p>
  </xsl:for-each>

  <h2>Jefe de estudios:</h2>
  <table>
    <tr bgcolor="#93434de4">
      <th >Nombre</th>
      <th >Despacho</th>
    </tr>
    <xsl:for-each select="/ite/jefe_estudios">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select="despacho"/></td>
    </tr>
    </xsl:for-each>
  </table>
  <h2>Ciclos:</h2>
  <table>
    <tr bgcolor="#23459de4">
      <th>Nombre</th>
      <th>Tipo</th>
    </tr>
    <xsl:for-each select="/ite/ciclos/ciclo">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select="grado"/></td>
    </tr>
    </xsl:for-each>
  </table>
  <hr/>
  <table>
    <tr bgcolor="#2349ad45">
      <th>Empresa</th>
      <th>Numero</th>
    </tr>
    <xsl:for-each select="/ite">
    <tr>
      <td><xsl:value-of select="empresa"/></td>
      <td><xsl:value-of select="telefono"/></td>
    </tr>
    </xsl:for-each>
  </table>
  <hr/>
<!-- Pinta todo el contenido -->
<h2>Contenido de profesores</h2>
  <xsl:value-of select="/ite/profesores" />
  <hr/>

  <h2>El ultimo profesor</h2>
  <xsl:value-of select="/ite/profesores/profesor[last()]" />
  <hr/>

  <h2>Ciclo ASIR </h2>
  <xsl:value-of select="/ite/ciclos/ciclo[1]" />
  <hr/>
  <h2>Listas ordenadas</h2>
  <xsl:for-each select="ite/profesores/profesor">
    <ol>
        <li>Nombre: <xsl:value-of select="nombre"/></li>
        <li>ID: <xsl:value-of select="id"/></li>
    </ol>
</xsl:for-each>

<hr/>
<xsl:for-each select="ite/profesores/profesor">
  <ul>
      <li>ID:<xsl:value-of select="id"/></li>
  </ul>
</xsl:for-each>

<hr/>

<xsl:for-each select="ite/profesores/profesor">
<p>
    Profesor: <span style="color:red"> <xsl:value-of select="nombre"/>
   </span> <br/>
    ID: <b><xsl:value-of select="id"/></b> <br/>
    </p>
</xsl:for-each>

<hr/>
<h2>Enlaces</h2>
<a>
    <xsl:attribute name="href">
      <xsl:value-of select="ite/empresa/@enlace"/>
    </xsl:attribute>
    <xsl:value-of select="ite/empresa"/>
</a>
<br/>

<a>
    <xsl:attribute name="href">
      <xsl:value-of select="ite/telefono/@enlace"/>
    </xsl:attribute>
    <xsl:value-of select="ite/telefono"/>
</a>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
