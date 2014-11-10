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
    <!ENTITY foaf   "http://xmlns.com/foaf/0.1/">
    <!ENTITY sioc   "http://rdfs.org/sioc/ns#">
    <!ENTITY void   "http://rdfs.org/ns/void#">
    <!ENTITY sp     "http://spinrdf.org/sp#">
    <!ENTITY spin   "http://spinrdf.org/spin#">
    <!ENTITY list   "http://jena.hpl.hp.com/ARQ/list#">
    <!ENTITY gr     "http://purl.org/goodrelations/v1#">
    <!ENTITY rev    "http://purl.org/stuff/rev#">
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
xmlns:gr="&gr;"
xmlns:rev="&rev;"
exclude-result-prefixes="#all">

    <xsl:import href="../../../org/graphity/client/xsl/functions.xsl"/>
    <xsl:import href="../../../org/graphity/client/xsl/group-sort-triples.xsl"/>
    <xsl:import href="../../../org/graphity/client/xsl/global-xhtml.xsl"/>

    <xsl:preserve-space elements="gr:name skos:prefLabel rev:title"/>

    <rdf:Description rdf:about="">
	<dct:created rdf:datatype="&xsd;dateTime">2014-11-08T17:30:00+01:00</dct:created>
    </rdf:Description>

</xsl:stylesheet>