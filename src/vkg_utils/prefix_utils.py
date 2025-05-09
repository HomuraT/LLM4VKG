import multiprocessing
from rdflib import Graph, RDF, RDFS, OWL, Namespace

from src.vkg_utils.ontology_mapping_utils import Prefix


class PrefixOntologyParser:
    def __init__(self, prefix_object):
        """Initialize with a Prefix object."""
        self.graph = Graph()
        self.prefix_object = prefix_object  # Prefix object passed during initialization
        self.classes = set()
        self.object_properties = set()
        self.data_properties = set()

    def to_dict(self):
        """Convert the ontology to a dictionary."""
        if len(self.classes) == 0 and len(self.object_properties) == 0 and len(self.data_properties) == 0:
            return None
        return {
            "classes": self.classes,
            "object_properties": self.object_properties,
            "data_properties": self.data_properties
        }

    def load_ontology(self, timeout=10):
        self.graph.parse(self.prefix_object.prefixUrl)

    def get_prefix(self, uri):
        """Retrieve the prefix and name based on the provided Prefix object."""
        if uri.startswith(self.prefix_object.prefixUrl):
            name = uri.replace(self.prefix_object.prefixUrl, '')
            return name
        return uri  # Return None as prefix and full URI as name if no match is found

    def extract_classes(self):
        """Extract all classes in the ontology."""
        self.classes = {
                           self.get_prefix(str(cls))
                           for cls in self.graph.subjects(predicate=RDF.type, object=RDFS.Class)
                       } | {
                           self.get_prefix(str(cls))
                           for cls in self.graph.subjects(predicate=RDF.type, object=OWL.Class)
                       }

    def extract_object_properties(self):
        """Extract all object properties in the ontology."""
        self.object_properties = {
            self.get_prefix(str(prop))
            for prop in self.graph.subjects(predicate=RDF.type, object=OWL.ObjectProperty)
        }
        # Include rdf:Property with range or domain indicating an object property
        self.object_properties |= {
            self.get_prefix(str(prop))
            for prop in self.graph.subjects(predicate=RDF.type, object=RDF.Property)
            if (
                    self.graph.value(prop, RDFS.range) == OWL.Class or
                    self.graph.value(prop, RDFS.domain) == OWL.Class or
                    self.graph.value(prop, RDFS.range) == RDFS.Resource or
                    self.graph.value(prop, RDFS.domain) == RDFS.Resource
            )
        }

    def extract_data_properties(self):
        """Extract all data properties in the ontology."""
        self.data_properties = {
            self.get_prefix(str(prop))
            for prop in self.graph.subjects(predicate=RDF.type, object=OWL.DatatypeProperty)
        }
        # Include rdf:Property with range or domain indicating a data property
        self.data_properties |= {
            self.get_prefix(str(prop))
            for prop in self.graph.subjects(predicate=RDF.type, object=RDF.Property)
            if (
                    self.graph.value(prop, RDFS.range) == RDFS.Datatype or
                    self.graph.value(prop, RDFS.domain) == RDFS.Datatype
            )
        }

    def parse_all(self):
        """Parse and extract all elements: classes, object properties, and data properties."""
        self.extract_classes()
        self.extract_object_properties()
        self.extract_data_properties()

    def display_summary(self):
        """Display the summary of classes, object properties, and data properties."""
        print("\nPrefix:")
        print(f"{self.prefix_object}")
        prefix = self.prefix_object.prefixName

        print("\nClasses:")
        for name in sorted(self.classes):
            print(f"  - {prefix}:{name}" if prefix else f"  - {name}")

        print("\nObject Properties:")
        for name in sorted(self.object_properties):
            print(f"  - {prefix}:{name}" if prefix else f"  - {name}")

        print("\nData Properties:")
        for name in sorted(self.data_properties):
            print(f"  - {prefix}:{name}" if prefix else f"  - {name}")

    @staticmethod
    def from_prefix(prefix_object):
        """Attempt to create a PrefixOntologyParser object from a URL. Return the object if successful, otherwise None."""
        try:
            parser = PrefixOntologyParser(prefix_object)
            parser.load_ontology()  # Try to load the ontology
            parser.parse_all()
            return parser
        except Exception as e:
            print(f"Failed to load ontology from {prefix_object.prefixUrl}: {e}")
            return None


# 示例使用
if __name__ == "__main__":
    prefix_instance = Prefix(
        **{"prefix": "rdf", "url": "http://xmlns.com/foaf/0.1/", "description": "Example namespace"})
    parser = PrefixOntologyParser.from_prefix(prefix_instance)
    if parser:
        parser.display_summary()
    else:
        print("Could not load ontology.")
