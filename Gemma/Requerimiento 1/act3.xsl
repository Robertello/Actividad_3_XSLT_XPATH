<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
<html>
<link rel="stylesheet" type="text/css" href="css/estilos.css"/>
<body>
<h1><a href="{ite/@web}">Instituto Tecnologico Edix</a></h1>
<!--Lista no ordenada de la directiva-->
<h2>Directiva</h2>
	<ul>
		<xsl:for-each select="ite">
		<li><b>Directora: </b> <xsl:value-of select="director/nombre"/>
		    <ul>     <li><b>Despacho: </b>	<xsl:value-of select="director/despacho"/></li>
                   </ul>
                </li>
<br/>
		<li><b>Jefe de estudios: </b><xsl:value-of select="jefe_estudios/nombre"/>
		    <ul><li><b>Despacho: </b><xsl:value-of select="jefe_estudios/despacho"/></li>
                    </ul>
	         </li>
</xsl:for-each>
	</ul>
<br/>
<!--Tabla ciclos formativos-->
<h2>Ciclos Formativos</h2>
  <table border="1">
    <tr bgcolor="#33ccff">
      <th>Nombre</th>
      <th>Grado</th>
      <th>Decreto</th>
    </tr>
    <xsl:for-each select="ite/ciclos/ciclo">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select="grado"/></td>
      <td><xsl:value-of select="decretoTitulo"/></td>
    </tr>
    </xsl:for-each>
  </table>
<br/>
<!--Tabla no ordenada de profesores-->
<h2>Profesores</h2>
  <table border="1">
    <tr bgcolor="#751aff">
      <th>ID</th>
      <th>Nombre</th>
    </tr>
    <xsl:for-each select="ite/profesores/profesor">
    <tr>
      <td><xsl:value-of select="id"/></td>
      <td><xsl:value-of select="nombre"/></td>
    </tr>
    </xsl:for-each>
  </table>
<br/>
<!--Formulario-->
<h2><u>Formulario de contacto</u></h2>
<form method="post">
	<b>Nombre: </b>
    	<input type="text" name="Nombre" required="required" placeholder= "Escriba aqui su nombre"/>
    <br/>
	<b>Apellidos: </b>
	    <input type="text" name="Apellidos" required="required" placeholder= "Escriba aqui sus apellidos"/>
     <br/>
	<b>Email: </b>
		<input type="email" name="Email" required="required" placeholder= "Escriba aqui su email"/>
    <br/>
        <b>Telefono: </b>
            <input type="tel" name="Telefono" required="required" pattern="[0-9]{9}" placeholder= "Escriba aqui su telefono"/>
     <br/>
	<b>Provincia: </b>
	    <input type="text" name="Provincia" required="" placeholder= "Escriba aqui su provincia"/>
    <br/>
    <b>Persona con la que desea contactar: </b>
    <select name="persona">
	<xsl:for-each select="ite/director">
		<option value="nombre">
		  <xsl:value-of select="nombre"/>
	        </option>
	          </xsl:for-each>
		    <xsl:for-each select="ite/jefe_estudios">
		  <option value="nombre">								 
                      <xsl:value-of select="nombre"/>	 
                  </option>
		   </xsl:for-each>
		     <xsl:for-each select="ite/profesores/profesor">
		  <option value="nombre"> 			 
                     <xsl:value-of select="nombre"/>
	</option>
	</xsl:for-each>
      </select>
	<br/>
	<b>Seleccione un ciclo formativo: </b>
		<select name="curso">
			<xsl:for-each select="ite/ciclos/ciclo">
			    <option value="ciclo">
			       <xsl:value-of select="nombre"/>
			    </option>
			</xsl:for-each>
	        </select>

	<b>Mensaje: </b>
	        <textarea name="" id="" cols="30" rows="10" style="margin: 10px; width: 500px; height: 250px;"/>

		<input id="botonEnviar" type="submit" value="Enviar"/>
</form>
</body>
<!--Footer con nombre de la empresa y enlace al telefono-->
<footer>
	<xsl:value-of select="ite/empresa"/>
        
        <a href="tel:{ite/telefono}"> +34 91 787 39 91</a>
</footer>
		</html>
	</xsl:template>
</xsl:stylesheet>