#!/bin/bash
QUERY='primary[All Fields] AND ("immunologic deficiency syndromes"[MeSH Terms] OR ("immunologic"[All Fields] AND "deficiency"[All Fields] AND "syndromes"[All Fields]) OR "immunologic deficiency syndromes"[All Fields] OR "immunodeficiency"[All Fields]) AND ("genetics"[Subheading] OR "genetics"[All Fields] OR "genetics"[MeSH Terms]) AND ("latin america"[All Fields] OR "Argentina"[All Fields] OR "Belize"[All Fields] OR "Bolivia"[All Fields] OR "Brazil"[All Fields] OR "Chile"[All Fields] OR "Colombia"[All Fields] OR "Costa Rica"[All Fields] OR "Ecuador"[All Fields] OR "El Salvador"[All Fields] OR "Falkland Islands"[All Fields] OR "French Guiana"[All Fields] OR "Guatemala"[All Fields] OR "Guyana"[All Fields] OR "Honduras"[All Fields] OR "Mexico"[All Fields] OR "Nicaragua"[All Fields] OR "Panama"[All Fields] OR "Paraguay"[All Fields] OR "Peru"[All Fields] OR "Suriname"[All Fields] OR "Uruguay"[All Fields] OR "Venezuela"[All Fields]) NOT “hiv” [MeSH Terms]'

# Buscando os artigos e coletando somente os DOI dos resultados encontrados

echo '-- Buscando artigos na base PubMed'
echo '	 Isto pode levar um tempo. Por favor, aguarde...' 
./esearch -db pubmed -query $QUERY | ./efetch -format medline | grep '\[doi\]' > doi.txt
echo '	 Artigos da base PubMed buscados com sucesso!'
echo ''
echo '-- Buscando artigos na base PubMed Central ...'
echo '	 Isto pode levar um tempo. Por favor, aguarde...' 
./esearch -db pmc -query $QUERY | ./efetch -format medline | grep '\[doi\]' >> doi.txt
echo '	 Artigos da base PubMed Central buscados com sucesso!'
echo ''
echo '-- Buscando artigos no SciHub, aguarde ...'
echo '	 (Mentira, ainda não)'
echo '	 Finalizado'
