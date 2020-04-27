<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body {
                        font-size: 24px;
                    }
                    table {
                        border: 1px solid black;
                    }

                    td {
                        border: 1px solid black;
                    }
                </style>
            </head>
            <body>
                <div>
                    <table>
                        <thead>
                            <th>name</th>
                            <th>email</th>
                            <th>calculation of carbon footprint</th>
                            <th>quantity of trees</th>
                            <th>id</th>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="climate" mode="head"></xsl:apply-templates>
                        </tbody>
                    </table>
                </div>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="medicament" mode="head">

            <tr>
                <td>
                    <xsl:value-of select="//person/@name"></xsl:value-of>
                </td>
                <td>
                    <xsl:value-of select="//mail/@email"></xsl:value-of>
                </td>
                <td>
                    <xsl:value-of select="//calculation/@tons"></xsl:value-of>
                <td>
                    <xsl:value-of select="//tree/@quantity"></xsl:value-of>
                </td>
                <td>
                    <xsl:text><xsl:value-of select="generate-id()"/></xsl:text>
                </td>
            </tr>
    </xsl:template>


</xsl:stylesheet>