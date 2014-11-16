<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright 2014 Martynas Jusevičius <martynas@graphity.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<!DOCTYPE xsl:stylesheet [
    <!ENTITY java   "http://xml.apache.org/xalan/java/">
    <!ENTITY gc     "http://graphity.org/gc#">
    <!ENTITY gp     "http://graphity.org/gp#">
    <!ENTITY rdf    "http://www.w3.org/1999/02/22-rdf-syntax-ns#">
    <!ENTITY rdfs   "http://www.w3.org/2000/01/rdf-schema#">
    <!ENTITY xsd    "http://www.w3.org/2001/XMLSchema#">
    <!ENTITY owl    "http://www.w3.org/2002/07/owl#">
    <!ENTITY skos   "http://www.w3.org/2004/02/skos/core#">
    <!ENTITY sparql "http://www.w3.org/2005/sparql-results#">
    <!ENTITY ldp    "http://www.w3.org/ns/ldp#">
    <!ENTITY dct    "http://purl.org/dc/terms/">
    <!ENTITY gr     "http://purl.org/goodrelations/v1#">
    <!ENTITY rev    "http://purl.org/stuff/rev#">
    <!ENTITY sioc   "http://rdfs.org/sioc/ns#">
    <!ENTITY void   "http://rdfs.org/ns/void#">
    <!ENTITY sp     "http://spinrdf.org/sp#">
    <!ENTITY spin   "http://spinrdf.org/spin#">
    <!ENTITY foaf   "http://xmlns.com/foaf/0.1/">
    <!ENTITY list   "http://jena.hpl.hp.com/ARQ/list#">
    <!ENTITY aht    "http://addhashtags.com/aht#">
]>
<xsl:stylesheet version="2.0"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xhtml="http://www.w3.org/1999/xhtml"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:gc="&gc;"
xmlns:gp="&gp;"
xmlns:rdf="&rdf;"
xmlns:rdfs="&rdfs;"
xmlns:owl="&owl;"
xmlns:sparql="&sparql;"
xmlns:skos="&skos;"
xmlns:dct="&dct;"
xmlns:foaf="&foaf;"
xmlns:sioc="&sioc;"
xmlns:void="&void;"
xmlns:sp="&sp;"
xmlns:ldp="&ldp;"
xmlns:list="&list;"
xmlns:aht="&aht;"
xmlns:gr="&gr;"
xmlns:rev="&rev;"
exclude-result-prefixes="#all">

    <xsl:import href="../../../org/graphity/client/xsl/functions.xsl"/>
    <xsl:import href="../../../org/graphity/client/xsl/group-sort-triples.xsl"/>
    <xsl:import href="../../../org/graphity/client/xsl/global-xhtml.xsl"/>

    <xsl:preserve-space elements="gr:name gr:hasMPN skos:prefLabel rev:title"/>

    <rdf:Description rdf:about="">
	<dct:created rdf:datatype="&xsd;dateTime">2014-11-08T17:30:00+01:00</dct:created>
    </rdf:Description>

    <xsl:template match="dct:subject/@rdf:resource | dct:subject/@rdf:nodeID" mode="gc:EditMode">
        <select name="ou" id="{generate-id(..)}" multiple="multiple" size="8">
            <xsl:apply-templates select="key('resources-by-type', '&aht;Category', document(resolve-uri('categories?limit=100', $gp:baseUri)))" mode="gc:OptionMode">
                <xsl:sort select="gc:label(.)" order="ascending"/>
                <xsl:with-param name="selected" select="../@rdf:resource"/>
            </xsl:apply-templates>
        </select>

        <span class="help-inline">Resource</span>
    </xsl:template>

    <xsl:template match="gr:hasManufacturer/@rdf:resource | gr:hasManufacturer/@rdf:nodeID" mode="gc:EditMode">
        <select name="ou" id="{generate-id(..)}">
            <xsl:apply-templates select="key('resources-by-type', '&aht;Producer', document(resolve-uri('producers?limit=100', $gp:baseUri)))" mode="gc:OptionMode">
                <xsl:sort select="gc:label(.)" order="ascending"/>
                <xsl:with-param name="selected" select="../@rdf:resource"/>
            </xsl:apply-templates>
        </select>

        <span class="help-inline">Resource</span>
    </xsl:template>

    <xsl:template match="aht:isReviewOf/@rdf:resource | aht:isReviewOf/@rdf:nodeID" mode="gc:EditMode">
        <select name="ou" id="{generate-id(..)}">
            <xsl:apply-templates select="key('resources-by-type', '&aht;Product', document(resolve-uri('products?limit=100', $gp:baseUri)))" mode="gc:OptionMode">
                <xsl:sort select="gc:label(.)" order="ascending"/>
                <xsl:with-param name="selected" select="../@rdf:resource"/>
            </xsl:apply-templates>
        </select>

        <span class="help-inline">Resource</span>
    </xsl:template>

    <xsl:template match="foaf:logo/@rdf:nodeID | owl:sameAs/@rdf:nodeID" mode="gc:EditMode">
	<xsl:param name="type" select="'text'" as="xs:string"/>
	<xsl:param name="id" as="xs:string?"/>
	<xsl:param name="class" as="xs:string?"/>

        <xsl:call-template name="gc:InputTemplate">
            <xsl:with-param name="name" select="'ou'"/>
            <xsl:with-param name="type" select="$type"/>
            <xsl:with-param name="value" select="''"/>
            <xsl:with-param name="id" select="$id"/>
            <xsl:with-param name="class" select="$class"/>
        </xsl:call-template>
        
        <xsl:if test="not($type = 'hidden')">
            <span class="help-inline">Resource</span>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>