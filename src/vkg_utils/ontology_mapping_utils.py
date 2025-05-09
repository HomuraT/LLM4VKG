import json
from abc import abstractmethod
from typing import List, Literal
import pickle

class FileTransformer:
    def to_ttl(self):
        pass

    def to_obda(self):
        pass


class Prefix(FileTransformer):
    def __init__(self, prefix, url, description=""):
        self.prefixName = prefix
        self.prefixUrl = url
        self.description = description

    def get_inst_prefix(self):
        return f"{self.prefixName}-inst"

    def to_ttl(self):
        msg = ''
        if self.description:
            msg += f"#desc: {self.description}\n"
        msg += f"@prefix {self.prefixName}: <{self.prefixUrl}> ."

        return msg

    def __eq__(self, other):
        if isinstance(other, Prefix):
            return self.prefixName == other.prefixName and self.prefixUrl == other.prefixUrl
        else:
            return False

    def __hash__(self):
        return hash((self.prefixName, self.prefixUrl))

    def to_obda(self):
        return f"{self.prefixName}:\t{self.prefixUrl}"

    def __str__(self):
        return f"{self.prefixName}: <{self.prefixUrl}>"


class PrefixManager(FileTransformer):
    def __init__(self, prefixes: dict):
        self.prefixes = prefixes

    def get(self, prefixName):
        return self.prefixes[prefixName]

    def add(self, prefix: Prefix):
        self.prefixes[prefix.prefixName] = prefix

    def to_ttl(self):
        ttl = ''
        for k, v in self.prefixes.items():
            ttl += v.to_ttl() + "\n"

        return ttl

    def to_obda(self):
        obda = ''
        for k, v in self.prefixes.items():
            obda += v.to_obda() + "\n"

        return obda

    def refresh(self):
        new_prefixes = {}
        for k, v in self.prefixes.items():
            new_prefixes[v.prefixName] = v

        self.prefixes = new_prefixes

class PrefixAndName(FileTransformer):
    def __init__(self, prefix: Prefix, name):
        self.prefix = prefix
        self.name = name

    def get_type(self, *args, **kwargs):
        return f"{self.prefix.prefixName}:{self.name}"

    def to_dict(self):
        return {"prefix": self.prefix, "name": self.name}

    def __eq__(self, other):
        if isinstance(other, PrefixAndName):
            return self.prefix == other.prefix and self.name == other.name
        else:
            return False

    def __hash__(self):
        return hash((self.prefix, self.name))

    def __str__(self):
        return f"{self.prefix.prefixName}:{self.name}"

    def reset(self, prefix: Prefix=None, name=None, o:"PrefixAndName"=None):
        if o:
            self.__dict__ = o.__dict__
        else:
            if prefix:
                self.prefix = prefix
            if name:
                self.name = name

    def to_obda(self, is_inst=False):
        if is_inst:
            return f"{self.prefix.get_inst_prefix()}:{self.name}"
        else:
            return f"{self.prefix.prefixName}:{self.name}"

class OntologyRelationship:
    def __init__(self, isSubOf=None, isEquivalent=None, isDisjoint=None):
        if isSubOf is None:
            isSubOf = []

        if isEquivalent is None:
            isEquivalent = []

        if isDisjoint is None:
            isDisjoint = []

        self.isEquivalent = isEquivalent
        self.isDisjoint = isDisjoint
        self.isSubOf = isSubOf

    def add_superclass(self, superclass: PrefixAndName):
        self.isSubOf.append(superclass)

    def add_equivalent(self, equivalent: PrefixAndName):
        self.isEquivalent.append(equivalent)

    def add_disjoint(self, disjoint: PrefixAndName):
        self.isDisjoint.append(disjoint)

class ClassDeclaration(PrefixAndName, FileTransformer, OntologyRelationship):
    def __init__(self, prefix: Prefix, name, description="", isSubOf=None, **kwargs):
        PrefixAndName.__init__(self, prefix, name)
        OntologyRelationship.__init__(self, isSubOf)

        self.description = description

    def to_ttl(self):
        msg = ''

        msg += f"{self.prefix.prefixName}:{self.name} rdf:type owl:Class"
        if self.description:  #desc: {self.description}
            msg += f" ;\n\trdfs:comment \"{self.description}\""

        msg += " ."
        if self.isSubOf:
            for superclass in self.isSubOf:
                msg += f"\n{self.prefix.prefixName}:{self.name} rdfs:subClassOf {superclass.get_type()} .\n"

        if self.isEquivalent:
            for equivalent in self.isEquivalent:
                msg += f"\n{self.prefix.prefixName}:{self.name} owl:equivalentClass {equivalent.get_type()} .\n"

        if self.isDisjoint:
            for disjoint in self.isDisjoint:
                msg += f"\n{self.prefix.prefixName}:{self.name} owl:disjointWith {disjoint.get_type()} .\n"

        return msg


class ObjectPropertyDeclaration(PrefixAndName, FileTransformer, OntologyRelationship):
    def __init__(self, prefix: Prefix, name, domain: PrefixAndName, range: PrefixAndName, description="", isSubOf=None, **kwargs):
        PrefixAndName.__init__(self, prefix, name)
        OntologyRelationship.__init__(self, isSubOf)
        self.description = description
        self.domain = domain
        self.range = range

    def to_ttl(self):
        msg = ''

        msg += f"{self.prefix.prefixName}:{self.name} rdf:type owl:ObjectProperty"
        if self.description:  #desc: {self.description}
            msg += f" ;\n\trdfs:comment \"{self.description}\""
        if self.domain:
            msg += f" ;\n\trdfs:domain {self.domain.get_type()}"
        if self.range:
            msg += f" ;\n\trdfs:range {self.range.get_type()}"
        msg += " ."
        if self.isSubOf:
            for superclass in self.isSubOf:
                msg += f"\n{self.prefix.prefixName}:{self.name} rdfs:subPropertyOf {superclass.get_type()} .\n"

        if self.isEquivalent:
            for equivalent in self.isEquivalent:
                msg += f"\n{self.prefix.prefixName}:{self.name} owl:equivalentProperty {equivalent.get_type()} .\n"

        if self.isDisjoint:
            for disjoint in self.isDisjoint:
                msg += f"\n{self.prefix.prefixName}:{self.name} owl:disjointWith {disjoint.get_type()} .\n"
        return msg

    def __str__(self):
        return self.to_ttl()


class DataPropertyDeclaration(PrefixAndName, FileTransformer, OntologyRelationship):
    def __init__(self, prefix: Prefix, name, description="", domain:PrefixAndName=None, range:PrefixAndName=None, isSubOf=None, **kwargs):
        PrefixAndName.__init__(self, prefix, name)
        OntologyRelationship.__init__(self, isSubOf)
        self.description = description
        self.domain = domain
        self.range = range

    def to_ttl(self):
        msg = ''
        msg += f"{self.prefix.prefixName}:{self.name} rdf:type owl:DatatypeProperty "

        if not hasattr(self, 'domain'):
            self.domain = None
        if not hasattr(self, 'range'):
            self.range = None

        if self.domain:
            msg += f";\n\trdfs:domain {self.domain.get_type()} "
        if self.range:
            msg += f";\n\trdfs:range {self.range.get_type()} "
        if self.description:
            msg += f" ;\n\trdfs:comment \"{self.description}\""
        msg += ".\n"
        if self.isSubOf:
            for superclass in self.isSubOf:
                msg += f"\n{self.prefix.prefixName}:{self.name} rdfs:subPropertyOf {superclass.get_type()} .\n"

        if self.isEquivalent:
            for equivalent in self.isEquivalent:
                msg += f"\n{self.prefix.prefixName}:{self.name} owl:equivalentProperty {equivalent.get_type()} .\n"

        if self.isDisjoint:
            for disjoint in self.isDisjoint:
                msg += f"\n{self.prefix.prefixName}:{self.name} owl:disjointWith {disjoint.get_type()} .\n"
        return msg

    def __str__(self):
        return self.to_ttl()


class PrefixAndNameManager(FileTransformer):
    def __init__(self, PaNs: dict):
        self.PaNs = PaNs

    def add(self, PaN: PrefixAndName):
        self.PaNs[PaN.get_type()] = PaN

    def get(self, name):
        return self.PaNs[name]

    def set(self, name, value):
        self.PaNs[name] = value

    def to_ttl(self):
        ttls = []
        for k, v in self.PaNs.items():
            v = v.to_ttl()
            if v not in ttls:
                ttls.append(v)
        ttl = "\n".join(ttls) + '\n'
        return ttl

    def refresh(self):
        new_PaNs = {}
        for k, v in self.PaNs.items():
            new_PaNs[v.get_type()] = v
        self.PaNs = new_PaNs
class TableMapping(FileTransformer):
    def __init__(self, table_name, table: dict, table_prefix_and_name:PrefixAndName, class_declarations: PrefixAndNameManager, object_property_declarations: PrefixAndNameManager, data_property_declarations: PrefixAndNameManager):
        pass
        self.name = table_name
        self.table = table
        self.table_prefix_and_name = table_prefix_and_name

        self.class_declarations = class_declarations
        self.object_property_declarations = object_property_declarations
        self.data_property_declarations = data_property_declarations
        self.column_mapping = {}


        self.load_mapping()

    def load_mapping(self):
        for col_name, col_property in self.table.items():
            if col_property['isID']:
                if col_property['isPrimaryKey']:
                    declarations = self.class_declarations
                else:
                    declarations = self.object_property_declarations
            else:
                declarations = self.data_property_declarations

            pan = col_property['SelectedPrefix'] + ':' + col_property['PropertyName']
            m = {
                'isID': col_property['isID'],
                'isPrimaryKey': col_property['isPrimaryKey'],
                'mapping_property': declarations.get(pan)
            }

            if col_property['isID'] and not col_property['isPrimaryKey']:
                pan_o = col_property['TargetPrefix'] + ':' + col_property['TargetClassName']
                m['mapping_to'] = self.class_declarations.get(pan_o)


            self.column_mapping[col_name] = m

    def to_obda(self):
        primary_key = None
        primary_key_name = ''
        for col_name, col_property in self.column_mapping.items():
            if col_property['isPrimaryKey']:
                primary_key = col_property
                primary_key_name = col_name
                break

        mappings = [primary_key["mapping_property"].to_obda(is_inst=True) + "/{" + primary_key_name + "} a " + self.table_prefix_and_name.to_obda()]
        for col_name, col_property in self.column_mapping.items():
            if col_property['isPrimaryKey']:
                continue

            col_var = "{" + col_name + "}"
            if col_property['isID']:
                mappings.append(col_property["mapping_property"].to_obda()  + ' '+ col_property["mapping_to"].to_obda(is_inst=True) + '/' + col_var)
            else:
                mappings.append(col_property["mapping_property"].to_obda() + ' ' + col_var)

        source = 'select '
        source += ', '.join(self.table.keys())
        source += ' from ' + self.name

        return {
            "mappingId": self.name,
            "target": " ; ".join(mappings) + " .",
            "source": source
        }

class JunctionTableMapping(TableMapping):
    def load_mapping(self):
        subject_name = self.table['subject']['SelectedPrefix'] + ':' + self.table['subject']['ClassName']
        object_name = self.table['object']['SelectedPrefix'] + ':' + self.table['object']['ClassName']
        property_name = self.table['relation_prefix'] + ':' + self.table['relation_name']

        subject = self.class_declarations.get(subject_name)
        object = self.class_declarations.get(object_name)
        property = self.object_property_declarations.get(property_name)
        self.column_mapping = {
            "subject": {"mapping": subject, "col_name": self.table['subject']['ColName']},
            "object": {"mapping": object, "col_name": self.table['object']['ColName']},
            "property": property
        }

    def to_obda(self):

        target = self.column_mapping["subject"]["mapping"].to_obda(is_inst=True) + "/{" + self.column_mapping["subject"]["col_name"] + "} "
        target += self.column_mapping["property"].to_obda() + ' '
        target += self.column_mapping["object"]["mapping"].to_obda(is_inst=True) + "/{" + self.column_mapping["object"]["col_name"] + "}"

        source = 'select ' + self.column_mapping["subject"]["col_name"] + ', ' + self.column_mapping["object"]["col_name"] + ' from ' + self.name

        return {
            "mappingId": self.name,
            "target": target + " .",
            "source": source
        }

class TableManager(FileTransformer):
    def __init__(self, tables: dict):
        self.tables = tables

    def get(self, table_name):
        return self.tables.get(table_name)

    def to_obda(self):
        obda = ''
        saved_ids = []
        for table_name, table in self.tables.items():
            tmapping = table.to_obda()
            mappingId = tmapping['mappingId']
            target = tmapping['target']
            source = tmapping['source']

            i = 0
            while mappingId + str(i) in saved_ids:
                i += 1
            mappingId = mappingId + str(i)
            saved_ids.append(mappingId)

            obda += "mappingId\tmapping-" + mappingId + "\n"
            obda += "target\t" + target + "\n"
            obda += "source\t" + source + "\n\n"
        return obda


class OntologyAndMapping(FileTransformer):
    def __init__(self, path=None, obj=None):
        self.path = path
        if path is not None:
            with open(self.path, "r") as f:
                self.ontology_and_mapping = json.load(f)
        elif obj is not None:
            self.ontology_and_mapping = obj
        else:
            raise Exception("Either path or obj must be provided")

        self.prefixes = PrefixManager({})
        self.class_declarations = PrefixAndNameManager({})
        self.object_property_declarations = PrefixAndNameManager({})
        self.data_property_declarations = PrefixAndNameManager({})
        self.tables = TableManager({})
        self._load_ontology_and_mapping()

    def _load_ontology_and_mapping(self):
        prefiexes = self.prefixes.prefixes
        for prefix in self.ontology_and_mapping['Prefixes']:
            prefiexes[prefix[0]] = Prefix(*prefix)

        self.prefixes = PrefixManager(prefiexes)

        classes = self.class_declarations.PaNs
        for _, class_declaration in self.ontology_and_mapping['ClassDeclarations'].items():
            cd = ClassDeclaration(self.prefixes.get(class_declaration['SelectedPrefix']),
                                  class_declaration['ClassName'])
            classes[cd.get_type()] = cd
        self.class_declarations = PrefixAndNameManager(classes)

        object_properties = self.object_property_declarations.PaNs
        for domain_class_name, object_property_declarations in self.ontology_and_mapping['ObjectDeclarations'].items():
            domain_obj = self.class_declarations.get(domain_class_name)
            for object_property_name, range_class_name in object_property_declarations.items():
                prefix_name, name = object_property_name.split(":")
                range_obj = self.class_declarations.get(range_class_name['range_name'])
                obj_property = ObjectPropertyDeclaration(self.prefixes.get(prefix_name), name, domain_obj, range_obj)
                object_properties[obj_property.get_type()] = obj_property
        self.object_property_declarations = PrefixAndNameManager(object_properties)

        data_properties = self.data_property_declarations.PaNs
        for table_name, data_property_declarations in self.ontology_and_mapping['PropertyDeclarations'].items():
            table_inf = self.ontology_and_mapping['ClassDeclarations'][table_name]
            class_type = f'{table_inf["SelectedPrefix"]}:{table_inf["ClassName"]}'
            domain = self.class_declarations.get(class_type)
            for _, data_property in data_property_declarations.items():
                if data_property['isID']:
                    continue

                prefix = self.prefixes.get(data_property['SelectedPrefix'])
                name = data_property['PropertyName']
                description = ""
                if 'PropertyDescription' in data_property:
                    description = data_property['PropertyDescription']

                data_property_declaration = DataPropertyDeclaration(prefix, name, description, domain=domain)
                data_properties[data_property_declaration.get_type()] = data_property_declaration

        self.data_property_declarations = PrefixAndNameManager(data_properties)

        tables = self.tables.tables
        for table_name, table in self.ontology_and_mapping['PropertyDeclarations'].items():
            table_prefix_and_name = self.ontology_and_mapping['ClassDeclarations'][table_name]
            table_prefix_and_name = table_prefix_and_name['SelectedPrefix'] + ":" + table_prefix_and_name['ClassName']
            table_prefix_and_name = self.class_declarations.get(table_prefix_and_name)
            tables[table_name] = TableMapping(
                table_name,
                table,
                table_prefix_and_name,
                self.class_declarations,
                self.object_property_declarations,
                self.data_property_declarations
            )

        for jtable_name, jtable in self.ontology_and_mapping['junction_tables'].items():
            tables[jtable_name] = JunctionTableMapping(
                jtable_name,
                jtable,
                None,
                self.class_declarations,
                self.object_property_declarations,
                self.data_property_declarations
            )

        self.tables = TableManager(tables)


    def to_ttl(self):
        ttl = ''
        ttl += "########################################################\n"
        ttl += "# Prefixes\n"
        ttl += "########################################################\n\n"
        ttl += self.prefixes.to_ttl()
        ttl += "\n"
        ttl += "########################################################\n"
        ttl += "# Class Declarations\n"
        ttl += "########################################################\n\n"
        ttl += self.class_declarations.to_ttl()
        ttl += "########################################################\n"
        ttl += "# Object Property Declarations\n"
        ttl += "########################################################\n\n"
        ttl += self.object_property_declarations.to_ttl()
        ttl += "########################################################\n"
        ttl += "# Data Property Declarations\n"
        ttl += "########################################################\n\n"
        ttl += self.data_property_declarations.to_ttl()

        return ttl

    def to_obda(self):
        obda = '[PrefixDeclaration]\n'
        obda += self.prefixes.to_obda()
        obda += '\n[MappingDeclaration] @collection [[\n'
        obda += self.tables.to_obda()
        obda += ']]\n'
        return obda

    def merge_declarations(self, merge_type: Literal["class", "object", "data"] ,merged_declarations: List[PrefixAndName], merge_to: PrefixAndName):
        if merge_type == "class":
            declarations = self.class_declarations
        elif merge_type == "object":
            declarations = self.object_property_declarations
        elif merge_type == "data":
            declarations = self.data_property_declarations
        else:
            raise ValueError("Invalid merge type")

        if not merged_declarations:
            return

        if isinstance(merged_declarations[0], str):
            md = []
            for m in merged_declarations:
                md.append(declarations.get(m))
            merged_declarations = md

        if isinstance(merge_to, str):
            merge_to = declarations.get(merge_to)

        for declaration in merged_declarations:
            declaration.reset(o=merge_to)

    def refresh(self):
        self.prefixes.refresh()
        self.class_declarations.refresh()
        self.object_property_declarations.refresh()
        self.data_property_declarations.refresh()

    def save_to(self, path):
        with open(path, 'wb') as f:
            pickle.dump(self, f)

    def save_ontology_to(self, path):
        with open(path, 'w') as f:
            f.write(self.to_ttl())

    def save_obda_to(self, path):
        with open(path, 'w') as f:
            f.write(self.to_obda())

    @staticmethod
    def load_from(path)-> 'OntologyAndMapping':
        with open(path, 'rb') as f:
            old =  pickle.load(f)

        new = OntologyAndMapping(obj=old.ontology_and_mapping)
        return new


if __name__ == "__main__":
    oam = OntologyAndMapping(path="../../outputs/bsbm_v2/ontology.json")

    oam.save_ontology_to("../../outputs/bsbm_v3/ontology_2.ttl")
    oam.save_obda_to("../../outputs/bsbm_v3/ontology_2.obda")
    oam.refresh()
    pass
