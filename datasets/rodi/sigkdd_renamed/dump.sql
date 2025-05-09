

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP SCHEMA IF EXISTS sigkdd_renamed CASCADE;
CREATE SCHEMA sigkdd_renamed;
SET search_path = sigkdd_renamed, pg_catalog;


SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE abstracts (
    id integer NOT NULL,
    title character varying(101)
);


CREATE TABLE acm_sigkdds (
    id integer NOT NULL
);


CREATE TABLE author_deadline_author_notificat (
    aid integer NOT NULL,
    did integer NOT NULL
);


CREATE TABLE author_paper_students (
    id integer NOT NULL
);


CREATE TABLE author_papers (
    id integer NOT NULL
);


CREATE TABLE authors (
    id integer NOT NULL
);


CREATE TABLE award_author (
    author integer NOT NULL,
    award integer NOT NULL
);


CREATE TABLE awards (
    id integer NOT NULL
);


CREATE TABLE best_applications_paper_as (
    id integer NOT NULL
);


CREATE TABLE best_paper_awards_committs (
    id integer NOT NULL,
    award integer
);


CREATE TABLE best_research_paper_awards (
    id integer NOT NULL
);


CREATE TABLE best_student_paper_awards (
    id integer NOT NULL
);


CREATE TABLE best_student_paper_suppors (
    id integer NOT NULL
);


CREATE TABLE bronze_supporters (
    id integer NOT NULL
);


CREATE TABLE committees (
    id integer NOT NULL,
    ref integer,
    committee integer
);


CREATE TABLE conference_halls (
    id integer NOT NULL
);


CREATE TABLE conferences (
    id integer NOT NULL,
    holded integer,
    start_conference date,
    city_conference character varying(16),
    name_conference character varying(6),
    end_conference date
);


CREATE TABLE deadline_abstract_submiss (
    id integer NOT NULL
);


CREATE TABLE deadline_author_notificats (
    id integer NOT NULL
);


CREATE TABLE deadline_document (
    document integer NOT NULL,
    deadline integer NOT NULL
);


CREATE TABLE deadline_paper_submissions (
    id integer NOT NULL
);


CREATE TABLE deadlines (
    id integer NOT NULL,
    designed integer,
    date date
);


CREATE TABLE documents (
    id integer NOT NULL
);


CREATE TABLE e_mails (
    person integer NOT NULL,
    value character varying(43) NOT NULL
);


CREATE TABLE exhibitors (
    id integer NOT NULL
);


CREATE TABLE fees (
    id integer NOT NULL,
    currency character varying(199),
    price integer
);


CREATE TABLE general_chairs (
    id integer NOT NULL
);


CREATE TABLE gold_supporters (
    id integer NOT NULL
);


CREATE TABLE hotels (
    id integer NOT NULL
);


CREATE TABLE invited_speakers (
    id integer NOT NULL
);


CREATE TABLE listeners (
    id integer NOT NULL
);


CREATE TABLE main_offices (
    id integer NOT NULL
);


CREATE TABLE organizators (
    id integer NOT NULL
);


CREATE TABLE organizing_committee_membs (
    id integer NOT NULL
);


CREATE TABLE organizing_committees (
    id integer NOT NULL
);


CREATE TABLE paper_author (
    aid integer NOT NULL,
    pid integer NOT NULL
);


CREATE TABLE papers (
    id integer NOT NULL,
    title character varying(101)
);


CREATE TABLE persons (
    id integer NOT NULL,
    nation character varying(199),
    name character varying(24)
);


CREATE TABLE place_person (
    person integer NOT NULL,
    place integer NOT NULL
);


CREATE TABLE places (
    id integer NOT NULL,
    lat integer,
    long integer,
    street character varying(199),
    postal_code integer
);


CREATE TABLE platinum_supporters (
    id integer NOT NULL
);


CREATE TABLE program_chairs (
    id integer NOT NULL
);


CREATE TABLE program_committee_members (
    id integer NOT NULL
);


CREATE TABLE program_committees (
    id integer NOT NULL,
    label character varying(29)
);


CREATE TABLE registration_fee_person (
    pid integer NOT NULL,
    rid integer NOT NULL
);


CREATE TABLE registration_fees (
    id integer NOT NULL
);


CREATE TABLE registration_non_members (
    id integer NOT NULL
);


CREATE TABLE registration_sigkdd_members (
    id integer NOT NULL
);


CREATE TABLE registration_sigmod_members (
    id integer NOT NULL
);


CREATE TABLE registration_students (
    id integer NOT NULL
);


CREATE TABLE reviews (
    id integer NOT NULL,
    ref integer,
    review integer,
    internal_id integer,
    text character varying(191)
);


CREATE TABLE silver_supporters (
    id integer NOT NULL
);


CREATE TABLE speaker_document (
    sid integer NOT NULL,
    did integer NOT NULL
);


CREATE TABLE speakers (
    id integer NOT NULL
);


CREATE TABLE sponzor_acm_sigkdd (
    aid integer NOT NULL,
    sid integer NOT NULL
);


CREATE TABLE sponzor_fees (
    id integer NOT NULL
);


CREATE TABLE sponzors (
    id integer NOT NULL,
    name_sponsor character varying(199)
);


CREATE TABLE webmasters (
    id integer NOT NULL
);


COPY abstracts (id, title) FROM stdin;
1775	admiralties bewigged playgoers cheques batting waspishly stilbestrol
1779	forbearer anesthetization undermentioned outflanking
1784	loftily yabber reprovingly blungers dwarflike
1792	mohairs admiralties bewigged playgoers
1795	sandwiching bewitchment cheaters riffled kerneling
1800	anesthetization undermentioned outflanking funnyman commuted lachrymation
1806	grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly
1808	slipcases phenylketonuria grunts venturers
1811	recelebrating dually plateauing reoccupations embossers
1814	objurgate treaties preprocessor despising loftily
1820	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian
1822	loathly cancels debiting parrots paraguayans resonates
1824	recalculation safest signiory latchets inflecting trephines hops
1827	earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils
1833	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned
1837	acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst
1844	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers
1847	apnea maxillary dumpers bering evasiveness toto
1850	polers oinked apnea maxillary dumpers bering
1855	firefanged skeins equalled sandwiching
1856	desexes summable heliocentricity excretions recelebrating dually plateauing
1860	grunts venturers valiantly unremorsefully extradites
1863	tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest
1866	oralogy tibetans slavishly hipless prs bluejays
1869	goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated
1873	floweret arcadian acridities unrealistic substituting surges
1874	teratoid coadjutors thuggeries nondestructive
1880	dwelling scrapped prat islanded burlily
1881	funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges
1886	lenity tautological jambing sodality
1890	prat islanded burlily thanklessly swiveled polers oinked
1892	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
1895	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity
1897	undamped sharpers forbearer anesthetization
1901	acridities unrealistic substituting surges preheats loggias
1905	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
1909	objurgate treaties preprocessor despising loftily yabber reprovingly
1910	toto teashop reaccepts gunneries exorcises pirog
1914	latchets inflecting trephines hops exec junketeers isolators reducing
1915	kerneling napoleons rifer splinting surmisers satisfying undamped
1919	rhythmical wastebaskets powderer immigrates inserter
1922	conditione loathly cancels debiting parrots paraguayans resonates overbites
1928	decentralizing hogfishes gantleted richer succories dwelling
1931	nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular
1933	exorcises pirog desexes summable
1937	sandwiching bewitchment cheaters riffled kerneling
1940	pirog desexes summable heliocentricity
1942	excretions recelebrating dually plateauing
1944	loggias reconciliating photocatalyst lenity tautological jambing
1946	burlily thanklessly swiveled polers oinked apnea maxillary
1948	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed
1949	gloves mohairs admiralties bewigged playgoers cheques batting waspishly
1951	immediately canzona interrelated cooked
1952	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts
1956	blungers dwarflike effulgences coreless
1959	reducing nethermost nonfiction retrogressions eliminates
1967	toto teashop reaccepts gunneries exorcises
1970	funnyman commuted lachrymation floweret arcadian acridities unrealistic
1972	reoccupations embossers cerebrum gloves mohairs admiralties
1979	desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers
1982	cheaters riffled kerneling napoleons
1987	photocatalyst lenity tautological jambing sodality
1990	fobbed transcribed swifters redigesting ostinato recalculation
1994	desexes summable heliocentricity excretions recelebrating dually plateauing
2001	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria
2008	heliocentricity excretions recelebrating dually plateauing reoccupations embossers
2011	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins
2015	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer
2017	batting waspishly stilbestrol villainousness miscalling
2020	lachrymation floweret arcadian acridities unrealistic substituting
678	sharpers forbearer anesthetization undermentioned
696	surges preheats loggias reconciliating photocatalyst
700	sodality outcrop slipcases phenylketonuria grunts venturers valiantly
705	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing
706	xix recollected householder overeducated objurgate treaties preprocessor despising loftily
718	maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises
727	rifer splinting surmisers satisfying undamped sharpers forbearer
732	grunts venturers valiantly unremorsefully
733	cancels debiting parrots paraguayans resonates overbites terminals giros
741	brill neologic intermuscular fobbed transcribed
747	malines cliffhanger entailments reindexed bedstraws thoughtless
763	neurosurgeon innervated hunts barrens emanative blowpipe varies
764	rifer splinting surmisers satisfying undamped
780	floweret arcadian acridities unrealistic substituting surges
789	sodality outcrop slipcases phenylketonuria grunts venturers valiantly
801	playgoers cheques batting waspishly stilbestrol villainousness
808	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins
813	exorcises pirog desexes summable heliocentricity
822	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly
826	mohairs admiralties bewigged playgoers cheques batting
827	effulgences coreless tuberculoses environs
837	peeped daydreams permuting immediately canzona interrelated cooked
842	nonfiction retrogressions eliminates unknowns mongoloids
844	anesthetization undermentioned outflanking funnyman
852	manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds
855	giros podgy vagus kinkiest xix
862	richer succories dwelling scrapped prat islanded burlily thanklessly swiveled
875	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases
883	recelebrating dually plateauing reoccupations embossers cerebrum gloves
890	evasiveness toto teashop reaccepts gunneries exorcises
892	rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization
899	plateauing reoccupations embossers cerebrum gloves mohairs admiralties
907	vagus kinkiest xix recollected householder
912	maxillary dumpers bering evasiveness
915	swifters redigesting ostinato recalculation safest signiory
916	skeins equalled sandwiching bewitchment cheaters
924	bounden occulters blubberer amenities desecrated tetrachlorides loutish
925	venturers valiantly unremorsefully extradites stollens ponderers
929	unmuzzling measles decentralizing hogfishes
930	tibetans slavishly hipless prs bluejays cuppier nonsurgical
962	miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling
966	gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating
968	unrealistic substituting surges preheats
975	dwelling scrapped prat islanded burlily
984	plateauing reoccupations embossers cerebrum gloves mohairs
988	nigglings midmonths labium peeped daydreams permuting immediately canzona
990	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned
992	treaties preprocessor despising loftily yabber reprovingly blungers dwarflike
1000	inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction
1007	admiralties bewigged playgoers cheques
1016	zanier corkscrewed promiscuousness clewed
1021	forbearer anesthetization undermentioned outflanking funnyman
1024	dually plateauing reoccupations embossers
1034	stilbestrol villainousness miscalling firefanged skeins
1037	reaccepts gunneries exorcises pirog desexes summable heliocentricity
1050	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons
1058	surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality
1065	dissociated heartier petitionee brill
1066	swiveled polers oinked apnea maxillary
1067	paraguayans resonates overbites terminals giros
1071	bering evasiveness toto teashop reaccepts
1082	arcadian acridities unrealistic substituting surges preheats
1088	environs hulled preexamination oralogy tibetans slavishly hipless
1092	desexes summable heliocentricity excretions recelebrating
1099	bewigged playgoers cheques batting waspishly stilbestrol
1112	cheaters riffled kerneling napoleons rifer splinting surmisers
1127	outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic
1132	undermentioned outflanking funnyman commuted
1140	extradites stollens ponderers conditione loathly
1141	valiantly unremorsefully extradites stollens ponderers conditione
1148	gloves mohairs admiralties bewigged playgoers cheques batting
1149	excretions recelebrating dually plateauing
1154	sandwiching bewitchment cheaters riffled kerneling napoleons rifer
1155	lachrymation floweret arcadian acridities unrealistic
1156	giros podgy vagus kinkiest xix recollected householder overeducated
1164	junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids
1174	firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling
1184	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation
1191	substituting surges preheats loggias
1202	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity
1204	vagus kinkiest xix recollected householder overeducated objurgate treaties
1207	apnea maxillary dumpers bering evasiveness toto teashop reaccepts
1211	riffled kerneling napoleons rifer splinting surmisers
1215	ponderers conditione loathly cancels debiting parrots paraguayans
1216	outpoured dissociated heartier petitionee
1226	desecrated tetrachlorides loutish polygony malines
1237	alkalin succulently marquise underlaid neurosurgeon innervated
1248	lachrymation floweret arcadian acridities unrealistic
1253	jambing sodality outcrop slipcases phenylketonuria grunts
1259	burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering
1261	admiralties bewigged playgoers cheques batting
1269	gunneries exorcises pirog desexes
1272	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases
1275	gloves mohairs admiralties bewigged playgoers
1278	reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination
1280	disjoined nigglings midmonths labium peeped daydreams
1281	isolators reducing nethermost nonfiction
1285	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation
1288	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan
1293	resonates overbites terminals giros
1299	gantleted richer succories dwelling scrapped prat islanded burlily
1306	loggias reconciliating photocatalyst lenity tautological jambing sodality
1309	heliocentricity excretions recelebrating dually plateauing reoccupations
1314	bering evasiveness toto teashop reaccepts
1316	kerneling napoleons rifer splinting surmisers satisfying undamped
1321	dually plateauing reoccupations embossers cerebrum gloves
1325	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers
1328	terminals giros podgy vagus
1333	oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts
1335	intermuscular fobbed transcribed swifters redigesting
1337	villainousness miscalling firefanged skeins
1339	playgoers cheques batting waspishly
1342	technicolor plenishes nippy bounden occulters blubberer
1343	slipcases phenylketonuria grunts venturers valiantly
1349	hulled preexamination oralogy tibetans slavishly hipless
1358	mongoloids danker raunchiness perspicuously disjoined nigglings midmonths
1367	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment
1370	reaccepts gunneries exorcises pirog desexes summable heliocentricity
1375	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst
1379	cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
1380	richer succories dwelling scrapped
1394	recelebrating dually plateauing reoccupations embossers
1398	raunchiness perspicuously disjoined nigglings midmonths labium peeped
1400	rifer splinting surmisers satisfying undamped sharpers
1406	householder overeducated objurgate treaties preprocessor despising loftily
1414	safest signiory latchets inflecting trephines hops exec junketeers
1423	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
1432	machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble
1437	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties
1445	waspishly stilbestrol villainousness miscalling
1453	miscalling firefanged skeins equalled sandwiching bewitchment cheaters
1460	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity
1464	islanded burlily thanklessly swiveled
1465	debiting parrots paraguayans resonates
1471	oinked apnea maxillary dumpers
1474	funnyman commuted lachrymation floweret arcadian
1478	dwarflike effulgences coreless tuberculoses environs hulled
1489	admiralties bewigged playgoers cheques batting
1496	bewitchment cheaters riffled kerneling napoleons rifer
1505	undermentioned outflanking funnyman commuted lachrymation floweret arcadian
1507	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian
1516	valiantly unremorsefully extradites stollens
1518	grunts venturers valiantly unremorsefully extradites
1523	reoccupations embossers cerebrum gloves mohairs admiralties
1524	preprocessor despising loftily yabber reprovingly blungers
1530	miscalling firefanged skeins equalled sandwiching bewitchment
1531	outflanking funnyman commuted lachrymation
1535	paraguayans resonates overbites terminals giros podgy vagus
1540	inflecting trephines hops exec junketeers isolators reducing nethermost
1546	surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical
1548	miscalling firefanged skeins equalled sandwiching bewitchment cheaters
1551	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
1556	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological
1562	phenylketonuria grunts venturers valiantly
1563	bering evasiveness toto teashop reaccepts gunneries exorcises
1565	giros podgy vagus kinkiest xix recollected householder
1569	oinked apnea maxillary dumpers bering evasiveness toto
1571	sandwiching bewitchment cheaters riffled kerneling
1572	summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers
1576	unremorsefully extradites stollens ponderers conditione loathly
1584	bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill
1585	hipless prs bluejays cuppier nonsurgical skimpiest outpoured
1587	bounden occulters blubberer amenities
1593	unrealistic substituting surges preheats loggias reconciliating photocatalyst
1597	maladjustments subpartnership cordilleras recirculations alkalin
1605	scrapped prat islanded burlily thanklessly swiveled
1606	commuted lachrymation floweret arcadian
1607	tautological jambing sodality outcrop slipcases
1608	islanded burlily thanklessly swiveled polers oinked apnea maxillary
1611	gloves mohairs admiralties bewigged
1616	reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating
1622	surges preheats loggias reconciliating photocatalyst lenity tautological
1626	cerebrum gloves mohairs admiralties
1628	despising loftily yabber reprovingly blungers dwarflike effulgences coreless
1630	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates
1631	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned
1635	inserter plights corollaries gaudiness irades inadvisability
1640	debiting parrots paraguayans resonates overbites terminals giros podgy vagus
1647	hogfishes gantleted richer succories dwelling scrapped prat
1656	desexes summable heliocentricity excretions recelebrating
1663	cheaters riffled kerneling napoleons rifer splinting
1666	recelebrating dually plateauing reoccupations embossers
1669	photocatalyst lenity tautological jambing sodality outcrop slipcases
1675	swiveled polers oinked apnea maxillary dumpers bering evasiveness
1677	petitionee brill neologic intermuscular
1680	admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling
1681	cooked reformers goodwife technicolor plenishes
1682	jambing sodality outcrop slipcases
1686	coreless tuberculoses environs hulled preexamination
1692	retrogressions eliminates unknowns mongoloids danker raunchiness
1700	batting waspishly stilbestrol villainousness miscalling firefanged skeins
1704	teashop reaccepts gunneries exorcises pirog desexes
1707	lachrymation floweret arcadian acridities unrealistic substituting surges preheats
1709	embossers cerebrum gloves mohairs admiralties bewigged playgoers
1710	admiralties bewigged playgoers cheques batting waspishly stilbestrol
1716	heliocentricity excretions recelebrating dually
1720	unknowns mongoloids danker raunchiness perspicuously disjoined
1722	kerneling napoleons rifer splinting surmisers
1725	kinkiest xix recollected householder overeducated objurgate
1728	tautological jambing sodality outcrop slipcases phenylketonuria
1731	redigesting ostinato recalculation safest signiory latchets inflecting
1734	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs
1737	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites
1741	emanative blowpipe varies thickest machinability orbiters tormentor owner
1748	excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves
1753	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching
1757	napoleons rifer splinting surmisers
1760	stilbestrol villainousness miscalling firefanged skeins equalled
1765	arcadian acridities unrealistic substituting surges preheats loggias
1768	debiting parrots paraguayans resonates overbites terminals giros podgy
1770	loathly cancels debiting parrots paraguayans resonates overbites terminals giros
1774	midmonths labium peeped daydreams permuting immediately canzona interrelated cooked
6	bedstraws thoughtless elation swampland earings circumscribed paralyzingly
26	splinting surmisers satisfying undamped sharpers forbearer
32	arcadian acridities unrealistic substituting surges preheats loggias
44	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites
53	swiveled polers oinked apnea maxillary
69	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters
77	pirog desexes summable heliocentricity excretions recelebrating
88	outcrop slipcases phenylketonuria grunts
102	environs hulled preexamination oralogy tibetans
114	canzona interrelated cooked reformers goodwife technicolor plenishes nippy
119	funnyman commuted lachrymation floweret arcadian
125	attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments
143	succories dwelling scrapped prat
160	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts
174	plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged
184	toto teashop reaccepts gunneries exorcises pirog desexes
192	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
202	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers
204	recollected householder overeducated objurgate treaties preprocessor
210	bering evasiveness toto teashop reaccepts
222	recalculation safest signiory latchets inflecting trephines hops
223	bewitchment cheaters riffled kerneling napoleons rifer
232	pasturage thurifer teazle fringier
241	extradites stollens ponderers conditione loathly cancels debiting
256	measles decentralizing hogfishes gantleted richer
257	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier
279	grunts venturers valiantly unremorsefully extradites
290	skeins equalled sandwiching bewitchment
303	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing
304	heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves
309	surges preheats loggias reconciliating photocatalyst
327	prat islanded burlily thanklessly swiveled polers
333	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill
345	embossers cerebrum gloves mohairs admiralties bewigged playgoers
353	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife
361	preheats loggias reconciliating photocatalyst lenity tautological jambing sodality
362	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted
368	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs
381	exec junketeers isolators reducing
392	batting waspishly stilbestrol villainousness miscalling
407	evasiveness toto teashop reaccepts
414	undermentioned outflanking funnyman commuted lachrymation floweret
416	plateauing reoccupations embossers cerebrum gloves
439	villainousness miscalling firefanged skeins equalled sandwiching
441	exorcises pirog desexes summable heliocentricity excretions recelebrating dually
465	sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers
481	loggias reconciliating photocatalyst lenity
488	brill neologic intermuscular fobbed transcribed
493	overbites terminals giros podgy vagus kinkiest
500	reaccepts gunneries exorcises pirog desexes summable
520	surges preheats loggias reconciliating photocatalyst lenity tautological
539	summable heliocentricity excretions recelebrating dually plateauing
555	playgoers cheques batting waspishly stilbestrol villainousness miscalling
575	riffled kerneling napoleons rifer splinting surmisers satisfying undamped
598	funnyman commuted lachrymation floweret arcadian
610	ponderers conditione loathly cancels debiting parrots
613	extradites stollens ponderers conditione loathly cancels debiting
624	bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling
626	plateauing reoccupations embossers cerebrum gloves
634	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers
640	xix recollected householder overeducated objurgate treaties preprocessor despising loftily
655	nonfiction retrogressions eliminates unknowns
668	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer
799	thanklessly swiveled polers oinked
2022	loathly cancels debiting parrots paraguayans resonates overbites
2023	ponderers conditione loathly cancels debiting parrots paraguayans resonates
2026	perspicuously disjoined nigglings midmonths labium peeped daydreams permuting
2028	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching
2030	cerebrum gloves mohairs admiralties bewigged playgoers
2033	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
2035	objurgate treaties preprocessor despising
2040	mongoloids danker raunchiness perspicuously disjoined
2041	gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol
2042	equalled sandwiching bewitchment cheaters
2046	forbearer anesthetization undermentioned outflanking funnyman
2050	preheats loggias reconciliating photocatalyst lenity tautological
2051	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens
2052	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites
2054	summable heliocentricity excretions recelebrating
2055	householder overeducated objurgate treaties
2057	dumpers bering evasiveness toto
2059	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
2065	extradites stollens ponderers conditione loathly
2067	paraguayans resonates overbites terminals giros podgy vagus kinkiest xix
2074	transcribed swifters redigesting ostinato recalculation safest
\.



COPY acm_sigkdds (id) FROM stdin;
\.



COPY author_deadline_author_notificat (aid, did) FROM stdin;
\.



COPY author_paper_students (id) FROM stdin;
30
78
82
94
169
185
244
268
278
296
301
322
324
328
334
351
359
390
398
451
456
466
494
496
509
514
521
522
543
548
561
582
587
588
603
617
643
645
650
656
658
675
716
730
751
772
777
816
829
838
840
864
865
870
887
894
908
913
914
940
943
979
995
998
999
1011
1012
1023
1032
1041
1047
1064
1076
1077
1083
1091
1123
1126
1131
1134
1144
1153
1183
1200
1209
1223
1232
1234
1249
1256
1266
1276
1282
1284
1291
1292
1297
1304
1307
1313
1332
1340
1341
1363
1369
1372
1392
1401
1410
1411
1419
1428
1430
1457
1459
1466
1467
1469
1480
1484
1486
1493
1499
1513
1517
1525
1527
1529
1552
1566
1579
1583
1596
1604
1609
1612
1620
1621
1636
1638
1642
1648
1653
1659
1661
1665
1667
1676
1679
1703
1706
1713
1723
1730
1739
1742
1752
1758
1759
1767
1772
1788
1793
1797
1807
1809
1812
1815
1817
1819
1830
1832
1839
1841
1846
1848
1853
1854
1862
1864
1871
1875
1885
1888
1889
1902
1903
1908
1913
1918
1920
1921
1924
1926
1929
1930
1932
1936
1943
1947
1957
1962
1963
1968
1971
1981
1988
1989
1991
1992
1996
1997
1998
2002
2010
2018
2025
2029
2048
2049
2053
2058
2061
2063
2069
2070
2072
\.



COPY author_papers (id) FROM stdin;
\.



COPY authors (id) FROM stdin;
8
30
40
51
65
73
78
82
89
94
103
106
110
117
120
135
140
149
155
156
158
169
176
178
185
200
213
218
229
233
235
242
244
252
265
268
278
294
296
301
306
322
324
328
334
348
351
354
359
380
389
390
398
400
417
435
440
442
444
447
451
456
466
485
494
496
498
504
509
512
514
518
521
522
530
534
535
543
546
548
559
560
561
568
572
582
587
588
590
596
602
603
606
607
617
622
630
632
635
643
645
650
656
658
661
675
683
688
697
714
716
719
722
730
731
748
751
756
768
772
777
778
779
783
793
796
802
805
807
812
815
816
821
829
838
840
843
845
847
848
853
856
863
864
865
870
887
889
894
906
908
913
914
921
928
940
943
945
946
951
953
954
960
963
964
969
979
985
991
994
995
998
999
1003
1011
1012
1023
1028
1032
1041
1044
1045
1047
1049
1064
1069
1072
1073
1076
1077
1078
1080
1081
1083
1091
1105
1113
1122
1123
1126
1131
1134
1144
1145
1153
1162
1165
1170
1177
1182
1183
1189
1196
1200
1209
1210
1217
1218
1220
1223
1224
1225
1228
1231
1232
1233
1234
1243
1249
1250
1252
1256
1262
1263
1264
1265
1266
1273
1276
1282
1284
1287
1291
1292
1294
1297
1304
1307
1313
1326
1332
1334
1338
1340
1341
1345
1348
1357
1360
1362
1363
1366
1369
1371
1372
1373
1384
1385
1388
1390
1392
1396
1397
1399
1401
1404
1408
1410
1411
1412
1415
1416
1419
1422
1425
1426
1428
1429
1430
1439
1441
1442
1443
1444
1452
1457
1458
1459
1466
1467
1468
1469
1472
1473
1476
1480
1484
1486
1488
1491
1493
1499
1503
1504
1509
1512
1513
1517
1521
1522
1525
1526
1527
1528
1529
1532
1533
1537
1542
1550
1552
1559
1566
1570
1574
1579
1581
1583
1588
1590
1592
1596
1598
1599
1604
1609
1612
1613
1618
1619
1620
1621
1624
1625
1632
1636
1637
1638
1642
1643
1648
1652
1653
1654
1655
1659
1660
1661
1665
1667
1670
1672
1673
1676
1678
1679
1685
1689
1690
1691
1695
1698
1699
1703
1706
1712
1713
1714
1721
1723
1727
1730
1733
1736
1739
1742
1750
1752
1755
1758
1759
1762
1764
1767
1769
1771
1772
1776
1777
1780
1781
1782
1783
1785
1786
1788
1790
1791
1793
1794
1797
1802
1805
1807
1809
1812
1813
1815
1817
1818
1819
1821
1828
1829
1830
1832
1835
1839
1840
1841
1842
1845
1846
1848
1849
1851
1853
1854
1857
1858
1859
1862
1864
1865
1867
1868
1871
1875
1878
1882
1883
1884
1885
1887
1888
1889
1894
1896
1898
1899
1900
1902
1903
1904
1906
1907
1908
1911
1912
1913
1916
1918
1920
1921
1924
1926
1927
1929
1930
1932
1936
1938
1939
1941
1943
1945
1947
1950
1954
1955
1957
1960
1962
1963
1964
1965
1968
1971
1973
1975
1976
1977
1978
1981
1983
1985
1988
1989
1991
1992
1993
1996
1997
1998
1999
2000
2002
2003
2005
2007
2009
2010
2013
2014
2016
2018
2021
2025
2027
2029
2031
2034
2037
2038
2039
2043
2044
2047
2048
2049
2053
2058
2060
2061
2062
2063
2064
2066
2068
2069
2070
2071
2072
2073
\.



COPY award_author (author, award) FROM stdin;
\.



COPY awards (id) FROM stdin;
\.



COPY best_applications_paper_as (id) FROM stdin;
\.



COPY best_paper_awards_committs (id, award) FROM stdin;
\.



COPY best_research_paper_awards (id) FROM stdin;
\.



COPY best_student_paper_awards (id) FROM stdin;
\.



COPY best_student_paper_suppors (id) FROM stdin;
\.



COPY bronze_supporters (id) FROM stdin;
\.



COPY committees (id, ref, committee) FROM stdin;
804	803	803
64	63	63
1651	1650	1650
1303	1302	1302
1418	1417	1417
712	713	713
1745	1746	1746
\.



COPY conference_halls (id) FROM stdin;
\.



COPY conferences (id, holded, start_conference, city_conference, name_conference, end_conference) FROM stdin;
63	\N	2015-05-08	Benguela	ZSWC	\N
803	\N	2014-05-04	Annaba	ZSWC	\N
1302	\N	2015-05-06	Andorra La Vella	XSWC	\N
1417	\N	2015-05-07	Escaldes	YSWC	\N
1650	\N	2014-05-02	Tirane	XSWC	\N
713	\N	2014-05-03	Mascara	YSWC	\N
1746	\N	2014-05-05	Pago Pago	SIGXYZ	\N
\.



COPY deadline_abstract_submiss (id) FROM stdin;
\.



COPY deadline_author_notificats (id) FROM stdin;
\.



COPY deadline_document (document, deadline) FROM stdin;
\.



COPY deadline_paper_submissions (id) FROM stdin;
\.



COPY deadlines (id, designed, date) FROM stdin;
\.



COPY documents (id) FROM stdin;
531
676
266
277
418
669
1245
589
1389
270
183
16
476
246
623
571
438
563
612
60
677
101
374
240
497
95
901
105
297
1247
881
554
464
219
1580
68
1051
427
758
255
37
157
85
737
749
574
45
287
1487
194
295
841
179
505
941
567
131
190
787
502
1139
419
745
629
452
725
576
1229
846
608
861
1048
360
313
680
209
107
569
391
839
647
364
55
850
597
238
1079
511
1181
141
323
1060
341
752
314
562
214
1212
545
594
148
738
386
39
454
66
275
336
1087
492
1290
665
373
866
18
1639
186
819
109
385
487
646
750
902
513
477
642
523
1500
430
259
118
691
308
87
330
171
262
127
817
167
754
757
849
769
775
282
0
1775
1779
1784
1792
1795
1800
1806
1808
1811
1814
1820
1822
1824
1827
1833
1837
1844
1847
1850
1855
1856
1860
1863
1866
1869
1873
1874
1880
1881
1886
1890
1892
1895
1897
1901
1905
1909
1910
1914
1915
1919
1922
1928
1931
1933
1937
1940
1942
1944
1946
1948
1949
1951
1952
1956
1959
1967
1970
1972
1979
1982
1987
1990
1994
2001
2008
2011
2015
2017
2020
678
696
700
705
706
718
727
732
733
741
747
763
764
780
789
801
808
813
822
826
827
837
842
844
852
855
862
875
883
890
892
899
907
912
915
916
924
925
929
930
962
966
968
975
984
988
990
992
1000
1007
1016
1021
1024
1034
1037
1050
1058
1065
1066
1067
1071
1082
1088
1092
1099
1112
1127
1132
1140
1141
1148
1149
1154
1155
1156
1164
1174
1184
1191
1202
1204
1207
1211
1215
1216
1226
1237
1248
1253
1259
1261
1269
1272
1275
1278
1280
1281
1285
1288
1293
1299
1306
1309
1314
1316
1321
1325
1328
1333
1335
1337
1339
1342
1343
1349
1358
1367
1370
1375
1379
1380
1394
1398
1400
1406
1414
1423
1432
1437
1445
1453
1460
1464
1465
1471
1474
1478
1489
1496
1505
1507
1516
1518
1523
1524
1530
1531
1535
1540
1546
1548
1551
1556
1562
1563
1565
1569
1571
1572
1576
1584
1585
1587
1593
1597
1605
1606
1607
1608
1611
1616
1622
1626
1628
1630
1631
1635
1640
1647
1656
1663
1666
1669
1675
1677
1680
1681
1682
1686
1692
1700
1704
1707
1709
1710
1716
1720
1722
1725
1728
1731
1734
1737
1741
1748
1753
1757
1760
1765
1768
1770
1774
6
26
32
44
53
69
77
88
102
114
119
125
143
160
174
184
192
202
204
210
222
223
232
241
256
257
279
290
303
304
309
327
333
345
353
361
362
368
381
392
407
414
416
439
441
465
481
488
493
500
520
539
555
575
598
610
613
624
626
634
640
655
668
799
2022
2023
2026
2028
2030
2033
2035
2040
2041
2042
2046
2050
2051
2052
2054
2055
2057
2059
2065
2067
2074
426
428
433
437
445
453
458
462
463
470
471
472
475
480
483
486
489
491
501
524
525
532
541
550
551
552
553
556
288
566
580
591
593
595
599
605
611
618
620
625
627
628
405
636
638
641
648
649
654
662
663
664
666
412
672
679
690
692
694
698
701
707
710
715
720
723
724
735
736
742
744
746
759
760
767
771
784
785
786
788
790
791
792
615
800
809
811
814
818
820
830
831
833
585
835
851
854
858
860
28
867
876
878
879
880
884
886
888
891
895
897
900
905
918
919
139
931
932
145
944
949
950
13
15
17
19
22
23
24
36
38
42
54
57
59
61
75
80
86
96
98
100
108
112
115
126
128
130
132
138
147
161
166
168
180
182
189
193
195
203
208
211
216
220
227
237
239
245
247
254
258
260
264
274
276
280
285
291
310
312
315
317
325
331
337
339
343
344
346
350
363
367
369
371
372
377
382
384
396
403
411
424
810
1368
1374
1376
1381
93
1124
1386
762
766
1405
1409
1413
50
740
34
1424
1255
1431
1433
1434
1435
1436
728
1440
1446
11
207
859
1260
1455
1461
702
868
1470
836
164
1267
1475
1479
124
1481
1483
1485
824
1490
172
1494
1495
1497
1498
936
1506
1508
1511
153
1514
797
273
904
1519
71
283
1318
1534
1538
251
1541
910
1295
1547
755
972
1549
938
1006
1553
225
1555
872
1557
1560
1344
1561
395
977
1573
198
1582
376
959
1586
423
1589
1591
982
1352
1594
1600
1601
1602
1603
1116
357
947
1323
1407
529
1040
1617
1623
320
1097
1627
926
469
1629
1377
558
1633
1634
1456
1420
1641
1447
1644
1645
1646
432
1063
478
1008
1382
1098
1657
1658
1121
1662
409
1664
1671
1674
601
1026
671
1683
387
1684
1402
565
1688
1693
113
956
957
965
967
970
973
974
978
92
761
987
261
993
996
997
1001
1002
49
1004
739
1010
1014
1015
1018
1019
1022
1029
1030
1031
1033
1035
206
1042
1043
316
1054
674
1056
1059
1068
1070
332
1085
1086
1089
123
1094
1096
1101
1104
289
1108
1109
1110
1115
1117
935
1128
1130
1137
272
903
446
406
1157
1159
1160
1161
542
250
1163
1169
1172
413
971
1179
1180
1055
1005
1185
1186
1188
1190
1192
1195
1197
1198
484
394
976
1205
1208
581
1219
1222
375
958
1227
422
1046
1235
1238
1241
1244
1246
1251
1254
1257
1258
616
528
1039
1270
1271
1277
468
1279
586
1100
557
1286
1289
1298
29
1300
1301
431
1062
1308
1310
1311
711
1312
1120
1315
1317
1320
1322
1168
1330
600
1336
670
1346
1347
1350
1351
146
1355
564
1356
1359
1142
1150
1364
1365
1694
1143
1133
1084
1450
1696
1701
1702
1187
537
1708
1052
1125
1717
1102
1718
1724
507
577
1462
35
1206
1735
1539
1501
1193
1738
1740
1743
1744
1747
729
1173
1749
659
1135
12
1175
1761
1378
1917
1354
1421
1705
1923
1448
1305
917
1925
305
479
1009
1383
1697
1934
896
1935
410
1027
415
1391
1687
1138
1515
1953
263
388
1751
1403
989
1361
1668
1726
1451
366
1961
1966
1482
1969
538
1053
1974
1103
342
1732
1754
474
1984
1986
508
578
1463
1057
1427
1711
1995
1649
1158
1502
1194
1017
2004
1395
2006
660
1136
1438
2012
1176
461
2019
1796
604
1107
682
1520
2024
1477
1756
2032
1554
1152
1787
1454
1093
5
1492
1578
770
1240
1075
1766
782
1568
1823
1536
2056
1798
1558
653
1327
2
687
47
1214
1545
1510
1166
1763
703
869
1106
681
1773
165
1268
1778
1151
4
1789
825
1236
173
1577
1239
1801
1803
1804
798
154
781
1810
1567
1816
72
284
1319
1
686
46
1213
1544
1825
911
1296
1610
893
1831
56
939
1834
226
873
1838
1843
877
1615
1852
199
1861
175
1274
1595
882
1870
1872
983
1353
828
1876
1877
191
874
358
948
1324
1891
952
1893
321
927
293
1329
450
942
136
41
104
1036
429
1013
510
885
311
981
397
753
99
221
142
527
90
31
249
467
579
695
365
651
519
231
1038
299
871
33
20
685
934
404
652
152
137
460
27
495
1025
170
3
621
21
10
129
79
228
549
163
473
248
188
116
633
823
699
1393
243
144
349
526
920
292
1242
52
459
933
355
14
338
9
271
298
187
544
434
224
517
533
667
401
592
267
43
159
1074
84
230
619
326
393
1230
151
1114
1090
937
773
721
70
536
693
609
570
1119
490
806
370
547
408
58
955
794
319
62
684
425
318
269
253
1387
644
443
631
774
215
717
1020
482
449
980
709
1129
708
457
515
776
1095
286
1614
181
1146
1167
281
307
516
1061
857
657
1575
898
91
795
236
201
300
673
122
689
832
402
217
583
1543
909
177
83
584
356
378
347
834
111
961
48
448
639
1171
765
1283
499
67
1201
74
399
81
97
162
436
121
1199
540
133
986
573
1111
196
352
420
637
340
506
614
383
76
1331
197
335
150
302
25
421
205
212
329
234
\.



COPY e_mails (person, value) FROM stdin;
1581	Herberta.Fullenwider@secretresearch.tld
1583	Shesha.Humbird@secretresearch.tld
1588	Hidemichi.Tropp@secretresearch.tld
1590	Araceli.Ertel@secretresearch.tld
1592	Socorro.Mcsorley@secretresearch.tld
1596	Querida.Kreatsoulas@secretresearch.tld
1598	Shontaya.Klitzner@secretresearch.tld
1599	Yae.Timblin@secretresearch.tld
1604	Sherry.Mullennix@secretresearch.tld
1609	Valentina.Topia@secretresearch.tld
1612	Hedda.Yoshida@secretresearch.tld
1613	Plakida.Gothe@secretresearch.tld
1618	Giselher.Nibler@secretresearch.tld
1619	Marek.Mancino@secretresearch.tld
1620	Mamie.Howen@secretresearch.tld
1621	Handy.Ratajczak@secretresearch.tld
1624	Xylina.Mcnicoll@secretresearch.tld
1625	Lucile.Homola@secretresearch.tld
1632	Aeacus.Veloz@secretresearch.tld
1636	Evi.Heidebrecht@secretresearch.tld
1637	Yoshida.Volo@secretresearch.tld
1638	Phaethon.Gearon@secretresearch.tld
1642	Patroklus.Hertel@secretresearch.tld
1643	Garca.Diers@secretresearch.tld
1648	Deelon.Sephton@secretresearch.tld
1652	Matteo.Mestre@secretresearch.tld
1653	Letizia.Madaras@secretresearch.tld
1654	Seriozhenka.Homen@secretresearch.tld
1655	Gwalchmei.Halbert@secretresearch.tld
1659	Eligius.Vanwechel@secretresearch.tld
1660	Winand.Poulton@secretresearch.tld
1661	Mukhtaar.Grewe@secretresearch.tld
1665	Sozui.Jalovel@secretresearch.tld
1667	Oleka.Tommasino@secretresearch.tld
1670	Krosa.Kuney@secretresearch.tld
1672	Iulia.Morra@secretresearch.tld
1673	Tsumemasa.Lloyd@secretresearch.tld
1676	Lottchen.Pillitteri@secretresearch.tld
1678	Annunziata.Ravi@secretresearch.tld
1679	Yoyon.Lecroy@secretresearch.tld
1685	Taaliba.Debrita@secretresearch.tld
1689	Vonda.Jasmine@secretresearch.tld
1690	Clmentine.Engellant@secretresearch.tld
1691	Kobe.Guttirez@secretresearch.tld
1695	Chantrelle.Gruiger@secretresearch.tld
1698	Janeka.Hochhalter@secretresearch.tld
1699	Luitfriede.Westmark@secretresearch.tld
1703	Strezislava.Weingard@secretresearch.tld
1706	Edmonda.Ditullio@secretresearch.tld
1712	Cherry.Dolence@secretresearch.tld
1713	Cipriana.Wadzinski@secretresearch.tld
1714	Mikio.Brunston@secretresearch.tld
1721	Matashichi.Butman@secretresearch.tld
1723	Marce.Fiscalini@secretresearch.tld
1727	Augusto.Kempson@secretresearch.tld
1730	Shontal.Sehnert@secretresearch.tld
1733	Aleydis.Virgadamo@secretresearch.tld
1736	Lucrecia.Rollings@secretresearch.tld
1739	Analeigh.Sebring@secretresearch.tld
1742	Lexi.Faulk@secretresearch.tld
1750	Akina.Jang@secretresearch.tld
1752	Gizla.Nordmark@secretresearch.tld
1755	Sameera.Beazley@secretresearch.tld
1758	Boje.Ostrum@secretresearch.tld
1759	Jazmine.Susman@secretresearch.tld
1762	Razan.Symons@secretresearch.tld
1764	Miloushka.Pezez@secretresearch.tld
1767	Angela.Hager@secretresearch.tld
1769	Fanaila.Torain@secretresearch.tld
1771	Leonora.Peli@secretresearch.tld
1772	Fahroni.Anglea@secretresearch.tld
1776	Bezubaia.Wiece@secretresearch.tld
1777	Janny.Mccaine@secretresearch.tld
1780	Ramonda.Tripplett@secretresearch.tld
1781	Datja.Carner@secretresearch.tld
1782	Sander.Garriss@secretresearch.tld
1783	Zeanes.Hinsley@secretresearch.tld
1785	Krystal.Farria@secretresearch.tld
1786	Llyn.Hardge@secretresearch.tld
1788	Podolphe.Fluitt@secretresearch.tld
1790	Loris.Elder@secretresearch.tld
1791	Okichi.Spradlin@secretresearch.tld
1793	Huaning.Zwolski@secretresearch.tld
1794	Juriaan.Schremp@secretresearch.tld
1797	ra.Jansons@secretresearch.tld
1802	Graud.Shuker@secretresearch.tld
1805	Lone.Pavese@secretresearch.tld
1807	Sanaaa.Yoneda@secretresearch.tld
1809	Breonia.Gierling@secretresearch.tld
1812	Bia.Klemme@secretresearch.tld
1813	Atsumichi.Licano@secretresearch.tld
1815	Martino.Nommay@secretresearch.tld
1817	Tatiiana.Sublett@secretresearch.tld
1818	Eskil.Littledave@secretresearch.tld
1819	Kulthum.Liverance@secretresearch.tld
1821	Gennadi.Schanck@secretresearch.tld
1828	Leonel.Meche@secretresearch.tld
1829	Dukinea.Zmijewski@secretresearch.tld
1830	Chebi.Selking@secretresearch.tld
1832	Fedorav.Solich@secretresearch.tld
1835	Honami.Docherty@secretresearch.tld
1839	Waatiq.Perico@secretresearch.tld
1840	Pieter.Frend@secretresearch.tld
1841	Flora.Aveni@secretresearch.tld
1842	Kallie.Bednarek@secretresearch.tld
1845	Hagibis.Kihn@secretresearch.tld
1846	Walto.Messman@secretresearch.tld
1848	Lecia.Baumeister@secretresearch.tld
1849	Silvester.Yelvington@secretresearch.tld
1851	Nene.Rhea@secretresearch.tld
1853	Yumiko.Ginther@secretresearch.tld
1854	Zufar.Pestoni@secretresearch.tld
1857	Myshka.Krishnamurthy@secretresearch.tld
1858	Ayla.Moncrief@secretresearch.tld
1859	Aristomnis.Dauber@secretresearch.tld
1862	Ernestine.Barkan@secretresearch.tld
1864	Jermaine.Mandahl@secretresearch.tld
1865	Agpios.Bia@secretresearch.tld
1867	Trillare.Stukel@secretresearch.tld
1868	Caddock.Stagowski@secretresearch.tld
1871	Barbi.Denery@secretresearch.tld
1875	Jenna.Ovit@secretresearch.tld
1878	Argus.Bierwirth@secretresearch.tld
1882	Vasilista.Hamic@secretresearch.tld
1883	Patrido.Sielaff@secretresearch.tld
1884	Melisa.Patriarco@secretresearch.tld
1885	Alona.Lucario@secretresearch.tld
1887	Demetria.Tramonti@secretresearch.tld
1888	Tuhfa.Pedez@secretresearch.tld
1889	Akila.Terlizzi@secretresearch.tld
1894	Gayle.Wingrove@secretresearch.tld
1896	Baptist.Schubert@secretresearch.tld
1898	Francoise.Rioux@secretresearch.tld
1899	Kakuei.Blanford@secretresearch.tld
1900	Finn.Carboneau@secretresearch.tld
1902	Amir.Conkling@secretresearch.tld
1903	Rico.Boronat@secretresearch.tld
1904	Gigi.Barfuss@secretresearch.tld
1906	Kiyoemon.Wesby@secretresearch.tld
1907	Ruwaid.Solian@secretresearch.tld
1908	Mya.Swilley@secretresearch.tld
1911	Tadao.Pentaris@secretresearch.tld
1912	Duron.Dibella@secretresearch.tld
1913	Brittani.Gasman@secretresearch.tld
1916	Iravati.Pizzolato@secretresearch.tld
1918	Jonam.Steinle@secretresearch.tld
1920	Deke.Mirabelli@secretresearch.tld
1921	Zeenab.Lasane@secretresearch.tld
1924	Tienne.Segraves@secretresearch.tld
1926	Jamaall.Rohen@secretresearch.tld
1927	Conchetta.Cater@secretresearch.tld
1929	Evdxios.Fageraes@secretresearch.tld
1930	Honey.Eidinger@secretresearch.tld
1932	Jedrick.Relacion@secretresearch.tld
1936	Lucretia.Ferndez@secretresearch.tld
1938	JamAan.Kine@secretresearch.tld
1939	Zanthe.Felarca@secretresearch.tld
1941	Amalia.Krajcik@secretresearch.tld
1943	Gustel.Pitek@secretresearch.tld
1945	Cyril.Croslen@secretresearch.tld
1947	Zumruda.Fishman@secretresearch.tld
1950	Michizane.Krips@secretresearch.tld
1954	Bibiane.Eddens@secretresearch.tld
1955	Miranda.Leinen@secretresearch.tld
1957	Sigurd.Mahli@secretresearch.tld
1960	Dmitreeva.Ellsbury@secretresearch.tld
1962	Kristin.Sandhu@secretresearch.tld
1963	Gerlind.Boomershine@secretresearch.tld
1964	Madelynn.Hoehn@secretresearch.tld
1965	Llwyr.Fagerstrom@secretresearch.tld
1968	Nonna.Laplaunt@secretresearch.tld
1971	Toshimichi.Speth@secretresearch.tld
1973	Malcolm.Voelz@secretresearch.tld
1975	Lonce.Jiron@secretresearch.tld
1976	Gratia.Flach@secretresearch.tld
1977	Anbessa.Gulde@secretresearch.tld
1978	Adolfa.Leuthauser@secretresearch.tld
1981	Eileen.Heick@secretresearch.tld
1983	Atsumori.Bloyer@secretresearch.tld
1985	Bodil.Korinta@secretresearch.tld
1988	Irminwin.Milloy@secretresearch.tld
1989	Igone.Rader@secretresearch.tld
1991	Trina.Sjerven@secretresearch.tld
1992	Tango.Constable@secretresearch.tld
1993	Solange.Alson@secretresearch.tld
1996	Khadija.Lagerquist@secretresearch.tld
1997	Aberthol.Wilczak@secretresearch.tld
1998	Maxime.Higgs@secretresearch.tld
1999	Haimo.Huesso@secretresearch.tld
2000	Javier.Hausauer@secretresearch.tld
2002	Hasnaa.Sietsema@secretresearch.tld
2003	Cellina.Schlosser@secretresearch.tld
2005	Freda.Freimuth@secretresearch.tld
2007	Sajag.Traunfeld@secretresearch.tld
2009	Gulika.Alipio@secretresearch.tld
2010	Benita.Hatzenbuehler@secretresearch.tld
2013	Glafira.Geng@secretresearch.tld
2014	Mikolas.Sirman@secretresearch.tld
2016	Blossom.Quero@secretresearch.tld
2018	Evamarie.Coraham@secretresearch.tld
2021	Koshiro.Augusto@secretresearch.tld
2025	Prebrana.Kekiwi@secretresearch.tld
2027	Yakamochi.Alonza@secretresearch.tld
2029	Lance.Fernandes@secretresearch.tld
2031	Salaah.Elio@secretresearch.tld
2034	Dorel.Brandt@secretresearch.tld
2037	Ayushmati.Appelgren@secretresearch.tld
2038	Lacrasha.Slavick@secretresearch.tld
2039	Takehide.Gauna@secretresearch.tld
2043	Iasion.Kirt@secretresearch.tld
2044	Aida.Appelt@secretresearch.tld
2047	Sela.Funnye@secretresearch.tld
2048	Vyshia.Waldall@secretresearch.tld
2049	Mawar.Camfield@secretresearch.tld
2053	Raktavira.Danforth@secretresearch.tld
2058	Abdul.Spicer@secretresearch.tld
2060	Mimi.Stremmel@secretresearch.tld
2061	Jada.Grech@secretresearch.tld
2062	Castalia.Ryser@secretresearch.tld
2063	Dianmu.Aver@secretresearch.tld
2064	Richild.Brinius@secretresearch.tld
2066	Nana.Stania@secretresearch.tld
2068	Radoste.Hoefling@secretresearch.tld
2069	Uleia.Mineah@secretresearch.tld
2070	Lippio.Llopis@secretresearch.tld
2071	Jakoba.Bueche@secretresearch.tld
2072	Luzia.Rahib@secretresearch.tld
2073	Cloelia.Shein@secretresearch.tld
8	Donald.Ludlow@secretresearch.tld
30	AbdulHaadi.Castellan@secretresearch.tld
40	Mirra.Tygart@secretresearch.tld
51	Hannele.Kneifl@secretresearch.tld
65	Alexandros.Lagazo@secretresearch.tld
73	Claudios.Lemmert@secretresearch.tld
78	Takuboku.Aicklen@secretresearch.tld
82	Nik.Reposa@secretresearch.tld
89	Marna.Crookshanks@secretresearch.tld
94	Stopolcha.Starowicz@secretresearch.tld
103	Casswallawn.Scheiblich@secretresearch.tld
106	Ceanna.Vangoff@secretresearch.tld
110	Muna.Lastovica@secretresearch.tld
117	Roseann.Ora@secretresearch.tld
120	Avigdor.Puglia@secretresearch.tld
135	Lili.Atoe@secretresearch.tld
140	Uqbah.Oconnell@secretresearch.tld
149	Sharise.Heagy@secretresearch.tld
155	Shahaama.Berum@secretresearch.tld
156	Cathy.Phebus@secretresearch.tld
158	Danaus.Dacanay@secretresearch.tld
169	Shoko.Moel@secretresearch.tld
176	Ovidio.Bostrom@secretresearch.tld
178	Everardo.Yidiaris@secretresearch.tld
185	Cady.Schweizer@secretresearch.tld
200	Riddhi.Colesar@secretresearch.tld
213	Warona.Pelligrino@secretresearch.tld
218	YolandaAbigail.Insogna@secretresearch.tld
229	Jace.Ruotolo@secretresearch.tld
233	Nia.Drakes@secretresearch.tld
235	Kim.Colombe@secretresearch.tld
242	Meena.Riegel@secretresearch.tld
244	Petros.Josefy@secretresearch.tld
252	Chikafusa.Koolman@secretresearch.tld
265	Aspasa.Abaunza@secretresearch.tld
268	Tarran.Pointer@secretresearch.tld
278	Bozena.Tilly@secretresearch.tld
294	Tera.Vigen@secretresearch.tld
296	Cornelius.Dolak@secretresearch.tld
301	Alyss.Wuitschick@secretresearch.tld
306	Naglaya.Tantillo@secretresearch.tld
322	Reece.Raburn@secretresearch.tld
324	Elif.Gameros@secretresearch.tld
328	Tahlia.Francisque@secretresearch.tld
334	Toku.Synowiec@secretresearch.tld
348	Yukako.Klingbeil@secretresearch.tld
351	Lilja.Siwiec@secretresearch.tld
354	Dewayne.Buttermore@secretresearch.tld
359	Katreen.Osthoff@secretresearch.tld
380	Vladlena.Tlumacki@secretresearch.tld
389	Dymas.Houskeeper@secretresearch.tld
390	Carli.Maggert@secretresearch.tld
398	Dondrea.Crocco@secretresearch.tld
400	Hilary.Braddy@secretresearch.tld
417	Ieshige.Kosinski@secretresearch.tld
435	Shaunene.Libera@secretresearch.tld
440	Saalim.Velasquez@secretresearch.tld
442	Fovro.Chung@secretresearch.tld
444	Tydeus.Dyckman@secretresearch.tld
447	Davida.Rho@secretresearch.tld
451	Karina.Eggington@secretresearch.tld
456	Fedyenka.Terrasi@secretresearch.tld
466	Solymar.Palisbo@secretresearch.tld
485	Iudita.Altew@secretresearch.tld
494	Houke.Luthe@secretresearch.tld
496	Garon.Tischler@secretresearch.tld
498	Sam.Mattheis@secretresearch.tld
504	Tekla.Gallerani@secretresearch.tld
509	Rufio.Guitard@secretresearch.tld
512	Ilsegret.Akerley@secretresearch.tld
514	Giovanna.Douthit@secretresearch.tld
518	Salamon.Julien@secretresearch.tld
521	Tramaine.Scruton@secretresearch.tld
522	Ulia.Kaines@secretresearch.tld
530	Torokanova.Kosloski@secretresearch.tld
534	Galyn.Stobie@secretresearch.tld
535	Immanuel.Bugos@secretresearch.tld
543	Olzhbeta.Hasenberg@secretresearch.tld
546	Vasyklo.Netz@secretresearch.tld
548	Fabiana.Demase@secretresearch.tld
559	Volotkoveia.Klees@secretresearch.tld
560	Evgnios.Feasel@secretresearch.tld
561	Pazia.Comnick@secretresearch.tld
568	Isha.Quave@secretresearch.tld
572	Tanja.Lockmiller@secretresearch.tld
582	Adrien.Hoit@secretresearch.tld
587	Toyoko.Colden@secretresearch.tld
588	Dewi.Rappleyea@secretresearch.tld
590	Gerakna.Ryneer@secretresearch.tld
596	Masafumi.Gipson@secretresearch.tld
602	Che.Kess@secretresearch.tld
603	Ineng.Alkbsh@secretresearch.tld
606	Momus.Rivadeneira@secretresearch.tld
607	Dyllan.Mairs@secretresearch.tld
617	Nisus.Coby@secretresearch.tld
622	Miles.Manero@secretresearch.tld
630	Ksniatintsa.Fuchser@secretresearch.tld
632	Einian.Frascella@secretresearch.tld
635	Maureo.Benedict@secretresearch.tld
643	Diana.Gulbranson@secretresearch.tld
645	Kiraanna.Scherping@secretresearch.tld
650	Este.Manon@secretresearch.tld
656	Anthony.Row@secretresearch.tld
658	Noburo.Charleton@secretresearch.tld
661	Eshita.Whitby@secretresearch.tld
675	Namiko.Leval@secretresearch.tld
683	Dele.Galla@secretresearch.tld
688	Erminia.Damrell@secretresearch.tld
697	Radha.Sloan@secretresearch.tld
714	Aurelian.Fealy@secretresearch.tld
716	Inejiro.Javens@secretresearch.tld
719	Helene.Nik@secretresearch.tld
722	Nazarova.Abundis@secretresearch.tld
730	Erechtheus.Muschick@secretresearch.tld
731	Juro.Scogin@secretresearch.tld
748	Pippo.Nascimento@secretresearch.tld
751	Adelio.Zahner@secretresearch.tld
756	Lotta.Francoise@secretresearch.tld
768	Tamiko.Docken@secretresearch.tld
772	Timun.Silverstein@secretresearch.tld
777	Deverell.Anez@secretresearch.tld
778	Rebeca.Aday@secretresearch.tld
779	Firdaus.Casavez@secretresearch.tld
783	Jurgisr.Arkins@secretresearch.tld
793	Anzhela.Venturelli@secretresearch.tld
796	Brenda.Varley@secretresearch.tld
802	Feli.Trainham@secretresearch.tld
805	Octave.Diana@secretresearch.tld
807	Toyoaki.Richoux@secretresearch.tld
812	Caden.Failing@secretresearch.tld
815	Constantino.Thielen@secretresearch.tld
816	Aandranee.Sakamaki@secretresearch.tld
821	Liebetraud.Kiddy@secretresearch.tld
829	Wira.Majette@secretresearch.tld
838	Charlette.Negron@secretresearch.tld
840	Cleveland.Navarez@secretresearch.tld
843	Apelino.Reeber@secretresearch.tld
845	Stacie.Ciesielski@secretresearch.tld
847	Safiyya.Letchaw@secretresearch.tld
848	Shaqeeqa.Levra@secretresearch.tld
853	Kerry.Navarrate@secretresearch.tld
856	Graziana.Callabrass@secretresearch.tld
863	Aseel.Waddups@secretresearch.tld
864	Colombe.Bermea@secretresearch.tld
865	Booker.Spiker@secretresearch.tld
870	Fajyaz.Mutana@secretresearch.tld
887	Shinji.Kapler@secretresearch.tld
889	Shandee.Finnicum@secretresearch.tld
894	Detana.Trautz@secretresearch.tld
906	Bennet.Melendes@secretresearch.tld
908	Eupeithes.Bevens@secretresearch.tld
913	Erik.Strothmann@secretresearch.tld
914	Clementine.Barga@secretresearch.tld
921	Vilena.Orillion@secretresearch.tld
928	Avniel.Debiase@secretresearch.tld
940	Tyonna.Sturdevant@secretresearch.tld
943	Soshu.Burress@secretresearch.tld
945	Brys.Robak@secretresearch.tld
946	Inez.Meeroff@secretresearch.tld
951	Kuemon.Coatie@secretresearch.tld
953	Juanisha.Seppi@secretresearch.tld
954	Janita.Bolieu@secretresearch.tld
960	Chasidy.Hoop@secretresearch.tld
963	Nomi.Rosato@secretresearch.tld
964	Demont.Escalet@secretresearch.tld
969	Waliyya.Dandrea@secretresearch.tld
979	Wava.Goubeaux@secretresearch.tld
985	Cecil.Kochler@secretresearch.tld
991	Amora.Ockmond@secretresearch.tld
994	Editta.Servoss@secretresearch.tld
995	Utathya.Kreig@secretresearch.tld
998	Kea.Croshaw@secretresearch.tld
999	Ajanta.Mischel@secretresearch.tld
1003	Bhoomika.Secord@secretresearch.tld
1011	Rhea.Platas@secretresearch.tld
1012	Lisandro.Harpst@secretresearch.tld
1023	Gota.Dorff@secretresearch.tld
1028	Sabina.Conde@secretresearch.tld
1032	Julika.Smar@secretresearch.tld
1041	Flaca.Sodawasser@secretresearch.tld
1044	Barsha.Murrain@secretresearch.tld
1045	Aedd.Lurye@secretresearch.tld
1047	Dena.Mcentire@secretresearch.tld
1049	Caryn.Grudzinski@secretresearch.tld
1064	Casandra.Shire@secretresearch.tld
1069	Dayu.Vient@secretresearch.tld
1072	Jeanine.Garoner@secretresearch.tld
1073	Dirthe.Kiewiet@secretresearch.tld
1076	Daris.Astley@secretresearch.tld
1077	Gil.Holben@secretresearch.tld
1078	Grite.Faddis@secretresearch.tld
1080	Iha.Em@secretresearch.tld
1081	Addison.Bovio@secretresearch.tld
1083	Barbie.Dubonnet@secretresearch.tld
1091	Daniel.Harriston@secretresearch.tld
1105	Tarrant.Alsbrooks@secretresearch.tld
1113	Nolan.Brownle@secretresearch.tld
1122	Jake.Bober@secretresearch.tld
1123	Argos.Cumings@secretresearch.tld
1126	AbdulBaasid.Chilvers@secretresearch.tld
1131	Shaakira.Ricklefs@secretresearch.tld
1134	Prokop.Limage@secretresearch.tld
1144	Hanka.Henness@secretresearch.tld
1145	Yves.Hunsucker@secretresearch.tld
1153	Motoyasu.Calligy@secretresearch.tld
1162	Maysak.Anetsberger@secretresearch.tld
1165	Teriuihi.Lachner@secretresearch.tld
1170	Rosalinde.Leinbach@secretresearch.tld
1177	Liska.Lambourne@secretresearch.tld
1182	Flaco.Reyome@secretresearch.tld
1183	Latrice.Ghrist@secretresearch.tld
1189	Odysseus.Dilthey@secretresearch.tld
1196	Junichi.Hagele@secretresearch.tld
1200	Sadahige.Taglialatela@secretresearch.tld
1209	Effie.Menzie@secretresearch.tld
1210	Mitsuo.Neff@secretresearch.tld
1217	Gisselle.Teigen@secretresearch.tld
1218	Gabriele.Darsey@secretresearch.tld
1220	Carevel.Tardif@secretresearch.tld
1223	Juri.Guzik@secretresearch.tld
1224	Oryan.Mirles@secretresearch.tld
1225	Oka.Prock@secretresearch.tld
1228	Coby.Smaller@secretresearch.tld
1231	Blanca.Ursery@secretresearch.tld
1232	Tsuruki.Hazelrigg@secretresearch.tld
1233	Maeko.Kontogiannis@secretresearch.tld
1234	Dama.Leino@secretresearch.tld
1243	Eber.Ebinger@secretresearch.tld
1249	Heidelore.Ruschmann@secretresearch.tld
1250	Rosamar.Wish@secretresearch.tld
1252	Mora.Christofferse@secretresearch.tld
1256	Kinaana.Kodera@secretresearch.tld
1262	Faith.Neeld@secretresearch.tld
1263	Reiko.Castile@secretresearch.tld
1264	Guiseppa.Thurstonson@secretresearch.tld
1265	Lane.Portes@secretresearch.tld
1266	LeVaughan.Laity@secretresearch.tld
1273	Notburg.Towber@secretresearch.tld
1276	Pilib.Seu@secretresearch.tld
1282	Dawn.Lauinger@secretresearch.tld
1284	Kit.Storrs@secretresearch.tld
1287	Liselotte.Groleau@secretresearch.tld
1291	Anwar.Katayama@secretresearch.tld
1292	Korechika.Mamer@secretresearch.tld
1294	Madaleno.Bercier@secretresearch.tld
1297	Urako.Staker@secretresearch.tld
1304	Mazcho.Stringer@secretresearch.tld
1307	Torah.Giller@secretresearch.tld
1313	Primavera.Huffstickler@secretresearch.tld
1326	Julien.Triveno@secretresearch.tld
1332	Mercede.Naslund@secretresearch.tld
1334	Misty.Holladay@secretresearch.tld
1338	Khynika.Borwig@secretresearch.tld
1340	Vrotsislava.Bouman@secretresearch.tld
1341	Gulielma.Arce@secretresearch.tld
1345	Tatsukichi.Gerstenberger@secretresearch.tld
1348	Aleece.Thorn@secretresearch.tld
1357	Latoya.Lovato@secretresearch.tld
1360	Coch.Foulger@secretresearch.tld
1362	Marisa.Roufs@secretresearch.tld
1363	Joey.Yarboro@secretresearch.tld
1366	Maela.Chamley@secretresearch.tld
1369	Dorinda.Cuchiara@secretresearch.tld
1371	Dodie.Tedford@secretresearch.tld
1372	Ofelia.Golde@secretresearch.tld
1373	Frangiskos.Truly@secretresearch.tld
1384	Muni.Mccuiston@secretresearch.tld
1385	Egor.Braue@secretresearch.tld
1388	Taliyah.Jafari@secretresearch.tld
1390	Christelle.Garced@secretresearch.tld
1392	Jared.Torgersen@secretresearch.tld
1396	Alka.Groshek@secretresearch.tld
1397	Doppo.Kieser@secretresearch.tld
1399	Marulia.Bondura@secretresearch.tld
1401	Makhna.Stabile@secretresearch.tld
1404	Kellie.Frenner@secretresearch.tld
1408	Majdiyya.Bonsall@secretresearch.tld
1410	Cassian.Cozzy@secretresearch.tld
1411	Jelawat.Balletta@secretresearch.tld
1412	Fedoritsa.Stinner@secretresearch.tld
1415	Calida.Starace@secretresearch.tld
1416	Saer.Dillenbeck@secretresearch.tld
1419	Stolpolcha.Shigemi@secretresearch.tld
1422	Adamanta.Schlitt@secretresearch.tld
1425	Katyushka.Gabriele@secretresearch.tld
1426	Gavriella.Sasson@secretresearch.tld
1428	Gia.Stonesifer@secretresearch.tld
1429	Gerharde.Heidtbrink@secretresearch.tld
1430	Paloma.Schnall@secretresearch.tld
1439	Martina.Mcclary@secretresearch.tld
1441	Emese.Abadie@secretresearch.tld
1442	Yoriko.Boot@secretresearch.tld
1443	Gerald.Fieselman@secretresearch.tld
1444	Imelde.Ballin@secretresearch.tld
1452	Cindi.Ginanni@secretresearch.tld
1457	Alwin.Roewe@secretresearch.tld
1458	Mudri.Gamero@secretresearch.tld
1459	Gorshedna.Marone@secretresearch.tld
1466	Bhavin.Primavera@secretresearch.tld
1467	Marlene.Dague@secretresearch.tld
1468	Favio.Mutherspaw@secretresearch.tld
1469	Luca.Dolbin@secretresearch.tld
1472	Nessa.Thomison@secretresearch.tld
1473	Yemena.Knebel@secretresearch.tld
1476	Lilly.Rissanen@secretresearch.tld
1480	Fikriyya.Siddiq@secretresearch.tld
1484	Natasia.Sliter@secretresearch.tld
1486	Fokina.Poythress@secretresearch.tld
1488	Hypnos.Blank@secretresearch.tld
1491	Shaka.Enget@secretresearch.tld
1493	Athindoros.Shurgot@secretresearch.tld
1499	Uchdryd.Locicero@secretresearch.tld
1503	Janah.Moryl@secretresearch.tld
1504	Takako.Nordine@secretresearch.tld
1509	Jaen.Kerechanko@secretresearch.tld
1512	Shoichi.Mathey@secretresearch.tld
1513	Asami.Sellek@secretresearch.tld
1517	Bhadra.Whidden@secretresearch.tld
1521	Arcadia.Granade@secretresearch.tld
1522	Oles.Sumaran@secretresearch.tld
1525	Xuqiu.Deller@secretresearch.tld
1526	Inocente.Arntzen@secretresearch.tld
1527	Ernst.Bengtson@secretresearch.tld
1528	Faqueza.Correll@secretresearch.tld
1529	Hortense.Ganotisi@secretresearch.tld
1532	Lauranne.Brwon@secretresearch.tld
1533	Lloyd.Stallsmith@secretresearch.tld
1537	Jascha.Plantier@secretresearch.tld
1542	Guido.Genier@secretresearch.tld
1550	Ran.Rubendall@secretresearch.tld
1552	Yaineris.Francisco@secretresearch.tld
1559	Clariee.Martucci@secretresearch.tld
1566	Chesell.Vatter@secretresearch.tld
1570	Kyledyr.Constantino@secretresearch.tld
1574	Iken.Siluis@secretresearch.tld
1579	Loke.Tuton@secretresearch.tld
\.



COPY exhibitors (id) FROM stdin;
\.



COPY fees (id, currency, price) FROM stdin;
1980	\N	5002
2045	\N	5003
743	\N	5005
1719	\N	5006
1221	\N	5001
1826	\N	5004
1799	\N	5007
379	\N	752
1564	\N	753
1203	\N	757
1118	\N	754
134	\N	751
1879	\N	755
1958	\N	756
\.



COPY general_chairs (id) FROM stdin;
\.



COPY gold_supporters (id) FROM stdin;
\.



COPY hotels (id) FROM stdin;
\.



COPY invited_speakers (id) FROM stdin;
\.



COPY listeners (id) FROM stdin;
51
65
82
110
117
140
169
213
278
322
324
348
389
400
451
494
521
534
582
587
588
635
656
768
779
807
829
838
840
847
864
865
870
887
906
913
940
946
953
954
979
998
1011
1041
1073
1078
1083
1091
1113
1131
1153
1165
1182
1183
1209
1217
1224
1232
1243
1249
1256
1262
1273
1297
1307
1313
1340
1372
1396
1412
1416
1439
1443
1452
1457
1459
1466
1467
1469
1484
1493
1521
1527
1529
1533
1566
1574
1604
1609
1620
1643
1648
1659
1667
1678
1689
1690
1698
1721
1730
1733
1736
1742
1750
1771
1786
1807
1809
1813
1817
1832
1846
1853
1857
1862
1865
1867
1868
1871
1885
1887
1889
1902
1908
1911
1913
1920
1924
1930
1936
1943
1950
1955
1963
1968
1973
1976
1981
1983
1989
2002
2007
2071
\.



COPY main_offices (id) FROM stdin;
\.



COPY organizators (id) FROM stdin;
7
103
140
200
229
455
503
504
543
582
704
726
734
838
848
922
923
1147
1178
1228
1265
1449
1452
1488
1715
1729
1786
1818
1836
1862
1913
1985
2036
\.



COPY organizing_committee_membs (id) FROM stdin;
\.



COPY organizing_committees (id) FROM stdin;
\.



COPY paper_author (aid, pid) FROM stdin;
8	9
30	31
40	41
51	52
51	25
65	66
65	67
65	68
73	10
73	74
78	79
82	83
82	84
82	85
89	90
94	95
94	48
103	104
103	105
106	107
110	58
117	118
120	121
135	136
140	141
140	142
149	150
149	151
155	66
155	68
156	157
156	122
158	159
169	170
176	177
178	179
185	186
185	187
185	188
200	201
213	214
213	215
218	219
229	230
229	231
233	234
235	236
242	243
244	167
252	81
252	253
265	266
265	238
265	267
268	269
268	270
278	177
294	295
296	297
296	298
296	299
296	300
301	302
301	197
306	181
306	307
306	308
322	323
324	104
324	105
328	329
334	335
334	336
348	349
351	352
351	101
354	355
359	360
380	311
380	330
380	171
389	246
390	311
390	391
390	171
398	399
398	326
398	18
400	401
400	402
417	418
417	419
417	420
435	436
440	374
442	443
444	62
444	429
447	448
447	449
447	450
451	452
451	91
456	457
456	452
466	281
485	76
494	495
496	275
496	183
496	497
498	499
504	505
509	418
509	510
509	511
512	513
514	515
514	516
514	517
518	519
521	234
521	197
522	523
530	531
534	519
535	48
543	544
543	201
543	545
546	266
546	238
546	547
548	549
559	297
560	121
561	562
568	569
568	570
568	571
572	573
572	574
582	583
582	584
582	434
587	129
587	20
587	292
588	589
590	355
596	597
596	386
602	118
603	393
603	116
606	365
607	608
607	609
617	302
622	623
630	631
632	314
632	33
632	633
635	338
643	644
643	111
643	540
645	646
645	282
645	91
645	647
645	492
650	651
656	657
656	536
658	383
661	385
675	676
675	677
683	684
688	689
688	567
697	516
697	236
714	329
716	352
716	101
716	717
719	83
719	84
722	181
722	307
722	680
730	157
730	122
731	186
731	188
731	547
748	749
748	750
748	505
751	752
751	311
751	753
751	754
751	171
756	757
756	457
756	758
768	769
772	773
772	335
772	774
772	775
772	336
772	776
777	459
777	313
778	121
779	14
783	399
783	326
783	393
783	116
793	794
793	795
793	157
793	122
796	295
802	107
805	806
805	637
807	563
812	150
812	151
815	404
815	651
816	817
816	708
821	737
829	259
838	839
840	841
843	487
845	846
847	510
847	511
848	849
848	850
853	187
856	212
863	177
864	476
865	148
865	866
865	67
870	684
887	111
887	540
889	846
894	477
906	404
908	909
908	152
908	652
913	236
913	292
914	39
921	383
928	738
940	941
940	898
940	942
943	399
943	326
943	841
945	699
946	594
951	201
951	689
951	567
953	502
954	955
960	961
960	794
960	795
963	443
964	162
964	60
969	31
979	980
979	419
979	420
985	986
985	240
991	490
994	499
994	385
995	579
998	467
999	248
999	709
1003	823
1011	41
1012	576
1012	137
1012	1013
1023	490
1023	758
1023	757
1023	841
1028	266
1028	238
1028	323
1032	642
1041	569
1041	571
1044	111
1044	540
1045	754
1047	834
1047	37
1047	1048
1047	527
1047	70
1047	980
1049	467
1064	205
1064	482
1069	533
1072	685
1073	1036
1073	1074
1076	685
1077	573
1077	574
1077	691
1078	1079
1080	579
1081	275
1081	183
1081	302
1081	197
1083	127
1091	942
1105	699
1113	298
1122	360
1123	37
1123	133
1123	527
1126	9
1131	230
1131	231
1134	374
1134	517
1134	515
1134	497
1144	45
1144	373
1144	745
1144	430
1145	1146
1153	27
1153	787
1162	300
1162	597
1162	299
1165	871
1170	1171
1177	255
1182	753
1183	391
1189	1171
1196	684
1200	1201
1209	515
1209	517
1210	66
1210	68
1217	248
1218	631
1220	1146
1223	708
1223	1111
1223	665
1223	817
1223	1020
1223	1212
1224	286
1225	773
1225	776
1228	163
1228	1229
1228	1230
1231	570
1232	365
1233	460
1234	14
1234	693
1234	619
1243	443
1249	133
1250	370
1252	373
1256	460
1262	752
1263	393
1264	513
1265	619
1265	909
1265	693
1266	378
1266	850
1266	129
1266	20
1266	292
1266	849
1273	464
1276	228
1276	986
1282	217
1282	639
1282	1283
1282	592
1282	246
1282	721
1284	839
1284	33
1284	633
1287	487
1291	76
1292	262
1294	920
1294	21
1297	482
1304	1247
1304	253
1304	459
1304	81
1304	313
1307	980
1313	526
1326	271
1332	695
1334	127
1338	118
1340	1139
1341	74
1341	10
1341	839
1341	450
1341	448
1345	240
1348	136
1348	460
1357	680
1360	623
1360	104
1360	105
1362	901
1363	961
1363	673
1363	318
1366	1119
1369	902
1369	934
1369	55
1369	0
1371	90
1372	544
1372	775
1372	545
1373	651
1384	881
1385	230
1385	231
1388	832
1388	1389
1390	477
1392	1393
1392	224
1396	48
1397	832
1397	1389
1399	629
1401	190
1401	554
1404	190
1404	554
1408	1201
1410	669
1410	249
1411	3
1411	421
1411	545
1411	338
1411	544
1412	1060
1415	1013
1416	340
1419	612
1422	454
1425	427
1426	1114
1426	857
1428	806
1428	637
1429	955
1430	209
1430	347
1430	769
1439	986
1441	295
1442	341
1443	709
1444	513
1452	55
1452	0
1457	1181
1458	901
1459	87
1459	1025
1466	621
1467	487
1468	330
1469	1119
1472	404
1473	619
1473	693
1473	866
1473	148
1473	67
1476	695
1480	286
1480	609
1480	319
1480	608
1484	533
1486	1487
1486	438
1486	427
1486	861
1488	614
1491	834
1491	1048
1493	573
1493	574
1493	861
1499	749
1499	750
1499	1061
1503	725
1504	386
1509	3
1509	421
1512	131
1513	981
1517	1199
1521	673
1521	318
1522	370
1525	1500
1526	41
1527	1247
1528	243
1529	370
1532	738
1533	576
1533	137
1537	725
1542	70
1550	97
1550	221
1552	319
1559	562
1566	631
1570	187
1574	1575
1579	1580
1579	269
1579	270
1581	881
1583	224
1588	934
1590	83
1590	364
1590	84
1592	669
1592	249
1596	58
1598	955
1599	519
1604	136
1609	646
1609	91
1612	531
1613	1614
1618	39
1619	79
1620	97
1620	221
1621	163
1621	902
1621	1230
1624	167
1625	436
1632	477
1636	1051
1637	1060
1638	1129
1638	787
1638	14
1638	1639
1638	27
1642	721
1642	259
1642	639
1643	612
1648	186
1648	188
1652	1139
1653	1543
1653	1167
1654	282
1654	647
1655	1061
1659	920
1659	21
1659	717
1660	533
1660	981
1661	1229
1661	476
1665	314
1665	214
1665	215
1667	902
1670	597
1672	1051
1673	592
1673	217
1676	1114
1676	857
1678	1199
1679	425
1679	287
1679	621
1679	212
1685	87
1685	1025
1689	43
1690	205
1691	219
1695	495
1698	933
1699	452
1703	823
1703	170
1703	397
1703	1387
1703	271
1706	646
1712	495
1713	43
1714	275
1714	183
1714	667
1721	1393
1723	725
1727	194
1727	1331
1727	1245
1727	99
1730	181
1730	307
1730	170
1733	1090
1736	378
1739	356
1742	832
1742	1389
1742	196
1750	937
1752	941
1752	898
1752	1290
1755	737
1758	249
1758	819
1758	885
1758	669
1758	259
1759	397
1759	499
1759	1387
1762	39
1764	482
1767	1543
1767	1167
1767	196
1769	1171
1771	430
1772	228
1772	937
1776	1283
1777	277
1780	365
1781	584
1781	434
1782	418
1783	1500
1785	224
1786	436
1786	99
1788	1087
1788	109
1788	391
1788	281
1790	629
1791	355
1793	179
1794	228
1797	107
1802	1061
1805	1129
1805	1639
1807	212
1809	614
1812	60
1812	352
1812	162
1812	101
1812	589
1812	717
1813	45
1813	745
1815	1079
1815	667
1817	757
1817	492
1817	758
1818	473
1819	131
1819	1230
1819	163
1819	942
1819	1090
1821	37
1821	644
1821	527
1828	360
1829	341
1830	129
1830	20
1832	689
1832	567
1832	774
1835	584
1835	434
1839	190
1839	408
1839	144
1839	554
1839	464
1840	356
1841	340
1841	614
1842	941
1842	898
1842	255
1845	209
1845	846
1845	347
1846	677
1848	1580
1848	401
1848	402
1849	505
1851	1119
1853	547
1854	506
1854	308
1857	642
1858	677
1859	234
1862	774
1862	335
1862	336
1864	267
1865	1111
1867	341
1868	144
1868	408
1871	454
1875	817
1875	623
1875	708
1878	523
1882	364
1883	1051
1884	148
1884	866
1885	448
1885	589
1885	450
1887	699
1888	349
1888	127
1889	497
1894	330
1896	467
1896	1181
1898	323
1899	319
1900	691
1902	1146
1903	1487
1903	563
1903	438
1904	277
1906	425
1906	287
1907	531
1908	150
1908	151
1911	1087
1911	109
1912	1181
1913	386
1913	313
1916	680
1918	459
1920	385
1921	1575
1924	16
1924	1095
1924	583
1926	373
1927	281
1929	1242
1930	737
1932	52
1932	563
1932	25
1936	629
1936	116
1938	1290
1939	90
1941	240
1943	1111
1943	794
1943	795
1945	1060
1947	594
1947	473
1950	506
1954	270
1954	1167
1954	1543
1954	269
1954	196
1955	152
1955	652
1957	934
1960	87
1960	1025
1962	657
1962	536
1962	1013
1963	861
1964	562
1965	526
1968	209
1968	621
1968	347
1971	749
1971	750
1973	492
1975	1500
1976	885
1976	819
1977	1580
1978	685
1981	300
1981	1247
1981	299
1983	1212
1985	1487
1985	549
1985	438
1988	721
1988	570
1988	639
1989	775
1991	262
1991	85
1992	97
1992	221
1992	219
1993	62
1993	429
1996	449
1996	920
1996	21
1997	901
1998	1036
1998	1038
1998	1074
1999	18
2000	691
2002	1245
2002	99
2003	95
2005	383
2007	1242
2009	419
2009	420
2009	62
2009	429
2010	738
2013	881
2014	569
2014	571
2016	657
2016	1114
2016	536
2016	857
2018	16
2018	1095
2021	255
2025	765
2025	262
2025	85
2027	526
2029	397
2029	1387
2031	665
2031	1020
2034	765
2037	277
2038	676
2039	16
2039	33
2039	1095
2039	633
2039	583
2043	1245
2044	516
2047	454
2048	871
2048	1290
2049	194
2049	1331
2053	1614
2058	159
2058	933
2060	1614
2061	243
2062	179
2063	27
2063	364
2063	787
2064	314
2066	476
2068	981
2069	194
2069	1331
2069	473
2070	502
2070	18
2071	1038
2072	142
2072	133
2072	141
2072	806
2072	637
2073	1139
\.



COPY papers (id, title) FROM stdin;
942	kerneling napoleons rifer splinting surmisers satisfying undamped
684	rhythmical wastebaskets powderer immigrates inserter
691	conditione loathly cancels debiting parrots paraguayans resonates overbites
1575	nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular
787	exorcises pirog desexes summable
633	sandwiching bewitchment cheaters riffled kerneling
637	prat islanded burlily thanklessly swiveled polers oinked
66	pirog desexes summable heliocentricity
745	loggias reconciliating photocatalyst lenity tautological jambing
832	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity
592	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
349	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed
544	toto teashop reaccepts gunneries exorcises pirog
901	immediately canzona interrelated cooked
753	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts
39	blungers dwarflike effulgences coreless
955	reducing nethermost nonfiction retrogressions eliminates
1639	toto teashop reaccepts gunneries exorcises
1230	funnyman commuted lachrymation floweret arcadian acridities unrealistic
689	reoccupations embossers cerebrum gloves mohairs admiralties
920	excretions recelebrating dually plateauing
693	burlily thanklessly swiveled polers oinked apnea maxillary
885	gloves mohairs admiralties bewigged playgoers cheques batting waspishly
167	fobbed transcribed swifters redigesting ostinato recalculation
774	desexes summable heliocentricity excretions recelebrating dually plateauing
116	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria
62	heliocentricity excretions recelebrating dually plateauing reoccupations embossers
318	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins
20	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer
817	desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers
941	cheaters riffled kerneling napoleons
221	ponderers conditione loathly cancels debiting parrots paraguayans resonates
608	photocatalyst lenity tautological jambing sodality
277	perspicuously disjoined nigglings midmonths labium peeped daydreams permuting
644	cerebrum gloves mohairs admiralties bewigged playgoers
1090	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
651	objurgate treaties preprocessor despising
1060	mongoloids danker raunchiness perspicuously disjoined
190	gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol
434	equalled sandwiching bewitchment cheaters
131	forbearer anesthetization undermentioned outflanking funnyman
150	gantleted richer succories dwelling scrapped prat islanded burlily
849	batting waspishly stilbestrol villainousness miscalling
385	preheats loggias reconciliating photocatalyst lenity tautological
647	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites
757	lachrymation floweret arcadian acridities unrealistic substituting
347	householder overeducated objurgate treaties
749	loathly cancels debiting parrots paraguayans resonates overbites
570	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
246	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching
323	extradites stollens ponderers conditione loathly
286	paraguayans resonates overbites terminals giros podgy vagus kinkiest xix
95	transcribed swifters redigesting ostinato recalculation safest
1139	bedstraws thoughtless elation swampland earings circumscribed paralyzingly
236	splinting surmisers satisfying undamped sharpers forbearer
1245	arcadian acridities unrealistic substituting surges preheats loggias
502	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites
52	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens
464	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters
1580	summable heliocentricity excretions recelebrating
567	dumpers bering evasiveness toto
499	outcrop slipcases phenylketonuria grunts
404	environs hulled preexamination oralogy tibetans
513	canzona interrelated cooked reformers goodwife technicolor plenishes nippy
170	funnyman commuted lachrymation floweret arcadian
612	attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments
646	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts
420	plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged
60	miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling
652	gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating
402	evasiveness toto teashop reaccepts gunneries exorcises
669	plateauing reoccupations embossers cerebrum gloves mohairs admiralties
419	maxillary dumpers bering evasiveness
685	nigglings midmonths labium peeped daydreams permuting immediately canzona
90	treaties preprocessor despising loftily yabber reprovingly blungers dwarflike
709	inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction
717	admiralties bewigged playgoers cheques
738	zanier corkscrewed promiscuousness clewed
183	forbearer anesthetization undermentioned outflanking funnyman
87	dually plateauing reoccupations embossers
74	stilbestrol villainousness miscalling firefanged skeins
765	dwelling scrapped prat islanded burlily
448	plateauing reoccupations embossers cerebrum gloves mohairs
194	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned
179	dissociated heartier petitionee brill
238	paraguayans resonates overbites terminals giros
67	bering evasiveness toto teashop reaccepts
823	arcadian acridities unrealistic substituting surges preheats
127	environs hulled preexamination oralogy tibetans slavishly hipless
834	desexes summable heliocentricity excretions recelebrating
105	bewigged playgoers cheques batting waspishly stilbestrol
857	cheaters riffled kerneling napoleons rifer splinting surmisers
269	reaccepts gunneries exorcises pirog desexes summable heliocentricity
871	outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic
148	dwelling scrapped prat islanded burlily
55	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons
109	valiantly unremorsefully extradites stollens ponderers conditione
311	surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality
364	excretions recelebrating dually plateauing
14	swiveled polers oinked apnea maxillary
292	sandwiching bewitchment cheaters riffled kerneling napoleons rifer
902	lachrymation floweret arcadian acridities unrealistic
505	giros podgy vagus kinkiest xix recollected householder overeducated
248	junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids
215	firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling
934	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation
937	decentralizing hogfishes gantleted richer succories dwelling
436	substituting surges preheats loggias
181	undermentioned outflanking funnyman commuted
574	vagus kinkiest xix recollected householder overeducated objurgate treaties
425	extradites stollens ponderers conditione loathly
449	riffled kerneling napoleons rifer splinting surmisers
839	gloves mohairs admiralties bewigged playgoers cheques batting
391	ponderers conditione loathly cancels debiting parrots paraguayans
981	outpoured dissociated heartier petitionee
370	desecrated tetrachlorides loutish polygony malines
31	alkalin succulently marquise underlaid neurosurgeon innervated
297	lachrymation floweret arcadian acridities unrealistic
452	jambing sodality outcrop slipcases phenylketonuria grunts
270	admiralties bewigged playgoers cheques batting
418	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity
1025	apnea maxillary dumpers bering evasiveness toto teashop reaccepts
597	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases
1038	reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination
676	disjoined nigglings midmonths labium peeped daydreams
1051	isolators reducing nethermost nonfiction
298	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation
487	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan
1061	resonates overbites terminals giros
680	loggias reconciliating photocatalyst lenity tautological jambing sodality
142	heliocentricity excretions recelebrating dually plateauing reoccupations
639	kerneling napoleons rifer splinting surmisers satisfying undamped
1048	burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering
307	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers
104	gunneries exorcises pirog desexes
187	terminals giros podgy vagus
1114	gloves mohairs admiralties bewigged playgoers
1119	intermuscular fobbed transcribed swifters redigesting
1013	villainousness miscalling firefanged skeins
523	technicolor plenishes nippy bounden occulters blubberer
547	slipcases phenylketonuria grunts venturers valiantly
79	hulled preexamination oralogy tibetans slavishly hipless
677	mongoloids danker raunchiness perspicuously disjoined nigglings midmonths
795	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment
866	reaccepts gunneries exorcises pirog desexes summable heliocentricity
253	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst
1167	bering evasiveness toto teashop reaccepts
401	cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
214	dually plateauing reoccupations embossers cerebrum gloves
37	oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts
41	raunchiness perspicuously disjoined nigglings midmonths labium peeped
657	playgoers cheques batting waspishly
631	householder overeducated objurgate treaties preprocessor despising loftily
1171	safest signiory latchets inflecting trephines hops exec junketeers
1212	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
43	machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble
335	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties
231	waspishly stilbestrol villainousness miscalling
986	richer succories dwelling scrapped
162	recelebrating dually plateauing reoccupations embossers
300	rifer splinting surmisers satisfying undamped sharpers
188	debiting parrots paraguayans resonates
85	oinked apnea maxillary dumpers
99	funnyman commuted lachrymation floweret arcadian
159	dwarflike effulgences coreless tuberculoses environs hulled
1020	admiralties bewigged playgoers cheques batting
571	bewitchment cheaters riffled kerneling napoleons rifer
255	undermentioned outflanking funnyman commuted lachrymation floweret arcadian
83	succories dwelling scrapped prat
275	miscalling firefanged skeins equalled sandwiching bewitchment cheaters
326	grunts venturers valiantly unremorsefully extradites
1087	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity
1074	preprocessor despising loftily yabber reprovingly blungers
228	islanded burlily thanklessly swiveled
1283	miscalling firefanged skeins equalled sandwiching bewitchment
516	outflanking funnyman commuted lachrymation
212	paraguayans resonates overbites terminals giros podgy vagus
355	inflecting trephines hops exec junketeers isolators reducing nethermost
1199	surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical
1095	miscalling firefanged skeins equalled sandwiching bewitchment cheaters
1079	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
240	measles decentralizing hogfishes gantleted richer
373	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological
397	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian
629	phenylketonuria grunts venturers valiantly
438	giros podgy vagus kinkiest xix recollected householder
573	valiantly unremorsefully extradites stollens
589	sandwiching bewitchment cheaters riffled kerneling
961	reoccupations embossers cerebrum gloves mohairs admiralties
457	unremorsefully extradites stollens ponderers conditione loathly
340	bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill
526	hipless prs bluejays cuppier nonsurgical skimpiest outpoured
562	bounden occulters blubberer amenities
841	unrealistic substituting surges preheats loggias reconciliating photocatalyst
177	maladjustments subpartnership cordilleras recirculations alkalin
519	commuted lachrymation floweret arcadian
490	tautological jambing sodality outcrop slipcases
545	gloves mohairs admiralties bewigged
980	bering evasiveness toto teashop reaccepts gunneries exorcises
336	oinked apnea maxillary dumpers bering evasiveness toto
1247	surges preheats loggias reconciliating photocatalyst lenity tautological
230	summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers
846	despising loftily yabber reprovingly blungers dwarflike effulgences coreless
642	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates
1290	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned
695	inserter plights corollaries gaudiness irades inadvisability
769	debiting parrots paraguayans resonates overbites terminals giros podgy vagus
619	desexes summable heliocentricity excretions recelebrating
819	cheaters riffled kerneling napoleons rifer splinting
68	islanded burlily thanklessly swiveled polers oinked apnea maxillary
1387	photocatalyst lenity tautological jambing sodality outcrop slipcases
665	reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating
569	cerebrum gloves mohairs admiralties
1500	petitionee brill neologic intermuscular
737	cooked reformers goodwife technicolor plenishes
219	jambing sodality outcrop slipcases
443	coreless tuberculoses environs hulled preexamination
76	retrogressions eliminates unknowns mongoloids danker raunchiness
708	batting waspishly stilbestrol villainousness miscalling firefanged skeins
84	teashop reaccepts gunneries exorcises pirog desexes
898	lachrymation floweret arcadian acridities unrealistic substituting surges preheats
1543	embossers cerebrum gloves mohairs admiralties bewigged playgoers
16	recelebrating dually plateauing reoccupations embossers
141	swiveled polers oinked apnea maxillary dumpers bering evasiveness
1201	unknowns mongoloids danker raunchiness perspicuously disjoined
721	admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling
329	kinkiest xix recollected householder overeducated objurgate
1146	redigesting ostinato recalculation safest signiory latchets inflecting
196	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs
752	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites
107	emanative blowpipe varies thickest machinability orbiters tormentor owner
510	excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves
101	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching
129	admiralties bewigged playgoers cheques batting waspishly stilbestrol
495	napoleons rifer splinting surmisers
794	heliocentricity excretions recelebrating dually
81	kerneling napoleons rifer splinting surmisers
609	loathly cancels debiting parrots paraguayans resonates overbites terminals giros
186	tautological jambing sodality outcrop slipcases phenylketonuria
58	midmonths labium peeped daydreams permuting immediately canzona interrelated cooked
775	admiralties bewigged playgoers cheques batting waspishly stilbestrol
313	forbearer anesthetization undermentioned outflanking
118	loftily yabber reprovingly blungers dwarflike
1389	mohairs admiralties bewigged playgoers
217	sandwiching bewitchment cheaters riffled kerneling
360	effulgences coreless tuberculoses environs
476	anesthetization undermentioned outflanking funnyman commuted lachrymation
1129	richer succories dwelling scrapped prat islanded burlily thanklessly swiveled
515	stilbestrol villainousness miscalling firefanged skeins equalled
758	slipcases phenylketonuria grunts venturers
399	arcadian acridities unrealistic substituting surges preheats loggias
750	objurgate treaties preprocessor despising loftily
1036	debiting parrots paraguayans resonates overbites terminals giros podgy
378	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian
427	loathly cancels debiting parrots paraguayans resonates
1181	recalculation safest signiory latchets inflecting trephines hops
383	earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils
302	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned
454	unmuzzling measles decentralizing hogfishes
594	acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst
281	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers
1487	grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly
623	firefanged skeins equalled sandwiching
1111	recelebrating dually plateauing reoccupations embossers
492	grunts venturers valiantly unremorsefully extradites
295	tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest
9	oralogy tibetans slavishly hipless prs bluejays
1242	goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated
308	floweret arcadian acridities unrealistic substituting surges
243	teratoid coadjutors thuggeries nondestructive
459	funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges
699	lenity tautological jambing sodality
776	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting
909	apnea maxillary dumpers bering evasiveness toto
517	undamped sharpers forbearer anesthetization
511	polers oinked apnea maxillary dumpers bering
1229	acridities unrealistic substituting surges preheats loggias
352	desexes summable heliocentricity excretions recelebrating dually plateauing
621	objurgate treaties preprocessor despising loftily yabber reprovingly
531	latchets inflecting trephines hops exec junketeers isolators reducing
0	undermentioned outflanking funnyman commuted lachrymation floweret
3	plateauing reoccupations embossers cerebrum gloves
10	heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves
21	villainousness miscalling firefanged skeins equalled sandwiching
27	prat islanded burlily thanklessly swiveled polers
33	embossers cerebrum gloves mohairs admiralties bewigged playgoers
45	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted
48	brill neologic intermuscular fobbed transcribed
25	overbites terminals giros podgy vagus kinkiest
70	reaccepts gunneries exorcises pirog desexes summable
91	surges preheats loggias reconciliating photocatalyst lenity tautological
111	summable heliocentricity excretions recelebrating dually plateauing
122	playgoers cheques batting waspishly stilbestrol villainousness miscalling
137	riffled kerneling napoleons rifer splinting surmisers satisfying undamped
144	exorcises pirog desexes summable heliocentricity excretions recelebrating dually
152	scrapped prat islanded burlily thanklessly swiveled
163	sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers
171	extradites stollens ponderers conditione loathly cancels debiting
97	loggias reconciliating photocatalyst lenity
133	plateauing reoccupations embossers cerebrum gloves
197	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers
205	xix recollected householder overeducated objurgate treaties preprocessor despising loftily
224	nonfiction retrogressions eliminates unknowns
249	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer
234	sharpers forbearer anesthetization undermentioned
262	hogfishes gantleted richer succories dwelling scrapped prat
271	surges preheats loggias reconciliating photocatalyst
282	funnyman commuted lachrymation floweret arcadian
287	xix recollected householder overeducated objurgate treaties preprocessor despising loftily
209	ponderers conditione loathly cancels debiting parrots
259	rifer splinting surmisers satisfying undamped sharpers forbearer
314	bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling
319	grunts venturers valiantly unremorsefully
330	cancels debiting parrots paraguayans resonates overbites terminals giros
341	brill neologic intermuscular fobbed transcribed
356	malines cliffhanger entailments reindexed bedstraws thoughtless
365	neurosurgeon innervated hunts barrens emanative blowpipe varies
374	rifer splinting surmisers satisfying undamped
386	floweret arcadian acridities unrealistic substituting surges
393	sodality outcrop slipcases phenylketonuria grunts venturers valiantly
266	sodality outcrop slipcases phenylketonuria grunts venturers valiantly
408	playgoers cheques batting waspishly stilbestrol villainousness
201	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins
338	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing
421	maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises
430	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly
460	peeped daydreams permuting immediately canzona interrelated cooked
467	nonfiction retrogressions eliminates unknowns mongoloids
473	anesthetization undermentioned outflanking funnyman
477	manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds
482	giros podgy vagus kinkiest xix
506	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases
527	recelebrating dually plateauing reoccupations embossers cerebrum gloves
536	rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization
540	thanklessly swiveled polers oinked
157	exorcises pirog desexes summable heliocentricity
563	vagus kinkiest xix recollected householder
576	mohairs admiralties bewigged playgoers cheques batting
579	swifters redigesting ostinato recalculation safest signiory
497	skeins equalled sandwiching bewitchment cheaters
136	bounden occulters blubberer amenities desecrated tetrachlorides loutish
267	venturers valiantly unremorsefully extradites stollens ponderers
614	tibetans slavishly hipless prs bluejays cuppier nonsurgical
299	unrealistic substituting surges preheats
850	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman
429	swiveled polers oinked apnea maxillary
673	pirog desexes summable heliocentricity excretions recelebrating
549	recollected householder overeducated objurgate treaties preprocessor
533	recalculation safest signiory latchets inflecting trephines hops
667	bewitchment cheaters riffled kerneling napoleons rifer
1614	pasturage thurifer teazle fringier
861	extradites stollens ponderers conditione loathly cancels debiting
121	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier
754	grunts venturers valiantly unremorsefully extradites
450	skeins equalled sandwiching bewitchment
806	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing
1331	surges preheats loggias reconciliating photocatalyst
554	toto teashop reaccepts gunneries exorcises pirog desexes
584	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers
881	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill
773	bering evasiveness toto teashop reaccepts
1393	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife
18	preheats loggias reconciliating photocatalyst lenity tautological jambing sodality
933	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs
725	exec junketeers isolators reducing
583	batting waspishly stilbestrol villainousness miscalling
151	evasiveness toto teashop reaccepts
\.



COPY persons (id, nation, name) FROM stdin;
40	\N	Mirra Tygart
89	\N	Marna Crookshanks
135	\N	Lili Atoe
149	\N	Sharise Heagy
155	\N	Shahaama Berum
156	\N	Cathy Phebus
178	\N	Everardo Yidiaris
185	\N	Cady Schweizer
235	\N	Kim Colombe
268	\N	Tarran Pointer
294	\N	Tera Vigen
301	\N	Alyss Wuitschick
334	\N	Toku Synowiec
351	\N	Lilja Siwiec
354	\N	Dewayne Buttermore
359	\N	Katreen Osthoff
380	\N	Vladlena Tlumacki
390	\N	Carli Maggert
398	\N	Dondrea Crocco
417	\N	Ieshige Kosinski
442	\N	Fovro Chung
444	\N	Tydeus Dyckman
466	\N	Solymar Palisbo
496	\N	Garon Tischler
498	\N	Sam Mattheis
514	\N	Giovanna Douthit
530	\N	Torokanova Kosloski
535	\N	Immanuel Bugos
546	\N	Vasyklo Netz
560	\N	Evgnios Feasel
561	\N	Pazia Comnick
590	\N	Gerakna Ryneer
602	\N	Che Kess
603	\N	Ineng Alkbsh
606	\N	Momus Rivadeneira
617	\N	Nisus Coby
622	\N	Miles Manero
632	\N	Einian Frascella
650	\N	Este Manon
658	\N	Noburo Charleton
661	\N	Eshita Whitby
683	\N	Dele Galla
688	\N	Erminia Damrell
716	\N	Inejiro Javens
719	\N	Helene Nik
730	\N	Erechtheus Muschick
777	\N	Deverell Anez
778	\N	Rebeca Aday
796	\N	Brenda Varley
802	\N	Feli Trainham
805	\N	Octave Diana
816	\N	Aandranee Sakamaki
821	\N	Liebetraud Kiddy
845	\N	Stacie Ciesielski
856	\N	Graziana Callabrass
863	\N	Aseel Waddups
894	\N	Detana Trautz
914	\N	Clementine Barga
928	\N	Avniel Debiase
943	\N	Soshu Burress
945	\N	Brys Robak
1044	\N	Barsha Murrain
1049	\N	Caryn Grudzinski
1069	\N	Dayu Vient
1076	\N	Daris Astley
1077	\N	Gil Holben
1122	\N	Jake Bober
1123	\N	Argos Cumings
1145	\N	Yves Hunsucker
1162	\N	Maysak Anetsberger
1170	\N	Rosalinde Leinbach
1177	\N	Liska Lambourne
1189	\N	Odysseus Dilthey
1218	\N	Gabriele Darsey
1231	\N	Blanca Ursery
1233	\N	Maeko Kontogiannis
1234	\N	Dama Leino
1250	\N	Rosamar Wish
1252	\N	Mora Christofferse
1263	\N	Reiko Castile
1264	\N	Guiseppa Thurstonson
1276	\N	Pilib Seu
1284	\N	Kit Storrs
1287	\N	Liselotte Groleau
1292	\N	Korechika Mamer
1294	\N	Madaleno Bercier
1334	\N	Misty Holladay
1345	\N	Tatsukichi Gerstenberger
1357	\N	Latoya Lovato
1362	\N	Marisa Roufs
1366	\N	Maela Chamley
1373	\N	Frangiskos Truly
1384	\N	Muni Mccuiston
1388	\N	Taliyah Jafari
1390	\N	Christelle Garced
1401	\N	Makhna Stabile
1404	\N	Kellie Frenner
1410	\N	Cassian Cozzy
1415	\N	Calida Starace
1422	\N	Adamanta Schlitt
1426	\N	Gavriella Sasson
1428	\N	Gia Stonesifer
1429	\N	Gerharde Heidtbrink
1442	\N	Yoriko Boot
1444	\N	Imelde Ballin
1468	\N	Favio Mutherspaw
1472	\N	Nessa Thomison
1499	\N	Uchdryd Locicero
1503	\N	Janah Moryl
1504	\N	Takako Nordine
1513	\N	Asami Sellek
1525	\N	Xuqiu Deller
1528	\N	Faqueza Correll
1552	\N	Yaineris Francisco
1559	\N	Clariee Martucci
1570	\N	Kyledyr Constantino
1579	\N	Loke Tuton
1581	\N	Herberta Fullenwider
1583	\N	Shesha Humbird
1588	\N	Hidemichi Tropp
1592	\N	Socorro Mcsorley
1599	\N	Yae Timblin
1612	\N	Hedda Yoshida
1613	\N	Plakida Gothe
1618	\N	Giselher Nibler
1621	\N	Handy Ratajczak
1625	\N	Lucile Homola
1636	\N	Evi Heidebrecht
1642	\N	Patroklus Hertel
1653	\N	Letizia Madaras
1670	\N	Krosa Kuney
1672	\N	Iulia Morra
1676	\N	Lottchen Pillitteri
1685	\N	Taaliba Debrita
1691	\N	Kobe Guttirez
1699	\N	Luitfriede Westmark
1706	\N	Edmonda Ditullio
1712	\N	Cherry Dolence
1723	\N	Marce Fiscalini
1752	\N	Gizla Nordmark
1759	\N	Jazmine Susman
1764	\N	Miloushka Pezez
1767	\N	Angela Hager
1777	\N	Janny Mccaine
1781	\N	Datja Carner
1782	\N	Sander Garriss
1783	\N	Zeanes Hinsley
1785	\N	Krystal Farria
1790	\N	Loris Elder
1793	\N	Huaning Zwolski
1794	\N	Juriaan Schremp
1797	\N	ra Jansons
1802	\N	Graud Shuker
1830	\N	Chebi Selking
1845	\N	Hagibis Kihn
1849	\N	Silvester Yelvington
1858	\N	Ayla Moncrief
1859	\N	Aristomnis Dauber
1875	\N	Jenna Ovit
1882	\N	Vasilista Hamic
1884	\N	Melisa Patriarco
1898	\N	Francoise Rioux
1899	\N	Kakuei Blanford
1903	\N	Rico Boronat
1904	\N	Gigi Barfuss
1912	\N	Duron Dibella
1916	\N	Iravati Pizzolato
1918	\N	Jonam Steinle
1926	\N	Jamaall Rohen
1927	\N	Conchetta Cater
1938	\N	JamAan Kine
1939	\N	Zanthe Felarca
1941	\N	Amalia Krajcik
1945	\N	Cyril Croslen
1957	\N	Sigurd Mahli
1962	\N	Kristin Sandhu
1971	\N	Toshimichi Speth
1977	\N	Anbessa Gulde
1978	\N	Adolfa Leuthauser
1988	\N	Irminwin Milloy
1991	\N	Trina Sjerven
1992	\N	Tango Constable
1993	\N	Solange Alson
1997	\N	Aberthol Wilczak
1999	\N	Haimo Huesso
2000	\N	Javier Hausauer
2005	\N	Freda Freimuth
2010	\N	Benita Hatzenbuehler
2014	\N	Mikolas Sirman
2018	\N	Evamarie Coraham
2021	\N	Koshiro Augusto
2027	\N	Yakamochi Alonza
2029	\N	Lance Fernandes
2043	\N	Iasion Kirt
2044	\N	Aida Appelt
2049	\N	Mawar Camfield
2053	\N	Raktavira Danforth
2061	\N	Jada Grech
2063	\N	Dianmu Aver
2064	\N	Richild Brinius
2066	\N	Nana Stania
2068	\N	Radoste Hoefling
2069	\N	Uleia Mineah
2073	\N	Cloelia Shein
306	\N	Naglaya Tantillo
1851	\N	Nene Rhea
1864	\N	Jermaine Mandahl
1425	\N	Katyushka Gabriele
1730	\N	Shontal Sehnert
1762	\N	Razan Symons
572	\N	Tanja Lockmiller
1469	\N	Luca Dolbin
518	\N	Salamon Julien
1282	\N	Dawn Lauinger
1307	\N	Torah Giller
1228	\N	Coby Smaller
1968	\N	Nonna Laplaunt
543	\N	Olzhbeta Hasenberg
1397	\N	Doppo Kieser
103	\N	Casswallawn Scheiblich
1883	\N	Patrido Sielaff
504	\N	Tekla Gallerani
829	\N	Wira Majette
1907	\N	Ruwaid Solian
940	\N	Tyonna Sturdevant
1619	\N	Marek Mancino
1829	\N	Dukinea Zmijewski
1989	\N	Igone Rader
1491	\N	Shaka Enget
2025	\N	Prebrana Kekiwi
1654	\N	Seriozhenka Homen
1243	\N	Eber Ebinger
1906	\N	Kiyoemon Wesby
979	\N	Wava Goubeaux
1786	\N	Llyn Hardge
1256	\N	Kinaana Kodera
1805	\N	Lone Pavese
82	\N	Nik Reposa
65	\N	Alexandros Lagazo
244	\N	Petros Josefy
242	\N	Meena Riegel
714	\N	Aurelian Fealy
1080	\N	Iha Em
1771	\N	Leonora Peli
568	\N	Isha Quave
1217	\N	Gisselle Teigen
400	\N	Hilary Braddy
1182	\N	Flaco Reyome
731	\N	Juro Scogin
1371	\N	Dodie Tedford
2038	\N	Lacrasha Slavick
73	\N	Claudios Lemmert
1750	\N	Akina Jang
969	\N	Waliyya Dandrea
176	\N	Ovidio Bostrom
389	\N	Dymas Houskeeper
1865	\N	Agpios Bia
1930	\N	Honey Eidinger
1003	\N	Bhoomika Secord
1659	\N	Eligius Vanwechel
1813	\N	Atsumichi Licano
2007	\N	Sajag Traunfeld
1385	\N	Egor Braue
812	\N	Caden Failing
1698	\N	Janeka Hochhalter
1713	\N	Cipriana Wadzinski
1408	\N	Majdiyya Bonsall
1512	\N	Shoichi Mathey
218	\N	YolandaAbigail Insogna
1695	\N	Chantrelle Gruiger
1809	\N	Breonia Gierling
1733	\N	Aleydis Virgadamo
120	\N	Avigdor Puglia
643	\N	Diana Gulbranson
1517	\N	Bhadra Whidden
1815	\N	Martino Nommay
1209	\N	Effie Menzie
117	\N	Roseann Ora
1739	\N	Analeigh Sebring
1818	\N	Eskil Littledave
2070	\N	Lippio Llopis
630	\N	Ksniatintsa Fuchser
1727	\N	Augusto Kempson
1690	\N	Clmentine Engellant
1338	\N	Khynika Borwig
1012	\N	Lisandro Harpst
1769	\N	Fanaila Torain
1950	\N	Michizane Krips
1032	\N	Julika Smar
1200	\N	Sadahige Taglialatela
1689	\N	Vonda Jasmine
1604	\N	Sherry Mullennix
435	\N	Shaunene Libera
1807	\N	Sanaaa Yoneda
1652	\N	Matteo Mestre
1326	\N	Julien Triveno
2048	\N	Vyshia Waldall
843	\N	Apelino Reeber
756	\N	Lotta Francoise
1484	\N	Natasia Sliter
1488	\N	Hypnos Blank
748	\N	Pippo Nascimento
985	\N	Cecil Kochler
1045	\N	Aedd Lurye
348	\N	Yukako Klingbeil
1832	\N	Fedorav Solich
1913	\N	Brittani Gasman
1105	\N	Tarrant Alsbrooks
722	\N	Nazarova Abundis
1028	\N	Sabina Conde
1165	\N	Teriuihi Lachner
840	\N	Cleveland Navarez
1363	\N	Joey Yarboro
512	\N	Ilsegret Akerley
2060	\N	Mimi Stremmel
1126	\N	AbdulBaasid Chilvers
1458	\N	Mudri Gamero
229	\N	Jace Ruotolo
1643	\N	Garca Diers
588	\N	Dewi Rappleyea
1840	\N	Pieter Frend
1755	\N	Sameera Beazley
278	\N	Bozena Tilly
807	\N	Toyoaki Richoux
1871	\N	Barbi Denery
110	\N	Muna Lastovica
1457	\N	Alwin Roewe
864	\N	Colombe Bermea
1776	\N	Bezubaia Wiece
51	\N	Hannele Kneifl
30	\N	AbdulHaadi Castellan
1637	\N	Yoshida Volo
1596	\N	Querida Kreatsoulas
1954	\N	Bibiane Eddens
1846	\N	Walto Messman
1526	\N	Inocente Arntzen
1529	\N	Hortense Ganotisi
1878	\N	Argus Bierwirth
1443	\N	Gerald Fieselman
656	\N	Anthony Row
953	\N	Juanisha Seppi
324	\N	Elif Gameros
1078	\N	Grite Faddis
1249	\N	Heidelore Ruschmann
1624	\N	Xylina Mcnicoll
960	\N	Chasidy Hoop
848	\N	Shaqeeqa Levra
1998	\N	Maxime Higgs
1981	\N	Eileen Heick
1947	\N	Zumruda Fishman
1153	\N	Motoyasu Calligy
1885	\N	Alona Lucario
838	\N	Charlette Negron
1466	\N	Bhavin Primavera
1459	\N	Gorshedna Marone
1853	\N	Yumiko Ginther
548	\N	Fabiana Demase
1041	\N	Flaca Sodawasser
995	\N	Utathya Kreig
1996	\N	Khadija Lagerquist
847	\N	Safiyya Letchaw
998	\N	Kea Croshaw
908	\N	Eupeithes Bevens
213	\N	Warona Pelligrino
1632	\N	Aeacus Veloz
1452	\N	Cindi Ginanni
815	\N	Constantino Thielen
158	\N	Danaus Dacanay
999	\N	Ajanta Mischel
1817	\N	Tatiiana Sublett
1888	\N	Tuhfa Pedez
906	\N	Bennet Melendes
1648	\N	Deelon Sephton
1210	\N	Mitsuo Neff
1304	\N	Mazcho Stringer
534	\N	Galyn Stobie
1828	\N	Leonel Meche
1183	\N	Latrice Ghrist
2016	\N	Blossom Quero
913	\N	Erik Strothmann
559	\N	Volotkoveia Klees
1821	\N	Gennadi Schanck
2062	\N	Castalia Ryser
1081	\N	Addison Bovio
1965	\N	Llwyr Fagerstrom
1232	\N	Tsuruki Hazelrigg
1902	\N	Amir Conkling
1678	\N	Annunziata Ravi
1532	\N	Lauranne Brwon
1960	\N	Dmitreeva Ellsbury
1416	\N	Saer Dillenbeck
451	\N	Karina Eggington
1791	\N	Okichi Spradlin
1921	\N	Zeenab Lasane
1542	\N	Guido Genier
1225	\N	Oka Prock
853	\N	Kerry Navarrate
1976	\N	Gratia Flach
1291	\N	Anwar Katayama
994	\N	Editta Servoss
1857	\N	Myshka Krishnamurthy
200	\N	Riddhi Colesar
1772	\N	Fahroni Anglea
1900	\N	Finn Carboneau
1083	\N	Barbie Dubonnet
1673	\N	Tsumemasa Lloyd
1064	\N	Casandra Shire
322	\N	Reece Raburn
1533	\N	Lloyd Stallsmith
1396	\N	Alka Groshek
1527	\N	Ernst Bengtson
233	\N	Nia Drakes
494	\N	Houke Luthe
1360	\N	Coch Foulger
1667	\N	Oleka Tommasino
1392	\N	Jared Torgersen
2002	\N	Hasnaa Sietsema
1894	\N	Gayle Wingrove
921	\N	Vilena Orillion
697	\N	Radha Sloan
1223	\N	Juri Guzik
1848	\N	Lecia Baumeister
1780	\N	Ramonda Tripplett
1224	\N	Oryan Mirles
1131	\N	Shaakira Ricklefs
1113	\N	Nolan Brownle
951	\N	Kuemon Coatie
1011	\N	Rhea Platas
1983	\N	Atsumori Bloyer
1522	\N	Oles Sumaran
1975	\N	Lonce Jiron
1660	\N	Winand Poulton
1220	\N	Carevel Tardif
1399	\N	Marulia Bondura
2003	\N	Cellina Schlosser
1348	\N	Aleece Thorn
440	\N	Saalim Velasquez
1430	\N	Paloma Schnall
1521	\N	Arcadia Granade
78	\N	Takuboku Aicklen
783	\N	Jurgisr Arkins
1073	\N	Dirthe Kiewiet
887	\N	Shinji Kapler
2009	\N	Gulika Alipio
1973	\N	Malcolm Voelz
587	\N	Toyoko Colden
889	\N	Shandee Finnicum
169	\N	Shoko Moel
865	\N	Booker Spiker
252	\N	Chikafusa Koolman
1911	\N	Tadao Pentaris
1955	\N	Miranda Leinen
1590	\N	Araceli Ertel
793	\N	Anzhela Venturelli
1665	\N	Sozui Jalovel
1262	\N	Faith Neeld
1835	\N	Honami Docherty
456	\N	Fedyenka Terrasi
964	\N	Demont Escalet
328	\N	Tahlia Francisque
1929	\N	Evdxios Fageraes
991	\N	Amora Ockmond
265	\N	Aspasa Abaunza
1609	\N	Valentina Topia
1721	\N	Matashichi Butman
2037	\N	Ayushmati Appelgren
870	\N	Fajyaz Mutana
1509	\N	Jaen Kerechanko
2071	\N	Jakoba Bueche
607	\N	Dyllan Mairs
140	\N	Uqbah Oconnell
1943	\N	Gustel Pitek
1842	\N	Kallie Bednarek
2013	\N	Glafira Geng
1441	\N	Emese Abadie
8	\N	Donald Ludlow
1566	\N	Chesell Vatter
1655	\N	Gwalchmei Halbert
1372	\N	Ofelia Golde
768	\N	Tamiko Docken
1537	\N	Jascha Plantier
1985	\N	Bodil Korinta
1574	\N	Iken Siluis
1332	\N	Mercede Naslund
1550	\N	Ran Rubendall
1736	\N	Lucrecia Rollings
1419	\N	Stolpolcha Shigemi
509	\N	Rufio Guitard
2031	\N	Salaah Elio
963	\N	Nomi Rosato
1889	\N	Akila Terlizzi
1467	\N	Marlene Dague
954	\N	Janita Bolieu
1964	\N	Madelynn Hoehn
946	\N	Inez Meeroff
1887	\N	Demetria Tramonti
1896	\N	Baptist Schubert
1963	\N	Gerlind Boomershine
675	\N	Namiko Leval
1340	\N	Vrotsislava Bouman
2034	\N	Dorel Brandt
1661	\N	Mukhtaar Grewe
1273	\N	Notburg Towber
1313	\N	Primavera Huffstickler
521	\N	Tramaine Scruton
1936	\N	Lucretia Ferndez
1439	\N	Martina Mcclary
2058	\N	Abdul Spicer
106	\N	Ceanna Vangoff
1868	\N	Caddock Stagowski
1908	\N	Mya Swilley
1196	\N	Junichi Hagele
1854	\N	Zufar Pestoni
1742	\N	Lexi Faulk
1620	\N	Mamie Howen
1091	\N	Daniel Harriston
447	\N	Davida Rho
596	\N	Masafumi Gipson
1598	\N	Shontaya Klitzner
1493	\N	Athindoros Shurgot
1072	\N	Jeanine Garoner
94	\N	Stopolcha Starowicz
1867	\N	Trillare Stukel
1932	\N	Jedrick Relacion
522	\N	Ulia Kaines
1924	\N	Tienne Segraves
1412	\N	Fedoritsa Stinner
1297	\N	Urako Staker
635	\N	Maureo Benedict
485	\N	Iudita Altew
1476	\N	Lilly Rissanen
779	\N	Firdaus Casavez
2047	\N	Sela Funnye
1920	\N	Deke Mirabelli
1841	\N	Flora Aveni
1714	\N	Mikio Brunston
296	\N	Cornelius Dolak
582	\N	Adrien Hoit
645	\N	Kiraanna Scherping
751	\N	Adelio Zahner
772	\N	Timun Silverstein
1023	\N	Gota Dorff
1047	\N	Dena Mcentire
1134	\N	Prokop Limage
1144	\N	Hanka Henness
1265	\N	Lane Portes
1266	\N	LeVaughan Laity
1341	\N	Gulielma Arce
1369	\N	Dorinda Cuchiara
1411	\N	Jelawat Balletta
1473	\N	Yemena Knebel
1480	\N	Fikriyya Siddiq
1486	\N	Fokina Poythress
1638	\N	Phaethon Gearon
1679	\N	Yoyon Lecroy
1703	\N	Strezislava Weingard
1758	\N	Boje Ostrum
1788	\N	Podolphe Fluitt
1812	\N	Bia Klemme
1819	\N	Kulthum Liverance
1839	\N	Waatiq Perico
1862	\N	Ernestine Barkan
2039	\N	Takehide Gauna
2072	\N	Luzia Rahib
1729	\N	\N
455	\N	\N
1836	\N	\N
1449	\N	\N
1715	\N	\N
704	\N	\N
923	\N	\N
1147	\N	\N
734	\N	\N
922	\N	\N
1178	\N	\N
7	\N	\N
503	\N	\N
2036	\N	\N
726	\N	\N
\.



COPY place_person (person, place) FROM stdin;
\.



COPY places (id, lat, long, street, postal_code) FROM stdin;
\.



COPY platinum_supporters (id) FROM stdin;
\.



COPY program_chairs (id) FROM stdin;
103
140
229
1265
1862
2036
\.



COPY program_committee_members (id) FROM stdin;
7
103
140
200
229
455
503
504
543
582
704
726
734
838
848
922
923
1147
1178
1228
1265
1449
1452
1488
1715
1729
1786
1818
1836
1862
1913
1985
2036
\.



COPY program_committees (id, label) FROM stdin;
64	ZSWC 2015 Program Committee
712	YSWC 2014 Program Committee
804	ZSWC 2014 Program Committee
1303	XSWC 2015 Program Committee
1651	XSWC 2014 Program Committee
1745	SIGXYZ 2014 Program Committee
1418	YSWC 2015 Program Committee
\.



COPY registration_fee_person (pid, rid) FROM stdin;
\.



COPY registration_fees (id) FROM stdin;
134
379
1118
1203
1564
1879
1958
\.



COPY registration_non_members (id) FROM stdin;
\.



COPY registration_sigkdd_members (id) FROM stdin;
\.



COPY registration_sigmod_members (id) FROM stdin;
\.



COPY registration_students (id) FROM stdin;
\.



COPY reviews (id, ref, review, internal_id, text) FROM stdin;
426	427	427	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
428	429	429	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
433	434	434	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
437	438	438	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
445	360	360	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
453	454	454	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
458	459	459	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
462	460	460	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
463	464	464	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
470	352	352	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
471	355	355	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
472	473	473	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
475	476	476	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
480	449	449	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
483	482	482	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
486	487	487	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
489	490	490	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
491	492	492	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
501	502	502	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
524	270	270	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
525	526	526	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
532	533	533	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
541	540	540	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
550	336	336	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
551	418	418	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
552	236	236	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
553	554	554	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
556	295	295	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
288	287	287	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
566	567	567	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
580	579	579	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
591	592	592	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
593	594	594	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
595	562	562	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
599	267	267	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
605	597	597	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
611	612	612	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
618	619	619	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
620	621	621	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
625	31	31	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
627	121	121	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
628	629	629	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
405	266	266	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
636	637	637	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
638	639	639	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
641	642	642	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
648	60	60	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
649	517	517	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
654	652	652	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
662	402	402	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
663	402	402	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
664	665	665	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
666	667	667	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
412	201	201	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
672	673	673	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
679	680	680	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
690	691	691	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
692	693	693	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
694	695	695	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
698	699	699	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
701	499	499	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
707	708	708	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
710	709	709	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
715	349	349	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
720	721	721	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
723	545	545	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
724	725	725	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
735	253	253	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
736	737	737	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
742	183	183	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
744	745	745	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
746	87	87	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
759	676	676	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
760	18	18	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
767	765	765	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
771	547	547	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
784	37	37	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
785	39	39	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
786	787	787	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
788	43	43	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
790	549	549	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
791	194	194	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
792	544	544	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
615	614	614	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
800	238	238	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
809	67	67	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
811	76	76	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
814	81	81	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
818	819	819	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
820	531	531	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
830	307	307	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
831	832	832	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
833	116	116	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
585	497	497	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
835	834	834	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
851	105	105	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
854	129	129	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
858	857	857	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
860	861	861	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
28	27	27	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
867	631	631	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
876	162	162	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
878	167	167	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
879	151	151	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
880	881	881	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
884	885	885	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
886	311	311	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
888	866	866	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
891	364	364	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
895	196	196	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
897	898	898	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
900	901	901	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
905	583	583	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
918	228	228	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
919	920	920	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
139	137	137	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
931	141	141	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
932	933	933	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
145	144	144	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
944	107	107	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
949	275	275	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
950	277	277	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
13	14	14	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
15	16	16	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
17	18	18	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
19	20	20	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
22	21	21	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
23	21	21	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
24	25	25	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
36	37	37	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
38	39	39	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
42	43	43	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
54	55	55	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
57	58	58	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
59	60	60	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
61	62	62	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
75	76	76	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
80	81	81	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
86	87	87	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
96	97	97	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
98	99	99	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
100	101	101	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
108	109	109	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
112	111	111	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
115	116	116	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
126	127	127	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
128	129	129	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
130	131	131	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
132	133	133	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
138	137	137	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
147	148	148	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
161	162	162	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
166	167	167	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
168	151	151	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
180	181	181	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
182	183	183	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
189	190	190	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
193	194	194	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
195	196	196	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
203	105	105	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
208	209	209	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
211	212	212	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
216	217	217	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
220	221	221	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
227	228	228	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
237	238	238	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
239	240	240	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
245	246	246	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
247	248	248	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
254	255	255	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
258	259	259	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
260	234	234	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
264	262	262	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
274	275	275	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
276	277	277	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
280	281	281	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
285	286	286	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
291	292	292	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
310	311	311	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
312	313	313	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
315	314	314	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
317	318	318	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
325	326	326	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
331	330	330	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
337	338	338	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
339	340	340	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
343	341	341	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
344	302	302	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
346	347	347	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
350	159	159	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
363	364	364	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
367	365	365	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
369	370	370	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
371	83	83	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
372	373	373	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
377	378	378	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
382	383	383	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
384	385	385	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
396	397	397	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
403	404	404	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
411	52	52	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
424	425	425	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
810	67	67	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1368	573	573	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1374	589	589	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1376	689	689	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1381	186	186	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
93	91	91	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1124	1013	1013	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1386	1387	1387	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
762	74	74	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
766	765	765	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1405	329	329	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1409	775	775	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1413	794	794	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
50	48	48	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
740	738	738	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
34	33	33	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1424	84	84	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1255	300	300	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1431	774	774	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1433	757	757	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1434	1230	1230	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1001	794	794	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1435	1393	1393	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1436	980	980	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
728	717	717	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1440	1247	1247	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1446	1036	1036	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
11	10	10	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
207	205	205	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
859	857	857	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1260	188	188	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1455	495	495	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1461	1060	1060	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
702	90	90	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
868	269	269	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1470	515	515	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
836	834	834	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
164	163	163	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1267	85	85	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1475	510	510	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1479	1090	1090	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
124	122	122	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1481	68	68	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1483	758	758	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1485	608	608	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
824	823	823	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1490	1387	1387	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
172	171	171	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1494	118	118	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1495	1111	1111	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1497	569	569	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1498	569	569	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
936	934	934	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1506	1129	1129	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1508	644	644	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1511	219	219	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
153	152	152	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1514	817	817	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
797	179	179	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
273	271	271	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
904	902	902	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1519	443	443	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
71	70	70	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
283	282	282	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1318	1283	1283	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1534	1389	1389	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1538	323	323	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
251	249	249	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1541	749	749	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
910	505	505	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1295	571	571	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1547	609	609	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
755	16	16	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
972	839	839	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1549	1181	1181	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
938	937	937	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1006	297	297	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1553	1201	1201	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
225	224	224	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1555	308	308	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
872	871	871	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1557	570	570	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1560	329	329	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1344	1199	1199	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1561	849	849	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
395	393	393	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
977	391	391	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1573	399	399	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
198	197	197	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1582	647	647	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
376	374	374	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
959	574	574	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1586	510	510	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
423	421	421	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1589	651	651	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1591	1580	1580	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
982	981	981	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1352	1079	1079	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1594	750	750	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1600	1242	1242	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1601	150	150	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1602	1245	1245	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1603	495	495	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1116	1114	1114	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
357	356	356	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
947	436	436	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1323	516	516	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1407	177	177	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
529	527	527	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1040	1038	1038	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1617	9	9	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1623	1487	1487	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
320	319	319	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1097	1048	1048	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1627	850	850	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
926	215	215	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
469	467	467	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1629	511	511	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1377	961	961	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
558	157	157	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1633	95	95	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1634	1389	1389	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1456	1290	1290	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1420	519	519	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1641	623	623	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1447	230	230	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1644	217	217	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1645	170	170	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1646	684	684	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
432	430	430	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1063	1061	1061	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
478	477	477	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1008	452	452	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1382	457	457	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1098	758	758	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1657	399	399	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1658	776	776	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1121	1119	1119	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1662	750	750	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
409	408	408	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1664	66	66	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1671	909	909	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1674	1331	1331	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
601	136	136	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1026	1025	1025	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
671	669	669	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1683	513	513	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
387	386	386	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1684	1229	1229	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1402	841	841	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
565	563	563	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1688	754	754	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1693	773	773	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
113	111	111	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
956	941	941	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
957	335	335	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
965	425	425	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
967	449	449	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
970	313	313	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
973	318	318	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
974	326	326	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
978	186	186	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
92	91	91	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
761	74	74	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
987	159	159	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
261	234	234	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
993	31	31	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
996	83	83	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
997	775	775	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1002	383	383	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
49	48	48	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1004	385	385	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
739	738	738	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1010	397	397	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1014	300	300	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1015	774	774	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1018	757	757	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1019	1020	1020	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1022	418	418	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1029	427	427	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1030	597	597	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1031	434	434	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1033	438	438	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1035	1036	1036	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
206	205	205	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1042	188	188	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1043	454	454	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
316	314	314	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1054	355	355	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
674	298	298	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1056	476	476	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1059	1060	1060	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1068	515	515	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1070	502	502	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
332	330	330	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1085	142	142	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1086	1087	1087	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1089	1090	1090	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
123	122	122	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1094	1095	1095	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1096	1048	1048	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1101	295	295	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1104	236	236	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
289	287	287	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1108	567	567	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1109	118	118	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1110	1111	1111	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1115	1114	1114	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1117	1074	1074	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
935	934	934	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1128	1129	1129	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1130	562	562	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1137	547	547	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
272	271	271	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
903	902	902	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
446	360	360	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
406	266	266	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1157	795	795	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1159	573	573	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1160	517	517	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1161	323	323	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
542	540	540	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
250	249	249	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1163	866	866	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1169	1167	1167	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1172	401	401	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
413	201	201	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
971	839	839	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1179	673	673	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1180	1181	1181	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1055	298	298	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1005	297	297	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1185	589	589	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1186	41	41	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1188	308	308	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1190	695	695	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1192	699	699	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1195	499	499	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1197	631	631	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1198	1199	1199	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
484	482	482	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
394	393	393	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
976	391	391	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1205	1171	1171	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1208	545	545	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
581	579	579	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1219	980	980	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1222	745	745	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
375	374	374	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
958	574	574	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1227	335	335	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
422	421	421	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1046	676	676	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1235	231	231	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1238	584	584	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1241	1242	1242	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1244	1245	1245	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1246	1247	1247	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1251	787	787	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1254	549	549	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1257	544	544	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1258	177	177	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
616	614	614	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
528	527	527	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1039	1038	1038	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1270	819	819	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1271	531	531	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1277	850	850	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
468	467	467	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1279	832	832	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
586	497	497	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1100	307	307	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
557	157	157	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1286	1020	1020	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1289	1290	1290	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1298	861	861	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
29	27	27	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1300	684	684	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1301	646	646	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
431	430	430	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1062	1061	1061	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1308	881	881	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1310	885	885	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1311	1087	1087	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
711	709	709	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1312	776	776	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1120	1119	1119	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1315	1074	1074	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1317	66	66	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1320	898	898	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1322	901	901	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1168	1167	1167	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1330	1331	1331	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
600	136	136	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1336	920	920	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
670	669	669	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1346	219	219	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1347	1095	1095	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1350	141	141	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1351	933	933	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
146	144	144	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1355	754	754	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
564	563	563	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1356	107	107	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1359	773	773	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1142	79	79	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1150	629	629	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1364	941	941	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1365	633	633	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1694	243	243	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1143	79	79	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1133	594	594	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1084	142	142	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1450	846	846	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1696	1575	1575	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1701	633	633	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1702	1487	1487	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1187	41	41	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
537	536	536	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1708	689	689	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1052	1051	1051	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1125	1013	1013	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1717	9	9	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1102	104	104	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1718	942	942	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1724	1614	1614	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
507	506	506	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
577	576	576	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1462	769	769	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
35	33	33	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1206	1171	1171	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1735	420	420	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1539	84	84	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1501	1500	1500	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1193	657	657	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1738	955	955	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1740	806	806	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1743	1230	1230	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1744	1393	1393	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1747	909	909	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
729	717	717	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1173	401	401	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1749	511	511	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
659	299	299	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1135	523	523	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
12	10	10	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1175	214	214	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1761	753	753	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1378	961	961	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1917	95	95	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1354	240	240	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1421	519	519	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1705	623	623	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1923	246	246	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1448	230	230	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1305	255	255	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
917	248	248	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1925	170	170	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
305	259	259	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
479	477	477	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1009	452	452	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1383	457	457	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1697	281	281	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1934	286	286	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
896	292	292	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1935	347	347	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
410	408	408	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1027	1025	1025	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
415	338	338	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1391	340	340	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1687	302	302	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1138	1139	1139	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1515	1139	1139	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1953	513	513	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
263	262	262	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
388	386	386	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1751	1229	1229	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1403	841	841	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
989	370	370	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1361	373	373	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1668	378	378	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1726	243	243	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1451	846	846	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
366	365	365	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1961	404	404	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1966	52	52	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1482	68	68	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1969	464	464	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
538	536	536	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1053	1051	1051	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1974	429	429	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1103	104	104	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
342	341	341	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1732	459	459	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1754	352	352	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
474	473	473	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1984	1614	1614	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1986	612	612	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
508	506	506	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
578	576	576	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1463	769	769	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1057	487	487	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1427	490	490	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1711	492	492	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1995	420	420	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1649	646	646	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1158	795	795	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1502	1500	1500	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1194	657	657	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1017	270	270	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
2004	806	806	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1395	526	526	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2006	533	533	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
660	299	299	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1136	523	523	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1438	336	336	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2012	554	554	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1176	214	214	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
461	460	460	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2019	667	667	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1796	592	592	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
604	267	267	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1107	187	187	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
682	419	419	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1520	443	443	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2024	121	121	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1477	619	619	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1756	621	621	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1778	450	450	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2032	450	450	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1554	1201	1201	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1152	677	677	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1787	637	637	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1454	642	642	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1093	639	639	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
5	3	3	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1492	665	665	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1578	752	752	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
770	584	584	\N	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1240	986	986	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1075	680	680	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1766	691	691	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
782	448	448	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1568	1146	1146	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1823	1639	1639	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1536	708	708	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2056	725	725	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1798	349	349	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1558	721	721	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
653	652	652	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1327	583	583	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2	0	0	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
687	685	685	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
47	45	45	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1214	1212	1212	\N	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1545	1543	1543	\N	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1510	737	737	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1166	253	253	\N	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1763	942	942	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
703	90	90	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
869	269	269	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1106	187	187	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
681	419	419	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1773	1575	1575	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
165	163	163	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1268	85	85	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1151	677	677	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
4	3	3	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1789	608	608	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
825	823	823	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1236	231	231	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
173	171	171	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1577	752	752	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1239	986	986	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1801	644	644	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1803	753	753	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1804	817	817	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
798	179	179	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
154	152	152	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
781	448	448	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1810	1639	1639	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1567	1146	1146	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1816	955	955	\N	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
72	70	70	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
284	282	282	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1319	1283	1283	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1	0	0	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
686	685	685	\N	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
46	45	45	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1213	1212	1212	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1544	1543	1543	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1825	749	749	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
911	505	505	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1296	571	571	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1610	609	609	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
893	14	14	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1831	20	20	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
56	25	25	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
939	937	937	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1834	693	693	\N	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
226	224	224	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
873	871	871	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1838	570	570	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1843	849	849	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
877	55	55	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1615	58	58	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1852	62	62	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
199	197	197	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1861	647	647	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
175	97	97	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1274	99	99	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1595	101	101	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
882	109	109	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1870	651	651	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1872	1580	1580	\N	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
983	981	981	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1353	1079	1079	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
828	127	127	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1876	131	131	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1877	150	150	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
191	133	133	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
874	148	148	\N	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
358	356	356	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
948	436	436	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1324	516	516	\N	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1891	221	221	\N	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
952	181	181	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1893	190	190	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
321	319	319	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
927	215	215	\N	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
293	209	209	\N	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1329	212	212	\N	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
\.



COPY silver_supporters (id) FROM stdin;
\.



COPY speaker_document (sid, did) FROM stdin;
\.



COPY speakers (id) FROM stdin;
8
30
40
51
65
73
78
82
89
94
103
106
110
117
120
135
140
149
155
156
158
169
176
178
185
200
213
218
229
233
235
242
244
252
265
268
278
294
296
301
306
322
324
328
334
348
351
354
359
380
389
390
398
400
417
435
440
442
444
447
451
456
466
485
494
496
498
504
509
512
514
518
521
522
530
534
535
543
546
548
559
560
561
568
572
582
587
588
590
596
602
603
606
607
617
622
630
632
635
643
645
650
656
658
661
675
683
688
697
714
716
719
722
730
731
748
751
756
768
772
777
778
779
783
793
796
802
805
807
812
815
816
821
829
838
840
843
845
847
848
853
856
863
864
865
870
887
889
894
906
908
913
914
921
928
940
943
945
946
951
953
954
960
963
964
969
979
985
991
994
995
998
999
1003
1011
1012
1023
1028
1032
1041
1044
1045
1047
1049
1064
1069
1072
1073
1076
1077
1078
1080
1081
1083
1091
1105
1113
1122
1123
1126
1131
1134
1144
1145
1153
1162
1165
1170
1177
1182
1183
1189
1196
1200
1209
1210
1217
1218
1220
1223
1224
1225
1228
1231
1232
1233
1234
1243
1249
1250
1252
1256
1262
1263
1264
1265
1266
1273
1276
1282
1284
1287
1291
1292
1294
1297
1304
1307
1313
1326
1332
1334
1338
1340
1341
1345
1348
1357
1360
1362
1363
1366
1369
1371
1372
1373
1384
1385
1388
1390
1392
1396
1397
1399
1401
1404
1408
1410
1411
1412
1415
1416
1419
1422
1425
1426
1428
1429
1430
1439
1441
1442
1443
1444
1452
1457
1458
1459
1466
1467
1468
1469
1472
1473
1476
1480
1484
1486
1488
1491
1493
1499
1503
1504
1509
1512
1513
1517
1521
1522
1525
1526
1527
1528
1529
1532
1533
1537
1542
1550
1552
1559
1566
1570
1574
1579
1581
1583
1588
1590
1592
1596
1598
1599
1604
1609
1612
1613
1618
1619
1620
1621
1624
1625
1632
1636
1637
1638
1642
1643
1648
1652
1653
1654
1655
1659
1660
1661
1665
1667
1670
1672
1673
1676
1678
1679
1685
1689
1690
1691
1695
1698
1699
1703
1706
1712
1713
1714
1721
1723
1727
1730
1733
1736
1739
1742
1750
1752
1755
1758
1759
1762
1764
1767
1769
1771
1772
1776
1777
1780
1781
1782
1783
1785
1786
1788
1790
1791
1793
1794
1797
1802
1805
1807
1809
1812
1813
1815
1817
1818
1819
1821
1828
1829
1830
1832
1835
1839
1840
1841
1842
1845
1846
1848
1849
1851
1853
1854
1857
1858
1859
1862
1864
1865
1867
1868
1871
1875
1878
1882
1883
1884
1885
1887
1888
1889
1894
1896
1898
1899
1900
1902
1903
1904
1906
1907
1908
1911
1912
1913
1916
1918
1920
1921
1924
1926
1927
1929
1930
1932
1936
1938
1939
1941
1943
1945
1947
1950
1954
1955
1957
1960
1962
1963
1964
1965
1968
1971
1973
1975
1976
1977
1978
1981
1983
1985
1988
1989
1991
1992
1993
1996
1997
1998
1999
2000
2002
2003
2005
2007
2009
2010
2013
2014
2016
2018
2021
2025
2027
2029
2031
2034
2037
2038
2039
2043
2044
2047
2048
2049
2053
2058
2060
2061
2062
2063
2064
2066
2068
2069
2070
2071
2072
2073
\.



COPY sponzor_acm_sigkdd (aid, sid) FROM stdin;
\.



COPY sponzor_fees (id) FROM stdin;
743
1221
1719
1799
1826
1980
2045
\.



COPY sponzors (id, name_sponsor) FROM stdin;
\.



COPY webmasters (id) FROM stdin;
\.



ALTER TABLE ONLY acm_sigkdds
    ADD CONSTRAINT "ACM_SIGKDDPK" PRIMARY KEY (id);



ALTER TABLE ONLY abstracts
    ADD CONSTRAINT "AbstractPK" PRIMARY KEY (id);



ALTER TABLE ONLY authors
    ADD CONSTRAINT "AuthorPK" PRIMARY KEY (id);



ALTER TABLE ONLY author_papers
    ADD CONSTRAINT "Author_of_paperPK" PRIMARY KEY (id);



ALTER TABLE ONLY author_paper_students
    ADD CONSTRAINT "Author_of_paper_studentPK" PRIMARY KEY (id);



ALTER TABLE ONLY awards
    ADD CONSTRAINT "AwardPK" PRIMARY KEY (id);



ALTER TABLE ONLY best_applications_paper_as
    ADD CONSTRAINT "Best_Applications_Paper_APK" PRIMARY KEY (id);



ALTER TABLE ONLY best_paper_awards_committs
    ADD CONSTRAINT "Best_Paper_Awards_CommittPK" PRIMARY KEY (id);



ALTER TABLE ONLY best_research_paper_awards
    ADD CONSTRAINT "Best_Research_Paper_AwardPK" PRIMARY KEY (id);



ALTER TABLE ONLY best_student_paper_awards
    ADD CONSTRAINT "Best_Student_Paper_AwardPK" PRIMARY KEY (id);



ALTER TABLE ONLY best_student_paper_suppors
    ADD CONSTRAINT "Best_Student_Paper_SupporPK" PRIMARY KEY (id);



ALTER TABLE ONLY bronze_supporters
    ADD CONSTRAINT "Bronze_SupporterPK" PRIMARY KEY (id);



ALTER TABLE ONLY committees
    ADD CONSTRAINT "CommitteePK" PRIMARY KEY (id);



ALTER TABLE ONLY conferences
    ADD CONSTRAINT "ConferencePK" PRIMARY KEY (id);



ALTER TABLE ONLY conference_halls
    ADD CONSTRAINT "Conference_hallPK" PRIMARY KEY (id);



ALTER TABLE ONLY deadlines
    ADD CONSTRAINT "DeadlinePK" PRIMARY KEY (id);



ALTER TABLE ONLY deadline_abstract_submiss
    ADD CONSTRAINT "Deadline_Abstract_SubmissPK" PRIMARY KEY (id);



ALTER TABLE ONLY deadline_author_notificats
    ADD CONSTRAINT "Deadline_Author_notificatPK" PRIMARY KEY (id);



ALTER TABLE ONLY deadline_paper_submissions
    ADD CONSTRAINT "Deadline_Paper_SubmissionPK" PRIMARY KEY (id);



ALTER TABLE ONLY documents
    ADD CONSTRAINT "DocumentPK" PRIMARY KEY (id);



ALTER TABLE ONLY e_mails
    ADD CONSTRAINT "E-mailPK" PRIMARY KEY (person, value);



ALTER TABLE ONLY exhibitors
    ADD CONSTRAINT "ExhibitorPK" PRIMARY KEY (id);



ALTER TABLE ONLY fees
    ADD CONSTRAINT "FeePK" PRIMARY KEY (id);



ALTER TABLE ONLY general_chairs
    ADD CONSTRAINT "General_ChairPK" PRIMARY KEY (id);



ALTER TABLE ONLY gold_supporters
    ADD CONSTRAINT "Gold_SupporterPK" PRIMARY KEY (id);



ALTER TABLE ONLY hotels
    ADD CONSTRAINT "HotelPK" PRIMARY KEY (id);



ALTER TABLE ONLY invited_speakers
    ADD CONSTRAINT "Invited_SpeakerPK" PRIMARY KEY (id);



ALTER TABLE ONLY listeners
    ADD CONSTRAINT "ListenerPK" PRIMARY KEY (id);



ALTER TABLE ONLY main_offices
    ADD CONSTRAINT "Main_officePK" PRIMARY KEY (id);



ALTER TABLE ONLY organizators
    ADD CONSTRAINT "OrganizatorPK" PRIMARY KEY (id);



ALTER TABLE ONLY organizing_committees
    ADD CONSTRAINT "Organizing_CommitteePK" PRIMARY KEY (id);



ALTER TABLE ONLY organizing_committee_membs
    ADD CONSTRAINT "Organizing_Committee_membPK" PRIMARY KEY (id);



ALTER TABLE ONLY papers
    ADD CONSTRAINT "PaperPK" PRIMARY KEY (id);



ALTER TABLE ONLY persons
    ADD CONSTRAINT "PersonPK" PRIMARY KEY (id);



ALTER TABLE ONLY places
    ADD CONSTRAINT "PlacePK" PRIMARY KEY (id);



ALTER TABLE ONLY platinum_supporters
    ADD CONSTRAINT "Platinum_SupporterPK" PRIMARY KEY (id);



ALTER TABLE ONLY program_chairs
    ADD CONSTRAINT "Program_ChairPK" PRIMARY KEY (id);



ALTER TABLE ONLY program_committees
    ADD CONSTRAINT "Program_CommitteePK" PRIMARY KEY (id);



ALTER TABLE ONLY program_committee_members
    ADD CONSTRAINT "Program_Committee_memberPK" PRIMARY KEY (id);



ALTER TABLE ONLY registration_non_members
    ADD CONSTRAINT "Registration_Non-MemberPK" PRIMARY KEY (id);



ALTER TABLE ONLY registration_sigkdd_members
    ADD CONSTRAINT "Registration_SIGKDD_MemberPK" PRIMARY KEY (id);



ALTER TABLE ONLY registration_sigmod_members
    ADD CONSTRAINT "Registration_SIGMOD_MemberPK" PRIMARY KEY (id);



ALTER TABLE ONLY registration_students
    ADD CONSTRAINT "Registration_StudentPK" PRIMARY KEY (id);



ALTER TABLE ONLY registration_fees
    ADD CONSTRAINT "Registration_feePK" PRIMARY KEY (id);



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "ReviewPK" PRIMARY KEY (id);



ALTER TABLE ONLY silver_supporters
    ADD CONSTRAINT "Silver_SupporterPK" PRIMARY KEY (id);



ALTER TABLE ONLY speakers
    ADD CONSTRAINT "SpeakerPK" PRIMARY KEY (id);



ALTER TABLE ONLY sponzors
    ADD CONSTRAINT "SponzorPK" PRIMARY KEY (id);



ALTER TABLE ONLY sponzor_fees
    ADD CONSTRAINT "Sponzor_feePK" PRIMARY KEY (id);



ALTER TABLE ONLY webmasters
    ADD CONSTRAINT "WebmasterPK" PRIMARY KEY (id);



ALTER TABLE ONLY place_person
    ADD CONSTRAINT "can_stay_inPK" PRIMARY KEY (person, place);



ALTER TABLE ONLY author_deadline_author_notificat
    ADD CONSTRAINT "notification_untilPK" PRIMARY KEY (aid, did);



ALTER TABLE ONLY award_author
    ADD CONSTRAINT "obtainPK" PRIMARY KEY (author, award);



ALTER TABLE ONLY registration_fee_person
    ADD CONSTRAINT "payPK" PRIMARY KEY (pid, rid);



ALTER TABLE ONLY speaker_document
    ADD CONSTRAINT "presentationPK" PRIMARY KEY (sid, did);



ALTER TABLE ONLY sponzor_acm_sigkdd
    ADD CONSTRAINT "searchPK" PRIMARY KEY (aid, sid);



ALTER TABLE ONLY paper_author
    ADD CONSTRAINT "submitPK" PRIMARY KEY (aid, pid);



ALTER TABLE ONLY deadline_document
    ADD CONSTRAINT "submit_untilPK" PRIMARY KEY (document, deadline);



ALTER TABLE ONLY abstracts
    ADD CONSTRAINT "FKAbstractURI" FOREIGN KEY (id) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY authors
    ADD CONSTRAINT "FKAuthorURI" FOREIGN KEY (id) REFERENCES speakers(id) ON DELETE CASCADE;



ALTER TABLE ONLY author_papers
    ADD CONSTRAINT "FKAuthor_of_paperURI" FOREIGN KEY (id) REFERENCES authors(id) ON DELETE CASCADE;



ALTER TABLE ONLY author_paper_students
    ADD CONSTRAINT "FKAuthor_of_paper_studentURI" FOREIGN KEY (id) REFERENCES authors(id) ON DELETE CASCADE;



ALTER TABLE ONLY best_applications_paper_as
    ADD CONSTRAINT "FKBest_Applications_Paper_AURI" FOREIGN KEY (id) REFERENCES awards(id) ON DELETE CASCADE;



ALTER TABLE ONLY best_paper_awards_committs
    ADD CONSTRAINT "FKBest_Paper_Awards_Commi" FOREIGN KEY (award) REFERENCES awards(id) ON DELETE CASCADE;



ALTER TABLE ONLY best_paper_awards_committs
    ADD CONSTRAINT "FKBest_Paper_Awards_CommittURI" FOREIGN KEY (id) REFERENCES committees(id) ON DELETE CASCADE;



ALTER TABLE ONLY best_research_paper_awards
    ADD CONSTRAINT "FKBest_Research_Paper_AwardURI" FOREIGN KEY (id) REFERENCES awards(id) ON DELETE CASCADE;



ALTER TABLE ONLY best_student_paper_awards
    ADD CONSTRAINT "FKBest_Student_Paper_AwardURI" FOREIGN KEY (id) REFERENCES awards(id) ON DELETE CASCADE;



ALTER TABLE ONLY best_student_paper_suppors
    ADD CONSTRAINT "FKBest_Student_Paper_SupporURI" FOREIGN KEY (id) REFERENCES sponzors(id) ON DELETE CASCADE;



ALTER TABLE ONLY bronze_supporters
    ADD CONSTRAINT "FKBronze_SupporterURI" FOREIGN KEY (id) REFERENCES sponzors(id) ON DELETE CASCADE;



ALTER TABLE ONLY committees
    ADD CONSTRAINT "FKCommitteehasCommittee_Inv" FOREIGN KEY (ref) REFERENCES conferences(id) ON DELETE CASCADE;



ALTER TABLE ONLY committees
    ADD CONSTRAINT "FKCommitteeisCommitteeOf" FOREIGN KEY (committee) REFERENCES conferences(id) ON DELETE CASCADE;



ALTER TABLE ONLY conference_halls
    ADD CONSTRAINT "FKConference_hallURI" FOREIGN KEY (id) REFERENCES places(id) ON DELETE CASCADE;



ALTER TABLE ONLY conferences
    ADD CONSTRAINT "FKConferenceholded_by" FOREIGN KEY (holded) REFERENCES acm_sigkdds(id) ON DELETE CASCADE;



ALTER TABLE ONLY deadline_abstract_submiss
    ADD CONSTRAINT "FKDeadline_Abstract_SubmissURI" FOREIGN KEY (id) REFERENCES deadlines(id) ON DELETE CASCADE;



ALTER TABLE ONLY deadline_author_notificats
    ADD CONSTRAINT "FKDeadline_Author_notificatURI" FOREIGN KEY (id) REFERENCES deadlines(id) ON DELETE CASCADE;



ALTER TABLE ONLY deadline_paper_submissions
    ADD CONSTRAINT "FKDeadline_Paper_SubmissionURI" FOREIGN KEY (id) REFERENCES deadlines(id) ON DELETE CASCADE;



ALTER TABLE ONLY deadlines
    ADD CONSTRAINT "FKDeadlinedesigned_by" FOREIGN KEY (designed) REFERENCES acm_sigkdds(id) ON DELETE CASCADE;



ALTER TABLE ONLY e_mails
    ADD CONSTRAINT "FKE-mailPerson" FOREIGN KEY (person) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY exhibitors
    ADD CONSTRAINT "FKExhibitorURI" FOREIGN KEY (id) REFERENCES sponzors(id) ON DELETE CASCADE;



ALTER TABLE ONLY general_chairs
    ADD CONSTRAINT "FKGeneral_ChairURI" FOREIGN KEY (id) REFERENCES organizators(id) ON DELETE CASCADE;



ALTER TABLE ONLY gold_supporters
    ADD CONSTRAINT "FKGold_SupporterURI" FOREIGN KEY (id) REFERENCES sponzors(id) ON DELETE CASCADE;



ALTER TABLE ONLY hotels
    ADD CONSTRAINT "FKHotelURI" FOREIGN KEY (id) REFERENCES places(id) ON DELETE CASCADE;



ALTER TABLE ONLY invited_speakers
    ADD CONSTRAINT "FKInvited_SpeakerURI" FOREIGN KEY (id) REFERENCES speakers(id) ON DELETE CASCADE;



ALTER TABLE ONLY listeners
    ADD CONSTRAINT "FKListenerURI" FOREIGN KEY (id) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY main_offices
    ADD CONSTRAINT "FKMain_officeURI" FOREIGN KEY (id) REFERENCES places(id) ON DELETE CASCADE;



ALTER TABLE ONLY organizators
    ADD CONSTRAINT "FKOrganizatorURI" FOREIGN KEY (id) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY organizing_committees
    ADD CONSTRAINT "FKOrganizing_CommitteeURI" FOREIGN KEY (id) REFERENCES committees(id) ON DELETE CASCADE;



ALTER TABLE ONLY organizing_committee_membs
    ADD CONSTRAINT "FKOrganizing_Committee_membURI" FOREIGN KEY (id) REFERENCES organizators(id) ON DELETE CASCADE;



ALTER TABLE ONLY papers
    ADD CONSTRAINT "FKPaperURI" FOREIGN KEY (id) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY platinum_supporters
    ADD CONSTRAINT "FKPlatinum_SupporterURI" FOREIGN KEY (id) REFERENCES sponzors(id) ON DELETE CASCADE;



ALTER TABLE ONLY program_chairs
    ADD CONSTRAINT "FKProgram_ChairURI" FOREIGN KEY (id) REFERENCES organizators(id) ON DELETE CASCADE;



ALTER TABLE ONLY program_committees
    ADD CONSTRAINT "FKProgram_CommitteeURI" FOREIGN KEY (id) REFERENCES committees(id) ON DELETE CASCADE;



ALTER TABLE ONLY program_committee_members
    ADD CONSTRAINT "FKProgram_Committee_memberURI" FOREIGN KEY (id) REFERENCES organizators(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_non_members
    ADD CONSTRAINT "FKRegistration_Non-MemberURI" FOREIGN KEY (id) REFERENCES registration_fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_sigkdd_members
    ADD CONSTRAINT "FKRegistration_SIGKDD_Mem" FOREIGN KEY (id) REFERENCES registration_fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_sigmod_members
    ADD CONSTRAINT "FKRegistration_SIGMOD_Mem" FOREIGN KEY (id) REFERENCES registration_fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_students
    ADD CONSTRAINT "FKRegistration_StudentURI" FOREIGN KEY (id) REFERENCES registration_fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_fees
    ADD CONSTRAINT "FKRegistration_feeURI" FOREIGN KEY (id) REFERENCES fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "FKReviewURI" FOREIGN KEY (id) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "FKReviewhasReview_Inv" FOREIGN KEY (ref) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "FKReviewisReviewOf" FOREIGN KEY (review) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY silver_supporters
    ADD CONSTRAINT "FKSilver_SupporterURI" FOREIGN KEY (id) REFERENCES sponzors(id) ON DELETE CASCADE;



ALTER TABLE ONLY speakers
    ADD CONSTRAINT "FKSpeakerURI" FOREIGN KEY (id) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY sponzors
    ADD CONSTRAINT "FKSponzorURI" FOREIGN KEY (id) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY sponzor_fees
    ADD CONSTRAINT "FKSponzor_feeURI" FOREIGN KEY (id) REFERENCES fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY webmasters
    ADD CONSTRAINT "FKWebmasterURI" FOREIGN KEY (id) REFERENCES organizators(id) ON DELETE CASCADE;



ALTER TABLE ONLY place_person
    ADD CONSTRAINT "FKcan_stay_inPerson" FOREIGN KEY (person) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY place_person
    ADD CONSTRAINT "FKcan_stay_inPlace" FOREIGN KEY (place) REFERENCES places(id) ON DELETE CASCADE;



ALTER TABLE ONLY author_deadline_author_notificat
    ADD CONSTRAINT "FKnotification_untilAuthor" FOREIGN KEY (aid) REFERENCES authors(id) ON DELETE CASCADE;



ALTER TABLE ONLY author_deadline_author_notificat
    ADD CONSTRAINT "FKnotification_untilDeadl" FOREIGN KEY (did) REFERENCES deadline_author_notificats(id) ON DELETE CASCADE;



ALTER TABLE ONLY award_author
    ADD CONSTRAINT "FKobtainAuthor" FOREIGN KEY (author) REFERENCES authors(id) ON DELETE CASCADE;



ALTER TABLE ONLY award_author
    ADD CONSTRAINT "FKobtainAward" FOREIGN KEY (award) REFERENCES awards(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_fee_person
    ADD CONSTRAINT "FKpayPerson" FOREIGN KEY (pid) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_fee_person
    ADD CONSTRAINT "FKpayRegistration_fee" FOREIGN KEY (rid) REFERENCES registration_fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY speaker_document
    ADD CONSTRAINT "FKpresentationDocument" FOREIGN KEY (did) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY speaker_document
    ADD CONSTRAINT "FKpresentationSpeaker" FOREIGN KEY (sid) REFERENCES speakers(id) ON DELETE CASCADE;



ALTER TABLE ONLY sponzor_acm_sigkdd
    ADD CONSTRAINT "FKsearchACM_SIGKDD" FOREIGN KEY (aid) REFERENCES acm_sigkdds(id) ON DELETE CASCADE;



ALTER TABLE ONLY sponzor_acm_sigkdd
    ADD CONSTRAINT "FKsearchSponzor" FOREIGN KEY (sid) REFERENCES sponzors(id) ON DELETE CASCADE;



ALTER TABLE ONLY paper_author
    ADD CONSTRAINT "FKsubmitAuthor" FOREIGN KEY (aid) REFERENCES authors(id) ON DELETE CASCADE;



ALTER TABLE ONLY paper_author
    ADD CONSTRAINT "FKsubmitPaper" FOREIGN KEY (pid) REFERENCES papers(id) ON DELETE CASCADE;



ALTER TABLE ONLY deadline_document
    ADD CONSTRAINT "FKsubmit_untilDeadline" FOREIGN KEY (deadline) REFERENCES deadlines(id) ON DELETE CASCADE;



ALTER TABLE ONLY deadline_document
    ADD CONSTRAINT "FKsubmit_untilDocument" FOREIGN KEY (document) REFERENCES documents(id) ON DELETE CASCADE;
