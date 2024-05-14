{% load static %}<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">

  <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta name="color-scheme" content="light dark" />
      <link rel="stylesheet" href="{% static "blog/pico.min.css" %}" />
      <title>RSS Feed | <xsl:value-of select="/rss/channel/title"/></title>
    </head>
    <body>
      <main class="container">
        <header>
          <p>This is the RSS feed for my blog, with style!</p>
        </header>
        <h1>Recent blog posts</h1>
        <xsl:for-each select="/rss/channel/item">
          <article>
            <a>
              <xsl:attribute name="href"><xsl:value-of select="link/@href"/></xsl:attribute>
              <h2><xsl:value-of select="title"/></h2>
              <p><xsl:value-of select="description"/></p>
              <p>
                <small>
                  Published on:
                  <time>
                    <xsl:attribute name="datetime"><xsl:value-of select="pubDate"/></xsl:attribute>
                    <xsl:value-of select="pubDate"/>
                  </time>
                </small>
              </p>
            </a>
          </article>
        </xsl:for-each>
        <footer>
          <p>
            Want more?
            <a href="{% url "admin:blog_post_add" %}">Add posts in the admin</a>
            (username: <code>test</code>, password: <code>test</code>).
          </p>
        </footer>
      </main>
    </body>
  </html>

  </xsl:template>
</xsl:stylesheet>
