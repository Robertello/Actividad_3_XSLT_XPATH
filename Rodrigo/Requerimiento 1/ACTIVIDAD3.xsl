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




<h2>Formulario de contacto</h2>
				<form method="post">

						<b>Profesor a contactar: </b>
						<select name="persona">
							<xsl:for-each select="ite/profesores/profesor">
								<option value="nombre">
									<xsl:value-of select="nombre"/>
								</option>
							</xsl:for-each>
						</select>
            <br/>
						<b>Cual es tu curso: </b>
						<select name="curso">
							<xsl:for-each select="ite/ciclos/ciclo">
								<option value="ciclo">
									<xsl:value-of select="nombre"/>
								</option>
							</xsl:for-each>
						</select>
            <br/>
						<b>Nombre: </b>
						<input type="text" name="Nombre" required="" placeholder="*su nombre aqui"/>
            <br/>
						<b>Apellidos: </b>
						<input type="text" name="Apellidos" required="" placeholder="*sus apellidos aqui"/>
            <br/>
						<b>Email: </b>
						<input type="email" name="Email" required="" placeholder="*su email aqui"/>
            <br/>
						<b>Direccion: </b>
						<input type="text" name="Direccion" required="" placeholder="*su direccion aqui"/>
            <br/>
						<b>Codigo postal: </b>
						<input type="number" maxlenght="5" required="required" placeholder="*su codigo postal aqui"/>
            <br/>
						<b>Telefono: </b>
						<input type="tel" name="Telefono" required="" pattern="[0-9]{9}" placeholder="*su telefono aqui"/>
				</form>

  <hr/>
<h2>Enlaces</h2>
  <br/>

    <a href="{ite/@web}">
      Accede a la web : 
          <xsl:value-of select="ite/@web"/>

    </a>
    <br/>

    <a href="tel:{ite/telefono}">Nuestro telefono</a>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
