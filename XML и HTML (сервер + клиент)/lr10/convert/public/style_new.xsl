<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <body>
        <div class="style1">
          <pre>
Все меньшие n (n ≤ 10^6) натуральные числа,
которые являются палиндромами как в десятичной, так
и в двоичной системе</pre>
          <table>
            <tr>
              <th>Число в десятичной системе</th>
              <th>Число в двоичной системе</th>
            </tr>
            <xsl:for-each select="arrays/array">
              <tr>
                <xsl:for-each select="array">
                <td>
                    <xsl:value-of select="text()"/>&#160;
                </td>
                </xsl:for-each>
              </tr>
            </xsl:for-each>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
