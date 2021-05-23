<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
		<a name="inicio"></a>
			<head>
				<title>Actividad 4 - Bienvenidos al ITE</title>
			</head>
			<body>
				<link rel="stylesheet" type="text/css" href="archivo.css"/>
				<!-- con esta etiqueta seleccionamos el texto de este nodo y con la @ indicamos que es un atributo -->
				<h1>
					<xsl:value-of select="ite/@nombre"/>
				</h1>
				<h2>Responsables del centro</h2>
				<!--Lista ordenada Responsables centro-->
				<ol type="I">
					<xsl:for-each select="ite">
						<li>
						Directora:
						<xsl:value-of select="director/nombre"/>
						</li>
						<ul>
							<li>
							Despacho:
							<xsl:value-of select="director/despacho"/>
							</li>
						</ul>
						<li>
						Jefe de estudios:
							<xsl:value-of select="jefe_estudios/nombre"/>
						</li>
						<ul>
							<li>
							Despacho:
							<xsl:value-of select="jefe_estudios/despacho"/>
							</li>
						</ul>
					</xsl:for-each>
				</ol>
				<br/>
				<h2>Estudios que impartimos</h2>
				<!-- Tabla Ciclos -->
				<table border="2">
					<tr>
						<th>Grados disponibles</th>
					</tr>
					<tr>
						<td>Nombre</td>
						<td>Tipo de grado</td>
						<td>Anno de decreto</td>
					</tr>
					<xsl:for-each select="ite/ciclos/ciclo">
						<tr>
							<td>
								<xsl:value-of select="nombre"/>
							</td>
							<td>
								<xsl:value-of select="grado"/>
							</td>
							<td>
								<xsl:value-of select="decretoTitulo/@año"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<br/>
				<h2>Personal docente</h2>
				<!-- Tabla profesores -->
				<table border="1">
					<tr>
						<th>Profesores</th>
					</tr>
					<xsl:for-each select="ite/profesores/profesor">
						<tr>
							<td>
								<xsl:value-of select="nombre"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<br/>
				<h2>Formulario de contacto</h2>
				<form method="post">
					<p>
						<b>Persona a contactar: </b>
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
					</p>
					<p>
						<b>Curso: </b>
						<select name="curso">
							<xsl:for-each select="ite/ciclos/ciclo">
								<option value="ciclo">
									<xsl:value-of select="nombre"/>
								</option>
							</xsl:for-each>
						</select>
					</p>
					<p>
						<b>Nombre: </b>
						<input type="text" name="Nombre" required="" placeholder="*su nombre aqui"/>
					</p>
					<p>
						<b>Apellidos: </b>
						<input type="text" name="Apellidos" required="" placeholder="*sus apellidos aqui"/>
					</p>
					<p>
						<b>Email: </b>
						<input type="email" name="Email" required="" placeholder="*su email aqui"/>
					</p>
					<p>
						<b>Direccion: </b>
						<input type="text" name="Direccion" required="" placeholder="*su direccion aqui"/>
					</p>
					<p>
						<b>Codigo postal: </b>
						<input type="number" maxlenght="5" required="required" placeholder="*su codigo postal aqui"/>
					</p>
					<p>
						<b>Telefono: </b>
						<input type="tel" name="Telefono" required="" pattern="[0-9]{9}" placeholder="*su telefono aqui"/>
					</p>
					<p>
						<b>País: </b>
						<select name="pais">
							<option value="AR">Argentina</option>
							<option value="CL">Chile</option>
							<option value="ES" selected="España">España</option>
							<option value="PY">Paraguay</option>
							<option value="PE">Perú</option>
						</select>
					</p>
					<p>
						<b>Escriba el motivo de su contacto</b>
					</p>
					<textarea name="" id="" cols="30" rows="10" style="margin: 0px; width: 500px; height: 260px;"/>
					<input id="botonborrar" type="reset" value="Borrar formulario"/>
					<small>  Todos los campos con "<b>*</b>" son obligatorios</small>
					<br/>
					<br/>
					<input id="botonenviar" type="submit" value="Enviar formulario"/>
				</form>
			</body>
			<footer>
				<p>
					<xsl:value-of select="ite/empresa"/>
				</p>
				<p>
					<xsl:value-of select="ite/telefono"/>
				</p>
				
				<a href="{ite/@web}"> <xsl:value-of select="ite/@web"/></a>
				<br></br>
				<a href="#inicio">Volver a inicio</a>
			</footer>
		</html>
	</xsl:template>
</xsl:stylesheet>
