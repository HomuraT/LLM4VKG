import rdflib
from rdflib.namespace import OWL, RDF, RDFS
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import itertools

def load_ontology(file_path, file_format="xml"):
    """
    Load an ontology file into an rdflib.Graph object.
    Specify file format explicitly to handle different file types.
    """
    g = rdflib.Graph()
    g.parse(file_path, format=file_format)
    return g

def extract_labels(graph):
    """
    Extract all URIs and their labels or URIs as identifiers from the ontology graph.
    Handles classes, object properties, and data properties.
    """
    entities = {}

    # Extract OWL Classes
    for s in graph.subjects(RDF.type, OWL.Class):
        label = extract_label_or_uri(graph, s)
        entities[s] = label

    # Extract Object Properties
    for s in graph.subjects(RDF.type, OWL.ObjectProperty):
        label = extract_label_or_uri(graph, s)
        entities[s] = label

    # Extract Data Properties
    for s in graph.subjects(RDF.type, OWL.DatatypeProperty):
        label = extract_label_or_uri(graph, s)
        entities[s] = label

    return entities

def extract_label_or_uri(graph, entity):
    """
    Extract the label of an entity, or fallback to its URI.
    Tries multiple predicates to find a suitable label.
    """
    label_predicates = [RDFS.label, rdflib.URIRef("http://purl.org/dc/elements/1.1/title"),
                        rdflib.URIRef("http://www.w3.org/2004/02/skos/core#prefLabel")]

    for predicate in label_predicates:
        for _, _, o in graph.triples((entity, predicate, None)):
            return str(o)
    return str(entity)  # Fallback to URI

def compute_similarity(entities1, entities2, threshold=0.7):
    """
    Compute similarity between entities from two ontologies using TF-IDF cosine similarity.
    Returns pairs of potentially equivalent entities.
    """
    labels1 = list(entities1.values())
    labels2 = list(entities2.values())

    vectorizer = TfidfVectorizer().fit(labels1 + labels2)
    vec1 = vectorizer.transform(labels1)
    vec2 = vectorizer.transform(labels2)

    similarities = cosine_similarity(vec1, vec2)
    mappings = []

    for i, j in itertools.product(range(len(labels1)), range(len(labels2))):
        if similarities[i, j] >= threshold:
            mappings.append((list(entities1.keys())[i], list(entities2.keys())[j]))

    return mappings

def save_mappings(mappings, output_file):
    """
    Save mappings as an RDF file in the textsim_mappings.ttl format.
    """
    g = rdflib.Graph()
    for entity1, entity2 in mappings:
        g.add((entity1, OWL.sameAs, entity2))
    g.serialize(destination=output_file, format='turtle')

def merge_ontologies(ontology1, ontology2, mappings_file, output_file, ontology1_format="turtle", ontology2_format="xml"):
    """
    Merge two ontologies based on a mappings file and save the result as a new ontology file.
    Convert `owl:sameAs` relations to `owl:equivalentClass` or `owl:equivalentProperty` as needed.
    """
    # Create a new graph to hold the merged ontology
    merged_graph = rdflib.Graph()

    # Parse the two ontologies into the merged graph
    merged_graph.parse(ontology1, format=ontology1_format)
    merged_graph.parse(ontology2, format=ontology2_format)

    # Parse the mappings file
    mappings_graph = rdflib.Graph()
    mappings_graph.parse(mappings_file, format="turtle")

    # Process `owl:sameAs` relations in the mappings file
    for source, _, target in mappings_graph.triples((None, OWL.sameAs, None)):
        # Check the type of the entities to decide the appropriate equivalence relation
        if (source, RDF.type, OWL.Class) in merged_graph and (target, RDF.type, OWL.Class) in merged_graph:
            # Add `owl:equivalentClass` for class entities
            merged_graph.add((source, OWL.equivalentClass, target))
        elif (source, RDF.type, OWL.ObjectProperty) in merged_graph and (target, RDF.type, OWL.ObjectProperty) in merged_graph:
            # Add `owl:equivalentProperty` for object properties
            merged_graph.add((source, OWL.equivalentProperty, target))
        elif (source, RDF.type, OWL.DatatypeProperty) in merged_graph and (target, RDF.type, OWL.DatatypeProperty) in merged_graph:
            # Add `owl:equivalentProperty` for datatype properties
            merged_graph.add((source, OWL.equivalentProperty, target))
        else:
            # Default to `owl:equivalentClass` if type information is not available
            merged_graph.add((source, OWL.equivalentClass, target))

    # Serialize the merged graph to the specified output file
    merged_graph.serialize(destination=output_file, format="turtle")  # Use Turtle format for better readability

if __name__ == "__main__":
    # Input file paths
    ontology1_file = "rodi/data/cmt_renamed/ontology.ttl"  # Turtle format
    ontology2_file = "rodi/ontop/cmt_renamed/ontology.rdf"  # RDF/XML format

    # Specify file formats
    ontology1_format = "turtle"  # Turtle format
    ontology2_format = "xml"     # RDF/XML format

    # Output file paths
    mappings_file = "rodi/ontop/cmt_renamed/textsim_mappings.ttl"
    merged_ontology_file = "rodi/ontop/cmt_renamed/merged_ontology.ttl"

    # Load ontologies
    ontology1 = load_ontology(ontology1_file, file_format=ontology1_format)
    ontology2 = load_ontology(ontology2_file, file_format=ontology2_format)

    # Extract labels
    entities1 = extract_labels(ontology1)
    entities2 = extract_labels(ontology2)

    # Compute mappings
    mappings = compute_similarity(entities1, entities2, threshold=0.5)

    # Save mappings
    save_mappings(mappings, mappings_file)

    # Merge ontologies
    merge_ontologies(ontology1_file, ontology2_file, mappings_file, merged_ontology_file,
                     ontology1_format="turtle", ontology2_format="xml")

    print(f"Mappings saved to {mappings_file}")
    print(f"Merged ontology saved to {merged_ontology_file}")
