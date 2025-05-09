mapping_pattern_query = {}
mapping_pattern_query['SE'] = """
PREFIX ex: <http://example.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ?s_table ?s_pk 
WHERE {
  ?s_table a ex:table .
  ?s_table ex:hasPK ?s_pk .
  ?s_table ex:hasC ?s_c .
}
"""

mapping_pattern_query['SE'] = """
PREFIX ex: <http://example.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ?s_table ?s_pk 
WHERE {
  ?s_table a ex:table .
  ?s_table ex:hasPK ?s_pk .
}
"""

mapping_pattern_query['SR'] = """
PREFIX ex: <http://example.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ?s_table ?s_pk ?t_pk1 ?t_table ?t_pk2 ?r_pk ?r_table  
WHERE {
  ?s_table a ex:table .
  ?t_table a ex:table .
  ?r_table a ex:table .
  FILTER (?s_table != ?t_table)
  FILTER (?s_table != ?r_table)
  FILTER (?t_table != ?r_table)

  ?s_table ex:hasPK ?s_pk .
  ?r_table ex:hasPK ?r_pk .
  ?t_table ex:hasPK ?t_pk1 .
  ?t_table ex:hasPK ?t_pk2 .
  FILTER (?t_pk1 != ?t_pk2)
  ?t_pk1 ex:hasFK ?s_pk .
  ?t_pk2 ex:hasFK ?r_pk .
}
"""

mapping_pattern_query['SRm'] = """
PREFIX ex: <http://example.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ?t_pk ?t_table ?t_c ?s_pk ?s_table   
WHERE {
  ?s_table a ex:table .
  ?t_table a ex:table .
  ?s_table ex:hasPK ?s_pk .
  ?t_table ex:hasC ?t_c .
  ?t_table ex:hasPK ?t_pk .
  ?t_c ex:hasFK ?s_pk .
}
"""

mapping_pattern_query['SH'] = """
PREFIX ex: <http://example.org/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ?s_table ?s_pk ?t_pk ?t_table 
WHERE {
  ?s_table a ex:table .
  ?t_table a ex:table .
  FILTER (?s_table != ?t_table)
  ?s_table ex:hasPK ?s_pk .
  ?t_table ex:hasPK ?t_pk .
  ?t_pk ex:hasFK ?s_pk .
  FILTER NOT EXISTS { ?t_table ex:hasPK ?other_pk . FILTER (?other_pk != ?t_pk) }
}
"""