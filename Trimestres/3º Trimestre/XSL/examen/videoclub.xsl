<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">


    <xsl:template match="/videoclub">
        <html>
            <head>
                <title></title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">
                    
                    <xsl:call-template name="primerEjercicio"/>
                    <p/><p/>
                    <xsl:call-template name="segundoEjercicio"/>
                    <p/><p/>
                    <xsl:call-template name="tercerEjercicio"/>
                </div>
            </body>
        </html>
    </xsl:template>


    <xsl:template name="primerEjercicio">
        <table border="1" width="100%">
            <tr>
                <th>Titulo</th>
                <th>Pegi</th>
                <th>Duracion/Plataforma</th>
                <th>Alquiler diario</th>
            </tr>
            
            <xsl:for-each select="Peliculas">
                <xsl:for-each select="pelicula">
                    <xsl:sort select="@order"/>
                    <tr>
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 1">
                                <xsl:attribute name="bgcolor">#FDFA39</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="position() mod 2 = 0">
                                <xsl:attribute name="bgcolor">#FFFEAC</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        
                        <td><xsl:value-of select="@titulo"/></td>
                        <td><xsl:value-of select="@pegi"/></td>
                        <td><xsl:value-of select="@duracionEnMinutos"/></td>
                        <td><xsl:value-of select="@alquilerDiario"/></td>
                        
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="videojuegos">
                <xsl:for-each select="videoJuego">
                    <xsl:sort select="@order"/>
                    <tr>                     
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 1">
                                <xsl:attribute name="bgcolor">#A5FF5B</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="position() mod 2 = 0">
                                <xsl:attribute name="bgcolor">#CCFFA2</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        
                        <td><xsl:value-of select="."/></td>
                        <td><xsl:value-of select="@pegi"/></td>
                        <td><xsl:value-of select="@plataforma"/></td>
                        <td><xsl:value-of select="@alquilerDiario"/></td>
                        
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
      
    
    <xsl:template name="segundoEjercicio">
        <table border="1" width="100%" style="" id="tablaSegundoEjercicio">
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
        </table>
        
    </xsl:template>
    
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 5">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 5">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="/videoclub/Peliculas/pelicula">
                <xsl:if test="coordenadas = @x , @y ">
                    <xsl:value-of select="@titulo"/>
                    <xsl:value-of select="@pegi"/>
                    <xsl:value-of select="@duracionEnMinutos"/>
                    <xsl:value-of select="@alquilerDiario"/>
                    
                    <xsl:attribute name="bgcolor">#FDFA39</xsl:attribute>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:for-each select="/videoclub/videojuegos/videojuego">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:value-of select="."/>
                    <xsl:value-of select="@pegi"/>
                    <xsl:value-of select="@plataforma"/>
                    <xsl:value-of select="@alquilerDiario"/>
                    
                    <xsl:attribute name="bgcolor">#A5FF5B</xsl:attribute>

                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    
    <xsl:template name="tercerEjercicio">
        <p>El juego con pegi más alto</p>
        <p>La película más corta es</p>
    </xsl:template>
    
    
    <xsl:template name="css">
        <style type="text/css">
            body {
            font-family: Arial;
            font-size: 11px;
            }
            
            th {
            background: #000FFF;
            color: #FFFFFF;
            }       
        </style>
    </xsl:template>
    
</xsl:stylesheet>