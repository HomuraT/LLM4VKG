

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP SCHEMA IF EXISTS conference_structured CASCADE;
CREATE SCHEMA conference_structured;
SET search_path = conference_structured, pg_catalog;


SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE "Abstract" (
    "ID" integer NOT NULL,
    is_the_1th_part_of integer,
    has_text character varying(305),
    is_submitted_at integer
);


CREATE TABLE "Committee" (
    "ID" integer NOT NULL,
    has_a_name character varying(29),
    has_a_committee_chair integer,
    was_a_program_committee_of integer,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Conference_document" (
    "ID" integer NOT NULL,
    has_a_date_of_issue date,
    "has_a_URL" character varying(22),
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Conference_fees" (
    "ID" integer NOT NULL,
    amount character varying(3)
);


CREATE TABLE "Conference_proceedings" (
    "ID" integer NOT NULL,
    has_a_publisher integer,
    has_a_volume integer,
    has_a_name character varying(26),
    "has_an_ISBN" character varying(13)
);


CREATE TABLE "Conference_volume" (
    "ID" integer NOT NULL,
    has_a_program_committee integer,
    has_an_organizing_committ integer,
    has_a_location character varying(16),
    has_a_steering_committee integer,
    has_important_dates integer,
    has_a_name character varying(6)
);


CREATE TABLE "Important_dates" (
    "ID" integer NOT NULL,
    is_a_date_of_acceptance_a date,
    is_a_full_paper_submissio date,
    is_a_date_of_camera_ready date,
    is_an_ending_date date,
    is_a_starting_date date,
    is_an_abstract_submission date
);


CREATE TABLE "Invited_talk" (
    "ID" integer NOT NULL,
    is_given_by integer,
    has_an_abstract integer,
    is_submitted_at integer
);


CREATE TABLE "Organization" (
    "ID" integer NOT NULL,
    has_a_name character varying(199)
);


CREATE TABLE "Organizer" (
    "ID" integer NOT NULL
);


CREATE TABLE "Organizing_committee" (
    "ID" integer NOT NULL,
    was_an_organizing_committ integer
);


CREATE TABLE "Paper" (
    "ID" integer NOT NULL,
    has_an_abstract integer,
    has_a_paper_title character varying(200),
    is_submitted_at integer,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Person" (
    "ID" integer NOT NULL,
    has_the_first_name character varying(14),
    has_the_last_name character varying(13),
    has_gender character varying(1),
    "is_Conference_contributor" boolean DEFAULT false,
    "is_Contribution_co-author" boolean DEFAULT false,
    "is_Committee_member" boolean DEFAULT false,
    "is_Chair" boolean DEFAULT false,
    "is_Contribution_1th-author" boolean DEFAULT false,
    "is_Reviewer" boolean DEFAULT false,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Poster" (
    "ID" integer NOT NULL,
    has_an_abstract integer,
    is_submitted_at integer
);


CREATE TABLE "Publisher" (
    "ID" integer NOT NULL,
    has_a_name character varying(199)
);


CREATE TABLE "Review" (
    "ID" integer NOT NULL,
    reviews integer,
    has_detailed_comments character varying(191)
);


CREATE TABLE "Review_expertise" (
    "ID" integer NOT NULL,
    has_an_expertise character varying(199),
    has_a_submitted_contribut integer
);


CREATE TABLE "Review_preference" (
    "ID" integer NOT NULL,
    belongs_to_a_review_refer integer,
    has_a_degree integer,
    has_a_topic_or_a_submissi integer
);


CREATE TABLE "Steering_committee" (
    "ID" integer NOT NULL,
    was_a_steering_committee_ integer
);


CREATE TABLE "Topic" (
    "ID" integer NOT NULL,
    has_a_name character varying(199)
);


CREATE TABLE "Track" (
    "ID" integer NOT NULL,
    "has_tracks_Inv" integer,
    "has_a_track-workshop-tuto" integer,
    is_part_of_conference_vol integer,
    has_a_name character varying(199)
);


CREATE TABLE "Tutorial" (
    "ID" integer NOT NULL,
    "has_tutorials_Inv" integer,
    is_part_of_conference_vol integer,
    has_a_name character varying(199)
);


CREATE TABLE "Workshop" (
    "ID" integer NOT NULL,
    "has_a_track-workshop-tuto" integer,
    "has_workshops_Inv" integer,
    is_part_of_conference_vol integer,
    has_a_name character varying(199)
);


CREATE TABLE belongs_to_reviewers (
    "Entity" integer NOT NULL,
    "Reviewer" integer NOT NULL
);


CREATE TABLE contributes (
    "Person" integer NOT NULL,
    "Conference_document" integer NOT NULL
);


CREATE TABLE "has_a_committee_co-chair" (
    "Committee" integer NOT NULL,
    "Co-chair" integer NOT NULL
);


CREATE TABLE "has_a_track-workshop-tuto" (
    "Conference_part" integer NOT NULL,
    "Topic" integer NOT NULL
);


CREATE TABLE has_an_email (
    "Person" integer NOT NULL,
    "VALUE" character varying(43) NOT NULL
);


CREATE TABLE has_members (
    "Committee" integer NOT NULL,
    "Committee_member" integer NOT NULL
);


CREATE TABLE invited_by (
    "Reviewer1" integer NOT NULL,
    "Reviewer2" integer NOT NULL
);


COPY "Abstract" ("ID", is_the_1th_part_of, has_text, is_submitted_at) FROM stdin;
1125	377	attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	\N
1158	1159	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N
1184	647	plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged	\N
1205	1206	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	\N
1212	748	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	\N
1233	265	summable heliocentricity excretions recelebrating summable heliocentricity excretions recelebrating summable heliocentricity excretions recelebrating	\N
1234	512	recollected householder overeducated objurgate treaties preprocessor recollected householder overeducated objurgate treaties preprocessor recollected householder overeducated objurgate treaties preprocessor	\N
1241	1242	dumpers bering evasiveness toto dumpers bering evasiveness toto dumpers bering evasiveness toto	\N
1244	1245	recalculation safest signiory latchets inflecting trephines hops recalculation safest signiory latchets inflecting trephines hops recalculation safest signiory latchets inflecting trephines hops	\N
1249	485	bewitchment cheaters riffled kerneling napoleons rifer bewitchment cheaters riffled kerneling napoleons rifer bewitchment cheaters riffled kerneling napoleons rifer	\N
1252	565	pasturage thurifer teazle fringier pasturage thurifer teazle fringier pasturage thurifer teazle fringier	\N
1263	873	extradites stollens ponderers conditione loathly cancels debiting extradites stollens ponderers conditione loathly cancels debiting extradites stollens ponderers conditione loathly cancels debiting	\N
897	813	cheaters riffled kerneling napoleons cheaters riffled kerneling napoleons cheaters riffled kerneling napoleons	\N
1872	495	vagus kinkiest xix recollected householder vagus kinkiest xix recollected householder vagus kinkiest xix recollected householder	\N
2182	2108	cerebrum gloves mohairs admiralties cerebrum gloves mohairs admiralties cerebrum gloves mohairs admiralties	\N
1279	388	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier	\N
1287	1288	grunts venturers valiantly unremorsefully extradites grunts venturers valiantly unremorsefully extradites grunts venturers valiantly unremorsefully extradites	\N
1301	1302	skeins equalled sandwiching bewitchment skeins equalled sandwiching bewitchment skeins equalled sandwiching bewitchment	\N
1308	1145	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	\N
1319	1267	surges preheats loggias reconciliating photocatalyst surges preheats loggias reconciliating photocatalyst surges preheats loggias reconciliating photocatalyst	\N
183	179	swiveled polers oinked apnea maxillary swiveled polers oinked apnea maxillary swiveled polers oinked apnea maxillary	\N
1351	913	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N
212	208	pirog desexes summable heliocentricity excretions recelebrating pirog desexes summable heliocentricity excretions recelebrating pirog desexes summable heliocentricity excretions recelebrating	\N
1365	1366	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	\N
1367	716	preheats loggias reconciliating photocatalyst lenity tautological jambing sodality preheats loggias reconciliating photocatalyst lenity tautological jambing sodality preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	\N
1380	1025	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	\N
1390	543	exec junketeers isolators reducing exec junketeers isolators reducing exec junketeers isolators reducing	\N
1406	319	batting waspishly stilbestrol villainousness miscalling batting waspishly stilbestrol villainousness miscalling batting waspishly stilbestrol villainousness miscalling	\N
1412	904	evasiveness toto teashop reaccepts evasiveness toto teashop reaccepts evasiveness toto teashop reaccepts	\N
1417	1418	undermentioned outflanking funnyman commuted lachrymation floweret undermentioned outflanking funnyman commuted lachrymation floweret undermentioned outflanking funnyman commuted lachrymation floweret	\N
1421	417	plateauing reoccupations embossers cerebrum gloves plateauing reoccupations embossers cerebrum gloves plateauing reoccupations embossers cerebrum gloves	\N
1442	156	villainousness miscalling firefanged skeins equalled sandwiching villainousness miscalling firefanged skeins equalled sandwiching villainousness miscalling firefanged skeins equalled sandwiching	\N
402	397	toto teashop reaccepts gunneries exorcises pirog desexes toto teashop reaccepts gunneries exorcises pirog desexes toto teashop reaccepts gunneries exorcises pirog desexes	\N
445	316	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers	\N
472	469	bering evasiveness toto teashop reaccepts bering evasiveness toto teashop reaccepts bering evasiveness toto teashop reaccepts	\N
17	16	dwelling scrapped prat islanded burlily dwelling scrapped prat islanded burlily dwelling scrapped prat islanded burlily	\N
1471	835	brill neologic intermuscular fobbed transcribed brill neologic intermuscular fobbed transcribed brill neologic intermuscular fobbed transcribed	\N
1474	747	overbites terminals giros podgy vagus kinkiest overbites terminals giros podgy vagus kinkiest overbites terminals giros podgy vagus kinkiest	\N
1487	624	reaccepts gunneries exorcises pirog desexes summable reaccepts gunneries exorcises pirog desexes summable reaccepts gunneries exorcises pirog desexes summable	\N
1507	612	surges preheats loggias reconciliating photocatalyst lenity tautological surges preheats loggias reconciliating photocatalyst lenity tautological surges preheats loggias reconciliating photocatalyst lenity tautological	\N
1419	375	evasiveness toto teashop reaccepts gunneries exorcises evasiveness toto teashop reaccepts gunneries exorcises evasiveness toto teashop reaccepts gunneries exorcises	\N
1521	11	summable heliocentricity excretions recelebrating dually plateauing summable heliocentricity excretions recelebrating dually plateauing summable heliocentricity excretions recelebrating dually plateauing	\N
1530	1342	playgoers cheques batting waspishly stilbestrol villainousness miscalling playgoers cheques batting waspishly stilbestrol villainousness miscalling playgoers cheques batting waspishly stilbestrol villainousness miscalling	\N
1540	1002	riffled kerneling napoleons rifer splinting surmisers satisfying undamped riffled kerneling napoleons rifer splinting surmisers satisfying undamped riffled kerneling napoleons rifer splinting surmisers satisfying undamped	\N
661	658	heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	\N
679	674	prat islanded burlily thanklessly swiveled polers prat islanded burlily thanklessly swiveled polers prat islanded burlily thanklessly swiveled polers	\N
221	218	decentralizing hogfishes gantleted richer succories dwelling decentralizing hogfishes gantleted richer succories dwelling decentralizing hogfishes gantleted richer succories dwelling	\N
706	705	embossers cerebrum gloves mohairs admiralties bewigged playgoers embossers cerebrum gloves mohairs admiralties bewigged playgoers embossers cerebrum gloves mohairs admiralties bewigged playgoers	\N
1569	47	extradites stollens ponderers conditione loathly cancels debiting extradites stollens ponderers conditione loathly cancels debiting extradites stollens ponderers conditione loathly cancels debiting	\N
733	136	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	\N
1579	583	plateauing reoccupations embossers cerebrum gloves plateauing reoccupations embossers cerebrum gloves plateauing reoccupations embossers cerebrum gloves	\N
1586	622	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers kerneling napoleons rifer splinting surmisers satisfying undamped sharpers kerneling napoleons rifer splinting surmisers satisfying undamped sharpers	\N
1601	52	xix recollected householder overeducated objurgate treaties preprocessor despising loftily xix recollected householder overeducated objurgate treaties preprocessor despising loftily xix recollected householder overeducated objurgate treaties preprocessor despising loftily	\N
1609	599	nonfiction retrogressions eliminates unknowns nonfiction retrogressions eliminates unknowns nonfiction retrogressions eliminates unknowns	\N
1627	1440	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	\N
1636	1137	sharpers forbearer anesthetization undermentioned sharpers forbearer anesthetization undermentioned sharpers forbearer anesthetization undermentioned	\N
1657	900	surges preheats loggias reconciliating photocatalyst surges preheats loggias reconciliating photocatalyst surges preheats loggias reconciliating photocatalyst	\N
840	839	exorcises pirog desexes summable heliocentricity excretions recelebrating dually exorcises pirog desexes summable heliocentricity excretions recelebrating dually exorcises pirog desexes summable heliocentricity excretions recelebrating dually	\N
856	853	sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers	\N
1683	278	xix recollected householder overeducated objurgate treaties preprocessor despising loftily xix recollected householder overeducated objurgate treaties preprocessor despising loftily xix recollected householder overeducated objurgate treaties preprocessor despising loftily	\N
881	880	loggias reconciliating photocatalyst lenity loggias reconciliating photocatalyst lenity loggias reconciliating photocatalyst lenity	\N
1703	1704	rifer splinting surmisers satisfying undamped sharpers forbearer rifer splinting surmisers satisfying undamped sharpers forbearer rifer splinting surmisers satisfying undamped sharpers forbearer	\N
1709	347	grunts venturers valiantly unremorsefully grunts venturers valiantly unremorsefully grunts venturers valiantly unremorsefully	\N
1710	175	cancels debiting parrots paraguayans resonates overbites terminals giros cancels debiting parrots paraguayans resonates overbites terminals giros cancels debiting parrots paraguayans resonates overbites terminals giros	\N
1723	65	brill neologic intermuscular fobbed transcribed brill neologic intermuscular fobbed transcribed brill neologic intermuscular fobbed transcribed	\N
1733	188	malines cliffhanger entailments reindexed bedstraws thoughtless malines cliffhanger entailments reindexed bedstraws thoughtless malines cliffhanger entailments reindexed bedstraws thoughtless	\N
1741	610	neurosurgeon innervated hunts barrens emanative blowpipe varies neurosurgeon innervated hunts barrens emanative blowpipe varies neurosurgeon innervated hunts barrens emanative blowpipe varies	\N
1743	1537	rifer splinting surmisers satisfying undamped rifer splinting surmisers satisfying undamped rifer splinting surmisers satisfying undamped	\N
1748	1344	floweret arcadian acridities unrealistic substituting surges floweret arcadian acridities unrealistic substituting surges floweret arcadian acridities unrealistic substituting surges	\N
1760	1502	sodality outcrop slipcases phenylketonuria grunts venturers valiantly sodality outcrop slipcases phenylketonuria grunts venturers valiantly sodality outcrop slipcases phenylketonuria grunts venturers valiantly	\N
1777	1778	playgoers cheques batting waspishly stilbestrol villainousness playgoers cheques batting waspishly stilbestrol villainousness playgoers cheques batting waspishly stilbestrol villainousness	\N
1022	937	funnyman commuted lachrymation floweret arcadian funnyman commuted lachrymation floweret arcadian funnyman commuted lachrymation floweret arcadian	\N
1786	503	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	\N
1047	215	ponderers conditione loathly cancels debiting parrots ponderers conditione loathly cancels debiting parrots ponderers conditione loathly cancels debiting parrots	\N
24	25	recelebrating dually plateauing reoccupations embossers recelebrating dually plateauing reoccupations embossers recelebrating dually plateauing reoccupations embossers	\N
29	30	objurgate treaties preprocessor despising loftily yabber reprovingly objurgate treaties preprocessor despising loftily yabber reprovingly objurgate treaties preprocessor despising loftily yabber reprovingly	\N
45	15	latchets inflecting trephines hops exec junketeers isolators reducing latchets inflecting trephines hops exec junketeers isolators reducing latchets inflecting trephines hops exec junketeers isolators reducing	\N
49	50	kerneling napoleons rifer splinting surmisers satisfying undamped kerneling napoleons rifer splinting surmisers satisfying undamped kerneling napoleons rifer splinting surmisers satisfying undamped	\N
60	61	rhythmical wastebaskets powderer immigrates inserter rhythmical wastebaskets powderer immigrates inserter rhythmical wastebaskets powderer immigrates inserter	\N
76	77	conditione loathly cancels debiting parrots paraguayans resonates overbites conditione loathly cancels debiting parrots paraguayans resonates overbites conditione loathly cancels debiting parrots paraguayans resonates overbites	\N
114	75	nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular	\N
150	151	exorcises pirog desexes summable exorcises pirog desexes summable exorcises pirog desexes summable	\N
177	178	sandwiching bewitchment cheaters riffled kerneling sandwiching bewitchment cheaters riffled kerneling sandwiching bewitchment cheaters riffled kerneling	\N
192	193	pirog desexes summable heliocentricity pirog desexes summable heliocentricity pirog desexes summable heliocentricity	\N
207	139	loggias reconciliating photocatalyst lenity tautological jambing loggias reconciliating photocatalyst lenity tautological jambing loggias reconciliating photocatalyst lenity tautological jambing	\N
225	226	apnea maxillary dumpers bering evasiveness toto apnea maxillary dumpers bering evasiveness toto apnea maxillary dumpers bering evasiveness toto	\N
241	242	polers oinked apnea maxillary dumpers bering polers oinked apnea maxillary dumpers bering polers oinked apnea maxillary dumpers bering	\N
249	250	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	\N
259	260	desexes summable heliocentricity excretions recelebrating dually plateauing desexes summable heliocentricity excretions recelebrating dually plateauing desexes summable heliocentricity excretions recelebrating dually plateauing	\N
280	281	immediately canzona interrelated cooked immediately canzona interrelated cooked immediately canzona interrelated cooked	\N
285	286	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N
328	329	blungers dwarflike effulgences coreless blungers dwarflike effulgences coreless blungers dwarflike effulgences coreless	\N
361	362	reducing nethermost nonfiction retrogressions eliminates reducing nethermost nonfiction retrogressions eliminates reducing nethermost nonfiction retrogressions eliminates	\N
393	394	toto teashop reaccepts gunneries exorcises toto teashop reaccepts gunneries exorcises toto teashop reaccepts gunneries exorcises	\N
395	396	funnyman commuted lachrymation floweret arcadian acridities unrealistic funnyman commuted lachrymation floweret arcadian acridities unrealistic funnyman commuted lachrymation floweret arcadian acridities unrealistic	\N
418	419	reoccupations embossers cerebrum gloves mohairs admiralties reoccupations embossers cerebrum gloves mohairs admiralties reoccupations embossers cerebrum gloves mohairs admiralties	\N
439	440	prat islanded burlily thanklessly swiveled polers oinked prat islanded burlily thanklessly swiveled polers oinked prat islanded burlily thanklessly swiveled polers oinked	\N
461	462	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	\N
500	501	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N
520	521	toto teashop reaccepts gunneries exorcises pirog toto teashop reaccepts gunneries exorcises pirog toto teashop reaccepts gunneries exorcises pirog	\N
536	537	scrapped prat islanded burlily thanklessly swiveled scrapped prat islanded burlily thanklessly swiveled scrapped prat islanded burlily thanklessly swiveled	\N
540	541	fobbed transcribed swifters redigesting ostinato recalculation fobbed transcribed swifters redigesting ostinato recalculation fobbed transcribed swifters redigesting ostinato recalculation	\N
574	404	desexes summable heliocentricity excretions recelebrating dually plateauing desexes summable heliocentricity excretions recelebrating dually plateauing desexes summable heliocentricity excretions recelebrating dually plateauing	\N
590	591	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria	\N
646	569	heliocentricity excretions recelebrating dually plateauing reoccupations embossers heliocentricity excretions recelebrating dually plateauing reoccupations embossers heliocentricity excretions recelebrating dually plateauing reoccupations embossers	\N
668	467	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	\N
680	681	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N
693	157	excretions recelebrating dually plateauing excretions recelebrating dually plateauing excretions recelebrating dually plateauing	\N
730	731	burlily thanklessly swiveled polers oinked apnea maxillary burlily thanklessly swiveled polers oinked apnea maxillary burlily thanklessly swiveled polers oinked apnea maxillary	\N
738	551	hogfishes gantleted richer succories dwelling scrapped prat hogfishes gantleted richer succories dwelling scrapped prat hogfishes gantleted richer succories dwelling scrapped prat	\N
744	745	gloves mohairs admiralties bewigged playgoers cheques batting waspishly gloves mohairs admiralties bewigged playgoers cheques batting waspishly gloves mohairs admiralties bewigged playgoers cheques batting waspishly	\N
749	750	ponderers conditione loathly cancels debiting parrots paraguayans resonates ponderers conditione loathly cancels debiting parrots paraguayans resonates ponderers conditione loathly cancels debiting parrots paraguayans resonates	\N
763	483	perspicuously disjoined nigglings midmonths labium peeped daydreams permuting perspicuously disjoined nigglings midmonths labium peeped daydreams permuting perspicuously disjoined nigglings midmonths labium peeped daydreams permuting	\N
767	768	cerebrum gloves mohairs admiralties bewigged playgoers cerebrum gloves mohairs admiralties bewigged playgoers cerebrum gloves mohairs admiralties bewigged playgoers	\N
781	609	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	\N
793	603	objurgate treaties preprocessor despising objurgate treaties preprocessor despising objurgate treaties preprocessor despising	\N
806	232	mongoloids danker raunchiness perspicuously disjoined mongoloids danker raunchiness perspicuously disjoined mongoloids danker raunchiness perspicuously disjoined	\N
807	808	gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol	\N
828	43	equalled sandwiching bewitchment cheaters equalled sandwiching bewitchment cheaters equalled sandwiching bewitchment cheaters	\N
845	846	forbearer anesthetization undermentioned outflanking funnyman forbearer anesthetization undermentioned outflanking funnyman forbearer anesthetization undermentioned outflanking funnyman	\N
865	866	preheats loggias reconciliating photocatalyst lenity tautological preheats loggias reconciliating photocatalyst lenity tautological preheats loggias reconciliating photocatalyst lenity tautological	\N
876	877	desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	\N
878	879	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	\N
898	217	householder overeducated objurgate treaties householder overeducated objurgate treaties householder overeducated objurgate treaties	\N
919	346	photocatalyst lenity tautological jambing sodality photocatalyst lenity tautological jambing sodality photocatalyst lenity tautological jambing sodality	\N
921	357	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	\N
945	614	extradites stollens ponderers conditione loathly extradites stollens ponderers conditione loathly extradites stollens ponderers conditione loathly	\N
955	349	paraguayans resonates overbites terminals giros podgy vagus kinkiest xix paraguayans resonates overbites terminals giros podgy vagus kinkiest xix paraguayans resonates overbites terminals giros podgy vagus kinkiest xix	\N
964	598	transcribed swifters redigesting ostinato recalculation safest transcribed swifters redigesting ostinato recalculation safest transcribed swifters redigesting ostinato recalculation safest	\N
985	615	bedstraws thoughtless elation swampland earings circumscribed paralyzingly bedstraws thoughtless elation swampland earings circumscribed paralyzingly bedstraws thoughtless elation swampland earings circumscribed paralyzingly	\N
1004	275	splinting surmisers satisfying undamped sharpers forbearer splinting surmisers satisfying undamped sharpers forbearer splinting surmisers satisfying undamped sharpers forbearer	\N
1011	1012	arcadian acridities unrealistic substituting surges preheats loggias arcadian acridities unrealistic substituting surges preheats loggias arcadian acridities unrealistic substituting surges preheats loggias	\N
1029	170	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	\N
1036	186	batting waspishly stilbestrol villainousness miscalling batting waspishly stilbestrol villainousness miscalling batting waspishly stilbestrol villainousness miscalling	\N
1060	152	lachrymation floweret arcadian acridities unrealistic substituting lachrymation floweret arcadian acridities unrealistic substituting lachrymation floweret arcadian acridities unrealistic substituting	\N
1063	91	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters	\N
1085	81	loathly cancels debiting parrots paraguayans resonates overbites loathly cancels debiting parrots paraguayans resonates overbites loathly cancels debiting parrots paraguayans resonates overbites	\N
1086	567	outcrop slipcases phenylketonuria grunts outcrop slipcases phenylketonuria grunts outcrop slipcases phenylketonuria grunts	\N
1093	1094	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	\N
1096	1097	environs hulled preexamination oralogy tibetans environs hulled preexamination oralogy tibetans environs hulled preexamination oralogy tibetans	\N
1109	618	canzona interrelated cooked reformers goodwife technicolor plenishes nippy canzona interrelated cooked reformers goodwife technicolor plenishes nippy canzona interrelated cooked reformers goodwife technicolor plenishes nippy	\N
1118	1119	funnyman commuted lachrymation floweret arcadian funnyman commuted lachrymation floweret arcadian funnyman commuted lachrymation floweret arcadian	\N
1428	752	plateauing reoccupations embossers cerebrum gloves mohairs admiralties plateauing reoccupations embossers cerebrum gloves mohairs admiralties plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N
1931	604	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs	\N
1797	1671	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly	\N
1065	322	bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	\N
1801	122	effulgences coreless tuberculoses environs effulgences coreless tuberculoses environs effulgences coreless tuberculoses environs	\N
1802	299	peeped daydreams permuting immediately canzona interrelated cooked peeped daydreams permuting immediately canzona interrelated cooked peeped daydreams permuting immediately canzona interrelated cooked	\N
1809	1169	nonfiction retrogressions eliminates unknowns mongoloids nonfiction retrogressions eliminates unknowns mongoloids nonfiction retrogressions eliminates unknowns mongoloids	\N
1812	113	anesthetization undermentioned outflanking funnyman anesthetization undermentioned outflanking funnyman anesthetization undermentioned outflanking funnyman	\N
1814	616	manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds	\N
1817	53	giros podgy vagus kinkiest xix giros podgy vagus kinkiest xix giros podgy vagus kinkiest xix	\N
1831	1790	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	\N
1841	1588	recelebrating dually plateauing reoccupations embossers cerebrum gloves recelebrating dually plateauing reoccupations embossers cerebrum gloves recelebrating dually plateauing reoccupations embossers cerebrum gloves	\N
1857	460	rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization	\N
1172	930	sodality outcrop slipcases phenylketonuria grunts venturers valiantly sodality outcrop slipcases phenylketonuria grunts venturers valiantly sodality outcrop slipcases phenylketonuria grunts venturers valiantly	\N
1199	1195	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	\N
1208	326	maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises	\N
1880	640	swifters redigesting ostinato recalculation safest signiory swifters redigesting ostinato recalculation safest signiory swifters redigesting ostinato recalculation safest signiory	\N
1881	826	skeins equalled sandwiching bewitchment cheaters skeins equalled sandwiching bewitchment cheaters skeins equalled sandwiching bewitchment cheaters	\N
1886	1736	bounden occulters blubberer amenities desecrated tetrachlorides loutish bounden occulters blubberer amenities desecrated tetrachlorides loutish bounden occulters blubberer amenities desecrated tetrachlorides loutish	\N
1888	351	venturers valiantly unremorsefully extradites stollens ponderers venturers valiantly unremorsefully extradites stollens ponderers venturers valiantly unremorsefully extradites stollens ponderers	\N
4	0	tibetans slavishly hipless prs bluejays cuppier nonsurgical tibetans slavishly hipless prs bluejays cuppier nonsurgical tibetans slavishly hipless prs bluejays cuppier nonsurgical	\N
68	67	miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	\N
87	83	gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	\N
107	102	unrealistic substituting surges preheats unrealistic substituting surges preheats unrealistic substituting surges preheats	\N
1305	12	thanklessly swiveled polers oinked thanklessly swiveled polers oinked thanklessly swiveled polers oinked	\N
1322	534	exorcises pirog desexes summable heliocentricity exorcises pirog desexes summable heliocentricity exorcises pirog desexes summable heliocentricity	\N
162	161	nigglings midmonths labium peeped daydreams permuting immediately canzona nigglings midmonths labium peeped daydreams permuting immediately canzona nigglings midmonths labium peeped daydreams permuting immediately canzona	\N
1347	907	mohairs admiralties bewigged playgoers cheques batting mohairs admiralties bewigged playgoers cheques batting mohairs admiralties bewigged playgoers cheques batting	\N
196	194	treaties preprocessor despising loftily yabber reprovingly blungers dwarflike treaties preprocessor despising loftily yabber reprovingly blungers dwarflike treaties preprocessor despising loftily yabber reprovingly blungers dwarflike	\N
234	233	inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction	\N
258	253	admiralties bewigged playgoers cheques admiralties bewigged playgoers cheques admiralties bewigged playgoers cheques	\N
297	291	zanier corkscrewed promiscuousness clewed zanier corkscrewed promiscuousness clewed zanier corkscrewed promiscuousness clewed	\N
311	306	forbearer anesthetization undermentioned outflanking funnyman forbearer anesthetization undermentioned outflanking funnyman forbearer anesthetization undermentioned outflanking funnyman	\N
337	335	dually plateauing reoccupations embossers dually plateauing reoccupations embossers dually plateauing reoccupations embossers	\N
371	367	stilbestrol villainousness miscalling firefanged skeins stilbestrol villainousness miscalling firefanged skeins stilbestrol villainousness miscalling firefanged skeins	\N
1876	791	retrogressions eliminates unknowns mongoloids danker raunchiness retrogressions eliminates unknowns mongoloids danker raunchiness retrogressions eliminates unknowns mongoloids danker raunchiness	\N
1885	587	batting waspishly stilbestrol villainousness miscalling firefanged skeins batting waspishly stilbestrol villainousness miscalling firefanged skeins batting waspishly stilbestrol villainousness miscalling firefanged skeins	\N
1890	1856	teashop reaccepts gunneries exorcises pirog desexes teashop reaccepts gunneries exorcises pirog desexes teashop reaccepts gunneries exorcises pirog desexes	\N
1892	812	lachrymation floweret arcadian acridities unrealistic substituting surges preheats lachrymation floweret arcadian acridities unrealistic substituting surges preheats lachrymation floweret arcadian acridities unrealistic substituting surges preheats	\N
1896	969	embossers cerebrum gloves mohairs admiralties bewigged playgoers embossers cerebrum gloves mohairs admiralties bewigged playgoers embossers cerebrum gloves mohairs admiralties bewigged playgoers	\N
2178	822	islanded burlily thanklessly swiveled polers oinked apnea maxillary islanded burlily thanklessly swiveled polers oinked apnea maxillary islanded burlily thanklessly swiveled polers oinked apnea maxillary	\N
2180	1819	reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	\N
1902	1551	unknowns mongoloids danker raunchiness perspicuously disjoined unknowns mongoloids danker raunchiness perspicuously disjoined unknowns mongoloids danker raunchiness perspicuously disjoined	\N
1910	1828	kinkiest xix recollected householder overeducated objurgate kinkiest xix recollected householder overeducated objurgate kinkiest xix recollected householder overeducated objurgate	\N
1920	9	redigesting ostinato recalculation safest signiory latchets inflecting redigesting ostinato recalculation safest signiory latchets inflecting redigesting ostinato recalculation safest signiory latchets inflecting	\N
1934	626	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	\N
1936	606	emanative blowpipe varies thickest machinability orbiters tormentor owner emanative blowpipe varies thickest machinability orbiters tormentor owner emanative blowpipe varies thickest machinability orbiters tormentor owner	\N
1940	1504	excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	\N
1947	1215	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	\N
1956	148	napoleons rifer splinting surmisers napoleons rifer splinting surmisers napoleons rifer splinting surmisers	\N
2192	1129	recelebrating dually plateauing reoccupations embossers recelebrating dually plateauing reoccupations embossers recelebrating dually plateauing reoccupations embossers	\N
2196	933	swiveled polers oinked apnea maxillary dumpers bering evasiveness swiveled polers oinked apnea maxillary dumpers bering evasiveness swiveled polers oinked apnea maxillary dumpers bering evasiveness	\N
2163	1155	gantleted richer succories dwelling scrapped prat islanded burlily gantleted richer succories dwelling scrapped prat islanded burlily gantleted richer succories dwelling scrapped prat islanded burlily	\N
2201	936	admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	\N
1966	348	loathly cancels debiting parrots paraguayans resonates overbites terminals giros loathly cancels debiting parrots paraguayans resonates overbites terminals giros loathly cancels debiting parrots paraguayans resonates overbites terminals giros	\N
1975	1973	midmonths labium peeped daydreams permuting immediately canzona interrelated cooked midmonths labium peeped daydreams permuting immediately canzona interrelated cooked midmonths labium peeped daydreams permuting immediately canzona interrelated cooked	\N
1979	1157	admiralties bewigged playgoers cheques batting waspishly stilbestrol admiralties bewigged playgoers cheques batting waspishly stilbestrol admiralties bewigged playgoers cheques batting waspishly stilbestrol	\N
1986	607	forbearer anesthetization undermentioned outflanking forbearer anesthetization undermentioned outflanking forbearer anesthetization undermentioned outflanking	\N
1995	628	loftily yabber reprovingly blungers dwarflike loftily yabber reprovingly blungers dwarflike loftily yabber reprovingly blungers dwarflike	\N
2000	982	mohairs admiralties bewigged playgoers mohairs admiralties bewigged playgoers mohairs admiralties bewigged playgoers	\N
2002	1900	sandwiching bewitchment cheaters riffled kerneling sandwiching bewitchment cheaters riffled kerneling sandwiching bewitchment cheaters riffled kerneling	\N
2007	97	anesthetization undermentioned outflanking funnyman commuted lachrymation anesthetization undermentioned outflanking funnyman commuted lachrymation anesthetization undermentioned outflanking funnyman commuted lachrymation	\N
2213	1548	admiralties bewigged playgoers cheques batting waspishly stilbestrol admiralties bewigged playgoers cheques batting waspishly stilbestrol admiralties bewigged playgoers cheques batting waspishly stilbestrol	\N
2216	703	heliocentricity excretions recelebrating dually heliocentricity excretions recelebrating dually heliocentricity excretions recelebrating dually	\N
2012	154	slipcases phenylketonuria grunts venturers slipcases phenylketonuria grunts venturers slipcases phenylketonuria grunts venturers	\N
2217	32	kerneling napoleons rifer splinting surmisers kerneling napoleons rifer splinting surmisers kerneling napoleons rifer splinting surmisers	\N
2016	957	objurgate treaties preprocessor despising loftily objurgate treaties preprocessor despising loftily objurgate treaties preprocessor despising loftily	\N
2220	643	tautological jambing sodality outcrop slipcases phenylketonuria tautological jambing sodality outcrop slipcases phenylketonuria tautological jambing sodality outcrop slipcases phenylketonuria	\N
1326	1325	measles decentralizing hogfishes gantleted richer measles decentralizing hogfishes gantleted richer measles decentralizing hogfishes gantleted richer	\N
2025	1918	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	\N
2029	40	loathly cancels debiting parrots paraguayans resonates loathly cancels debiting parrots paraguayans resonates loathly cancels debiting parrots paraguayans resonates	\N
2037	36	recalculation safest signiory latchets inflecting trephines hops recalculation safest signiory latchets inflecting trephines hops recalculation safest signiory latchets inflecting trephines hops	\N
2046	602	earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	\N
2056	1598	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned surmisers satisfying undamped sharpers forbearer anesthetization undermentioned surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	\N
2059	354	acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	\N
2064	1079	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N
2230	925	stilbestrol villainousness miscalling firefanged skeins equalled stilbestrol villainousness miscalling firefanged skeins equalled stilbestrol villainousness miscalling firefanged skeins equalled	\N
2235	247	arcadian acridities unrealistic substituting surges preheats loggias arcadian acridities unrealistic substituting surges preheats loggias arcadian acridities unrealistic substituting surges preheats loggias	\N
2069	1393	firefanged skeins equalled sandwiching firefanged skeins equalled sandwiching firefanged skeins equalled sandwiching	\N
2237	111	debiting parrots paraguayans resonates overbites terminals giros podgy debiting parrots paraguayans resonates overbites terminals giros podgy debiting parrots paraguayans resonates overbites terminals giros podgy	\N
2074	133	grunts venturers valiantly unremorsefully extradites grunts venturers valiantly unremorsefully extradites grunts venturers valiantly unremorsefully extradites	\N
2080	268	tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest	\N
2084	637	oralogy tibetans slavishly hipless prs bluejays oralogy tibetans slavishly hipless prs bluejays oralogy tibetans slavishly hipless prs bluejays	\N
2087	613	goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N
2092	333	floweret arcadian acridities unrealistic substituting surges floweret arcadian acridities unrealistic substituting surges floweret arcadian acridities unrealistic substituting surges	\N
2096	498	teratoid coadjutors thuggeries nondestructive teratoid coadjutors thuggeries nondestructive teratoid coadjutors thuggeries nondestructive	\N
2099	59	funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N
2103	562	lenity tautological jambing sodality lenity tautological jambing sodality lenity tautological jambing sodality	\N
2109	1706	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N
2115	450	undamped sharpers forbearer anesthetization undamped sharpers forbearer anesthetization undamped sharpers forbearer anesthetization	\N
2247	464	grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly	\N
2119	1660	acridities unrealistic substituting surges preheats loggias acridities unrealistic substituting surges preheats loggias acridities unrealistic substituting surges preheats loggias	\N
1452	648	maxillary dumpers bering evasiveness maxillary dumpers bering evasiveness maxillary dumpers bering evasiveness	\N
1224	916	succories dwelling scrapped prat succories dwelling scrapped prat succories dwelling scrapped prat	\N
428	423	dissociated heartier petitionee brill dissociated heartier petitionee brill dissociated heartier petitionee brill	\N
437	432	paraguayans resonates overbites terminals giros paraguayans resonates overbites terminals giros paraguayans resonates overbites terminals giros	\N
456	452	bering evasiveness toto teashop reaccepts bering evasiveness toto teashop reaccepts bering evasiveness toto teashop reaccepts	\N
492	488	arcadian acridities unrealistic substituting surges preheats arcadian acridities unrealistic substituting surges preheats arcadian acridities unrealistic substituting surges preheats	\N
516	513	environs hulled preexamination oralogy tibetans slavishly hipless environs hulled preexamination oralogy tibetans slavishly hipless environs hulled preexamination oralogy tibetans slavishly hipless	\N
526	522	desexes summable heliocentricity excretions recelebrating desexes summable heliocentricity excretions recelebrating desexes summable heliocentricity excretions recelebrating	\N
560	554	bewigged playgoers cheques batting waspishly stilbestrol bewigged playgoers cheques batting waspishly stilbestrol bewigged playgoers cheques batting waspishly stilbestrol	\N
579	575	cheaters riffled kerneling napoleons rifer splinting surmisers cheaters riffled kerneling napoleons rifer splinting surmisers cheaters riffled kerneling napoleons rifer splinting surmisers	\N
595	592	outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic	\N
1534	894	dwelling scrapped prat islanded burlily dwelling scrapped prat islanded burlily dwelling scrapped prat islanded burlily	\N
1547	932	plateauing reoccupations embossers cerebrum gloves mohairs plateauing reoccupations embossers cerebrum gloves mohairs plateauing reoccupations embossers cerebrum gloves mohairs	\N
654	649	valiantly unremorsefully extradites stollens ponderers conditione valiantly unremorsefully extradites stollens ponderers conditione valiantly unremorsefully extradites stollens ponderers conditione	\N
1561	935	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned surmisers satisfying undamped sharpers forbearer anesthetization undermentioned surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	\N
670	669	excretions recelebrating dually plateauing excretions recelebrating dually plateauing excretions recelebrating dually plateauing	\N
683	601	sandwiching bewitchment cheaters riffled kerneling napoleons rifer sandwiching bewitchment cheaters riffled kerneling napoleons rifer sandwiching bewitchment cheaters riffled kerneling napoleons rifer	\N
696	694	lachrymation floweret arcadian acridities unrealistic lachrymation floweret arcadian acridities unrealistic lachrymation floweret arcadian acridities unrealistic	\N
725	617	giros podgy vagus kinkiest xix recollected householder overeducated giros podgy vagus kinkiest xix recollected householder overeducated giros podgy vagus kinkiest xix recollected householder overeducated	\N
741	611	junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N
774	769	firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	\N
786	776	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	\N
802	797	substituting surges preheats loggias substituting surges preheats loggias substituting surges preheats loggias	\N
1633	262	reaccepts gunneries exorcises pirog desexes summable heliocentricity reaccepts gunneries exorcises pirog desexes summable heliocentricity reaccepts gunneries exorcises pirog desexes summable heliocentricity	\N
1645	926	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons	\N
818	815	vagus kinkiest xix recollected householder overeducated objurgate treaties vagus kinkiest xix recollected householder overeducated objurgate treaties vagus kinkiest xix recollected householder overeducated objurgate treaties	\N
1666	928	surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	\N
837	116	riffled kerneling napoleons rifer splinting surmisers riffled kerneling napoleons rifer splinting surmisers riffled kerneling napoleons rifer splinting surmisers	\N
1684	943	swiveled polers oinked apnea maxillary swiveled polers oinked apnea maxillary swiveled polers oinked apnea maxillary	\N
848	430	ponderers conditione loathly cancels debiting parrots paraguayans ponderers conditione loathly cancels debiting parrots paraguayans ponderers conditione loathly cancels debiting parrots paraguayans	\N
871	479	outpoured dissociated heartier petitionee outpoured dissociated heartier petitionee outpoured dissociated heartier petitionee	\N
888	621	desecrated tetrachlorides loutish polygony malines desecrated tetrachlorides loutish polygony malines desecrated tetrachlorides loutish polygony malines	\N
909	385	alkalin succulently marquise underlaid neurosurgeon innervated alkalin succulently marquise underlaid neurosurgeon innervated alkalin succulently marquise underlaid neurosurgeon innervated	\N
954	305	lachrymation floweret arcadian acridities unrealistic lachrymation floweret arcadian acridities unrealistic lachrymation floweret arcadian acridities unrealistic	\N
976	971	jambing sodality outcrop slipcases phenylketonuria grunts jambing sodality outcrop slipcases phenylketonuria grunts jambing sodality outcrop slipcases phenylketonuria grunts	\N
986	202	admiralties bewigged playgoers cheques batting admiralties bewigged playgoers cheques batting admiralties bewigged playgoers cheques batting	\N
1757	924	undermentioned outflanking funnyman commuted undermentioned outflanking funnyman commuted undermentioned outflanking funnyman commuted	\N
1766	927	extradites stollens ponderers conditione loathly extradites stollens ponderers conditione loathly extradites stollens ponderers conditione loathly	\N
1007	227	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	\N
1784	119	gloves mohairs admiralties bewigged playgoers cheques batting gloves mohairs admiralties bewigged playgoers cheques batting gloves mohairs admiralties bewigged playgoers cheques batting	\N
1016	962	reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination	\N
1032	608	disjoined nigglings midmonths labium peeped daydreams disjoined nigglings midmonths labium peeped daydreams disjoined nigglings midmonths labium peeped daydreams	\N
1042	1037	isolators reducing nethermost nonfiction isolators reducing nethermost nonfiction isolators reducing nethermost nonfiction	\N
1051	505	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	\N
1056	124	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan irades inadvisability disciplinarians majors manifestly decaffeinates scalepan irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N
1072	1069	resonates overbites terminals giros resonates overbites terminals giros resonates overbites terminals giros	\N
1099	529	loggias reconciliating photocatalyst lenity tautological jambing sodality loggias reconciliating photocatalyst lenity tautological jambing sodality loggias reconciliating photocatalyst lenity tautological jambing sodality	\N
1117	1113	heliocentricity excretions recelebrating dually plateauing reoccupations heliocentricity excretions recelebrating dually plateauing reoccupations heliocentricity excretions recelebrating dually plateauing reoccupations	\N
1134	414	kerneling napoleons rifer splinting surmisers satisfying undamped kerneling napoleons rifer splinting surmisers satisfying undamped kerneling napoleons rifer splinting surmisers satisfying undamped	\N
1142	830	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers	\N
1851	1505	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	\N
1149	1147	terminals giros podgy vagus terminals giros podgy vagus terminals giros podgy vagus	\N
1858	721	apnea maxillary dumpers bering evasiveness toto teashop reaccepts apnea maxillary dumpers bering evasiveness toto teashop reaccepts apnea maxillary dumpers bering evasiveness toto teashop reaccepts	\N
1163	1161	intermuscular fobbed transcribed swifters redigesting intermuscular fobbed transcribed swifters redigesting intermuscular fobbed transcribed swifters redigesting	\N
1174	1124	villainousness miscalling firefanged skeins villainousness miscalling firefanged skeins villainousness miscalling firefanged skeins	\N
1193	1188	technicolor plenishes nippy bounden occulters blubberer technicolor plenishes nippy bounden occulters blubberer technicolor plenishes nippy bounden occulters blubberer	\N
1202	645	slipcases phenylketonuria grunts venturers valiantly slipcases phenylketonuria grunts venturers valiantly slipcases phenylketonuria grunts venturers valiantly	\N
1217	1216	hulled preexamination oralogy tibetans slavishly hipless hulled preexamination oralogy tibetans slavishly hipless hulled preexamination oralogy tibetans slavishly hipless	\N
1238	1236	mongoloids danker raunchiness perspicuously disjoined nigglings midmonths mongoloids danker raunchiness perspicuously disjoined nigglings midmonths mongoloids danker raunchiness perspicuously disjoined nigglings midmonths	\N
1259	702	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment	\N
1269	538	reaccepts gunneries exorcises pirog desexes summable heliocentricity reaccepts gunneries exorcises pirog desexes summable heliocentricity reaccepts gunneries exorcises pirog desexes summable heliocentricity	\N
1275	665	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	\N
1280	374	cerebrum gloves mohairs admiralties bewigged playgoers cheques batting cerebrum gloves mohairs admiralties bewigged playgoers cheques batting cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N
1905	476	burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering	\N
1912	861	gunneries exorcises pirog desexes gunneries exorcises pirog desexes gunneries exorcises pirog desexes	\N
1293	950	raunchiness perspicuously disjoined nigglings midmonths labium peeped raunchiness perspicuously disjoined nigglings midmonths labium peeped raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N
1922	689	gloves mohairs admiralties bewigged playgoers gloves mohairs admiralties bewigged playgoers gloves mohairs admiralties bewigged playgoers	\N
1313	1309	householder overeducated objurgate treaties preprocessor despising loftily householder overeducated objurgate treaties preprocessor despising loftily householder overeducated objurgate treaties preprocessor despising loftily	\N
1336	1334	safest signiory latchets inflecting trephines hops exec junketeers safest signiory latchets inflecting trephines hops exec junketeers safest signiory latchets inflecting trephines hops exec junketeers	\N
1356	629	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N
1373	625	machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	\N
1385	408	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N
1398	1228	waspishly stilbestrol villainousness miscalling waspishly stilbestrol villainousness miscalling waspishly stilbestrol villainousness miscalling	\N
1961	691	bering evasiveness toto teashop reaccepts bering evasiveness toto teashop reaccepts bering evasiveness toto teashop reaccepts	\N
1971	1018	dually plateauing reoccupations embossers cerebrum gloves dually plateauing reoccupations embossers cerebrum gloves dually plateauing reoccupations embossers cerebrum gloves	\N
1981	929	oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts	\N
1867	942	richer succories dwelling scrapped prat islanded burlily thanklessly swiveled richer succories dwelling scrapped prat islanded burlily thanklessly swiveled richer succories dwelling scrapped prat islanded burlily thanklessly swiveled	\N
1988	457	playgoers cheques batting waspishly playgoers cheques batting waspishly playgoers cheques batting waspishly	\N
1424	644	debiting parrots paraguayans resonates debiting parrots paraguayans resonates debiting parrots paraguayans resonates	\N
1446	550	oinked apnea maxillary dumpers oinked apnea maxillary dumpers oinked apnea maxillary dumpers	\N
1457	605	funnyman commuted lachrymation floweret arcadian funnyman commuted lachrymation floweret arcadian funnyman commuted lachrymation floweret arcadian	\N
1465	619	dwarflike effulgences coreless tuberculoses environs hulled dwarflike effulgences coreless tuberculoses environs hulled dwarflike effulgences coreless tuberculoses environs hulled	\N
1476	1231	admiralties bewigged playgoers cheques batting admiralties bewigged playgoers cheques batting admiralties bewigged playgoers cheques batting	\N
1501	1496	bewitchment cheaters riffled kerneling napoleons rifer bewitchment cheaters riffled kerneling napoleons rifer bewitchment cheaters riffled kerneling napoleons rifer	\N
1512	1508	undermentioned outflanking funnyman commuted lachrymation floweret arcadian undermentioned outflanking funnyman commuted lachrymation floweret arcadian undermentioned outflanking funnyman commuted lachrymation floweret arcadian	\N
2020	127	richer succories dwelling scrapped richer succories dwelling scrapped richer succories dwelling scrapped	\N
1917	360	unmuzzling measles decentralizing hogfishes unmuzzling measles decentralizing hogfishes unmuzzling measles decentralizing hogfishes	\N
2026	939	recelebrating dually plateauing reoccupations embossers recelebrating dually plateauing reoccupations embossers recelebrating dually plateauing reoccupations embossers	\N
1524	1111	grunts venturers valiantly unremorsefully extradites grunts venturers valiantly unremorsefully extradites grunts venturers valiantly unremorsefully extradites	\N
2031	229	rifer splinting surmisers satisfying undamped sharpers rifer splinting surmisers satisfying undamped sharpers rifer splinting surmisers satisfying undamped sharpers	\N
1533	110	preprocessor despising loftily yabber reprovingly blungers preprocessor despising loftily yabber reprovingly blungers preprocessor despising loftily yabber reprovingly blungers	\N
1541	190	miscalling firefanged skeins equalled sandwiching bewitchment miscalling firefanged skeins equalled sandwiching bewitchment miscalling firefanged skeins equalled sandwiching bewitchment	\N
1544	553	outflanking funnyman commuted lachrymation outflanking funnyman commuted lachrymation outflanking funnyman commuted lachrymation	\N
1553	627	paraguayans resonates overbites terminals giros podgy vagus paraguayans resonates overbites terminals giros podgy vagus paraguayans resonates overbites terminals giros podgy vagus	\N
1566	100	inflecting trephines hops exec junketeers isolators reducing nethermost inflecting trephines hops exec junketeers isolators reducing nethermost inflecting trephines hops exec junketeers isolators reducing nethermost	\N
1573	623	surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N
1580	27	miscalling firefanged skeins equalled sandwiching bewitchment cheaters miscalling firefanged skeins equalled sandwiching bewitchment cheaters miscalling firefanged skeins equalled sandwiching bewitchment cheaters	\N
1595	1590	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	\N
1606	95	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological	\N
1612	391	phenylketonuria grunts venturers valiantly phenylketonuria grunts venturers valiantly phenylketonuria grunts venturers valiantly	\N
2076	938	miscalling firefanged skeins equalled sandwiching bewitchment cheaters miscalling firefanged skeins equalled sandwiching bewitchment cheaters miscalling firefanged skeins equalled sandwiching bewitchment cheaters	\N
1620	496	giros podgy vagus kinkiest xix recollected householder giros podgy vagus kinkiest xix recollected householder giros podgy vagus kinkiest xix recollected householder	\N
2085	934	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity	\N
1630	1214	sandwiching bewitchment cheaters riffled kerneling sandwiching bewitchment cheaters riffled kerneling sandwiching bewitchment cheaters riffled kerneling	\N
2090	302	islanded burlily thanklessly swiveled islanded burlily thanklessly swiveled islanded burlily thanklessly swiveled	\N
1640	1637	unremorsefully extradites stollens ponderers conditione loathly unremorsefully extradites stollens ponderers conditione loathly unremorsefully extradites stollens ponderers conditione loathly	\N
1652	600	bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N
1664	205	hipless prs bluejays cuppier nonsurgical skimpiest outpoured hipless prs bluejays cuppier nonsurgical skimpiest outpoured hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N
1680	343	bounden occulters blubberer amenities bounden occulters blubberer amenities bounden occulters blubberer amenities	\N
1690	1689	unrealistic substituting surges preheats loggias reconciliating photocatalyst unrealistic substituting surges preheats loggias reconciliating photocatalyst unrealistic substituting surges preheats loggias reconciliating photocatalyst	\N
1700	620	maladjustments subpartnership cordilleras recirculations alkalin maladjustments subpartnership cordilleras recirculations alkalin maladjustments subpartnership cordilleras recirculations alkalin	\N
1712	1711	commuted lachrymation floweret arcadian commuted lachrymation floweret arcadian commuted lachrymation floweret arcadian	\N
1727	130	tautological jambing sodality outcrop slipcases tautological jambing sodality outcrop slipcases tautological jambing sodality outcrop slipcases	\N
1738	633	gloves mohairs admiralties bewigged gloves mohairs admiralties bewigged gloves mohairs admiralties bewigged	\N
2122	931	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	\N
2126	55	valiantly unremorsefully extradites stollens valiantly unremorsefully extradites stollens valiantly unremorsefully extradites stollens	\N
1745	896	surges preheats loggias reconciliating photocatalyst lenity tautological surges preheats loggias reconciliating photocatalyst lenity tautological surges preheats loggias reconciliating photocatalyst lenity tautological	\N
2133	532	reoccupations embossers cerebrum gloves mohairs admiralties reoccupations embossers cerebrum gloves mohairs admiralties reoccupations embossers cerebrum gloves mohairs admiralties	\N
1751	216	despising loftily yabber reprovingly blungers dwarflike effulgences coreless despising loftily yabber reprovingly blungers dwarflike effulgences coreless despising loftily yabber reprovingly blungers dwarflike effulgences coreless	\N
1764	411	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N
1770	1635	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	\N
1776	547	inserter plights corollaries gaudiness irades inadvisability inserter plights corollaries gaudiness irades inadvisability inserter plights corollaries gaudiness irades inadvisability	\N
1789	1156	debiting parrots paraguayans resonates overbites terminals giros podgy vagus debiting parrots paraguayans resonates overbites terminals giros podgy vagus debiting parrots paraguayans resonates overbites terminals giros podgy vagus	\N
1811	382	desexes summable heliocentricity excretions recelebrating desexes summable heliocentricity excretions recelebrating desexes summable heliocentricity excretions recelebrating	\N
1816	796	cheaters riffled kerneling napoleons rifer splinting cheaters riffled kerneling napoleons rifer splinting cheaters riffled kerneling napoleons rifer splinting	\N
1823	1806	photocatalyst lenity tautological jambing sodality outcrop slipcases photocatalyst lenity tautological jambing sodality outcrop slipcases photocatalyst lenity tautological jambing sodality outcrop slipcases	\N
2154	288	bering evasiveness toto teashop reaccepts gunneries exorcises bering evasiveness toto teashop reaccepts gunneries exorcises bering evasiveness toto teashop reaccepts gunneries exorcises	\N
2157	407	oinked apnea maxillary dumpers bering evasiveness toto oinked apnea maxillary dumpers bering evasiveness toto oinked apnea maxillary dumpers bering evasiveness toto	\N
1834	1833	petitionee brill neologic intermuscular petitionee brill neologic intermuscular petitionee brill neologic intermuscular	\N
2162	572	summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	\N
1848	667	cooked reformers goodwife technicolor plenishes cooked reformers goodwife technicolor plenishes cooked reformers goodwife technicolor plenishes	\N
1853	1747	jambing sodality outcrop slipcases jambing sodality outcrop slipcases jambing sodality outcrop slipcases	\N
1861	63	coreless tuberculoses environs hulled preexamination coreless tuberculoses environs hulled preexamination coreless tuberculoses environs hulled preexamination	\N
\.



COPY "Committee" ("ID", has_a_name, has_a_committee_chair, was_a_program_committee_of, "TYPE") FROM stdin;
314	YSWC 2014 Program Committee	\N	470	1
1000	ZSWC 2015 Program Committee	\N	163	1
140	XSWC 2014 Program Committee	\N	18	1
1489	ZSWC 2014 Program Committee	\N	7	1
160	XSWC 2015 Program Committee	\N	86	1
510	SIGXYZ 2014 Program Committee	\N	256	1
317	YSWC 2015 Program Committee	\N	69	1
\.



COPY "Conference_document" ("ID", has_a_date_of_issue, "has_a_URL", "TYPE") FROM stdin;
319	2014-06-30	\N	0
322	2014-06-09	\N	0
343	2014-06-05	\N	0
348	2015-06-07	\N	0
354	2015-06-16	\N	0
362	2014-06-18	\N	0
374	2015-06-10	\N	0
375	2014-06-22	\N	0
377	2014-06-16	\N	0
382	2015-06-03	\N	0
394	2015-06-25	\N	0
396	2015-06-23	\N	0
404	2014-06-26	\N	0
407	2014-06-17	\N	0
414	2015-06-17	\N	0
423	2014-06-11	\N	0
430	2015-06-08	\N	0
432	2015-06-09	\N	0
450	2015-06-20	\N	0
452	2014-06-24	\N	0
460	2015-06-18	\N	0
462	2014-06-24	\N	0
464	2014-06-23	\N	0
467	2015-06-16	\N	0
485	2014-06-13	\N	0
488	2014-06-07	\N	0
495	2015-06-12	\N	0
498	2014-06-17	\N	0
501	2014-06-07	\N	0
505	2014-06-16	\N	0
512	2015-06-13	\N	0
522	2015-06-01	\N	0
529	2015-06-21	\N	0
532	2014-06-07	\N	0
538	2015-06-27	\N	0
541	2014-06-13	\N	0
551	2014-06-05	\N	0
553	2015-06-29	\N	0
554	2015-06-14	\N	0
565	2014-06-11	\N	0
567	2015-06-05	\N	0
569	2015-06-03	\N	0
572	2014-06-30	\N	0
583	2015-06-18	\N	0
587	2015-06-11	\N	0
599	2014-06-29	\N	0
600	2014-06-22	\N	0
603	2014-06-17	\N	0
605	2014-06-06	\N	0
606	2014-06-21	\N	0
610	2014-06-20	\N	0
611	2014-06-28	\N	0
612	2014-06-08	\N	0
613	2014-06-04	\N	0
614	2014-06-12	\N	0
615	2014-06-08	\N	0
616	2014-06-15	\N	0
617	2014-06-15	\N	0
618	2014-06-03	\N	0
619	2014-06-19	\N	0
620	2014-06-18	\N	0
621	2014-06-06	\N	0
622	2014-06-03	\N	0
625	2014-06-22	\N	0
626	2014-06-10	\N	0
627	2014-06-14	\N	0
628	2014-06-18	\N	0
629	2014-06-28	\N	0
637	2015-06-19	\N	0
644	2015-06-08	\N	0
645	2014-06-24	\N	0
647	2015-06-06	\N	0
649	2015-06-04	\N	0
658	2014-06-01	\N	0
665	2015-06-25	\N	0
667	2015-06-06	\N	0
689	2014-06-09	\N	0
691	2014-06-21	\N	0
705	2014-06-27	\N	0
721	2014-06-18	\N	0
745	2014-06-28	\N	0
747	2015-06-10	\N	0
748	2014-06-22	\N	0
752	2014-06-05	\N	0
0	2014-06-08	\N	0
15	2015-06-27	\N	0
16	2014-06-09	\N	0
25	2014-06-06	\N	0
27	2015-06-21	\N	0
30	2015-06-14	\N	0
32	2014-06-07	\N	0
36	2014-06-26	\N	0
40	2014-06-13	\N	0
59	2015-06-11	\N	0
61	2014-06-12	\N	0
63	2014-06-06	\N	0
65	2014-06-24	\N	0
75	2014-06-10	\N	0
81	2014-06-27	\N	0
91	2015-06-22	\N	0
97	2015-06-08	\N	0
110	2015-06-16	\N	0
122	2015-06-17	\N	0
124	2014-06-14	\N	0
127	2014-06-12	\N	0
130	2015-06-25	\N	0
136	2014-06-10	\N	0
152	2014-06-14	\N	0
154	2015-06-02	\N	0
156	2015-06-20	\N	0
157	2014-06-02	\N	0
161	2015-06-03	\N	0
170	2015-06-28	\N	0
179	2014-06-15	\N	0
188	2014-06-07	\N	0
190	2014-06-01	\N	0
202	2015-06-09	\N	0
205	2015-06-20	\N	0
215	2014-06-26	\N	0
216	2015-06-15	\N	0
217	2015-06-14	\N	0
226	2014-06-01	\N	0
227	2015-06-03	\N	0
232	2014-06-30	\N	0
250	2015-06-22	\N	0
260	2014-06-29	\N	0
262	2014-06-21	\N	0
265	2014-06-05	\N	0
268	2014-06-21	\N	0
278	2015-06-13	\N	0
281	2015-06-05	\N	0
299	2014-06-02	\N	0
302	2014-06-29	\N	0
305	2015-06-13	\N	0
1366	2015-06-04	\N	0
1418	2015-06-22	\N	0
1440	2015-06-23	\N	0
1496	2015-06-26	\N	0
1505	2014-06-03	\N	0
1508	2015-06-09	\N	0
1551	2015-06-01	\N	0
1637	2015-06-07	\N	0
1660	2015-06-01	\N	0
1671	2015-06-04	\N	0
1736	2015-06-08	\N	0
1778	2015-06-10	\N	0
1833	2015-06-23	\N	0
1856	2015-06-26	\N	0
1900	2015-06-25	\N	0
797	2015-06-18	\N	0
813	2014-06-06	\N	0
822	2014-06-12	\N	0
839	2014-06-22	\N	0
846	2015-06-07	\N	0
853	2014-06-05	\N	0
861	2014-06-26	\N	0
866	2015-06-20	\N	0
877	2014-06-23	\N	0
880	2014-06-18	\N	0
904	2015-06-24	\N	0
916	2014-06-08	\N	0
924	2014-06-12	\N	0
925	2014-06-02	\N	0
926	2014-06-04	\N	0
927	2014-06-25	\N	0
932	2014-06-26	\N	0
935	2014-06-09	\N	0
936	2014-06-29	\N	0
939	2014-06-25	\N	0
942	2014-06-07	\N	0
957	2015-06-15	\N	0
962	2015-06-16	\N	0
969	2015-06-09	\N	0
971	2015-06-26	\N	0
1025	2014-06-04	\N	0
1069	2014-06-29	\N	0
1094	2014-06-10	\N	0
1097	2015-06-18	\N	0
1113	2015-06-04	\N	0
1119	2014-06-18	\N	0
1124	2014-06-11	\N	0
1129	2014-06-03	\N	0
1145	2015-06-29	\N	0
1155	2014-06-06	\N	0
1159	2015-06-23	\N	0
1169	2015-06-30	\N	0
1195	2014-06-04	\N	0
1206	2015-06-19	\N	0
1214	2015-06-24	\N	0
1215	2015-06-17	\N	0
1228	2015-06-18	\N	0
1236	2014-06-20	\N	0
1242	2014-06-20	\N	0
1267	2015-06-27	\N	0
1309	2014-06-02	\N	0
1344	2015-06-14	\N	0
696	\N	\N	0
1238	\N	\N	0
2122	\N	\N	0
2230	\N	\N	0
1060	\N	\N	0
1547	\N	\N	0
1834	\N	\N	0
1586	\N	\N	0
1723	\N	\N	0
786	\N	\N	0
207	\N	\N	0
114	\N	\N	0
29	\N	\N	0
1241	\N	\N	0
1280	\N	\N	0
492	\N	\N	0
954	\N	\N	0
1063	\N	\N	0
1872	\N	\N	0
1896	\N	\N	0
1313	\N	\N	0
1042	\N	\N	0
1442	\N	\N	0
1940	\N	\N	0
646	\N	\N	0
395	\N	\N	0
285	\N	\N	0
1534	\N	\N	0
225	\N	\N	0
1620	\N	\N	0
976	\N	\N	0
1047	\N	\N	0
192	\N	\N	0
1867	\N	\N	0
1745	\N	\N	0
1016	\N	\N	0
1117	\N	\N	0
1633	\N	\N	0
1971	\N	\N	0
1474	\N	\N	0
1920	\N	\N	0
1841	\N	\N	0
1917	\N	\N	0
654	\N	\N	0
67	2015-06-13	\N	0
83	2015-06-28	\N	0
102	2015-06-26	\N	0
194	2014-06-03	\N	0
208	2014-06-28	\N	0
218	2014-06-04	\N	0
233	2014-06-16	\N	0
253	2014-06-29	\N	0
291	2014-06-23	\N	0
306	2015-06-21	\N	0
335	2015-06-06	\N	0
367	2015-06-19	\N	0
397	2014-06-23	\N	0
316	2014-06-06	\N	0
469	2014-06-19	\N	0
513	2014-06-20	\N	0
575	2015-06-27	\N	0
592	2015-06-10	\N	0
669	2015-06-17	\N	0
674	2014-06-14	\N	0
601	2014-06-02	\N	0
694	2015-06-30	\N	0
769	2015-06-22	\N	0
776	2015-06-05	\N	0
815	2015-06-12	\N	0
116	2015-06-25	\N	0
479	2014-06-23	\N	0
385	2014-06-19	\N	0
937	2014-06-13	\N	0
608	2014-06-01	\N	0
1037	2015-06-29	\N	0
830	2015-06-30	\N	0
1147	2015-06-11	\N	0
1161	2015-06-24	\N	0
930	2014-06-21	\N	0
1188	2015-06-07	\N	0
326	2014-06-19	\N	0
1216	2014-06-07	\N	0
702	2015-06-12	\N	0
950	2015-06-02	\N	0
12	2014-06-14	\N	0
534	2014-06-27	\N	0
1325	2014-06-03	\N	0
1334	2014-06-15	\N	0
907	2014-06-10	\N	0
408	2015-06-05	\N	0
550	2014-06-23	\N	0
648	2014-06-18	\N	0
1231	2015-06-13	\N	0
1111	2015-06-03	\N	0
894	2014-06-13	\N	0
100	2014-06-27	\N	0
623	2014-06-10	\N	0
1590	2015-06-04	\N	0
95	2015-06-17	\N	0
391	2015-06-30	\N	0
496	2015-06-11	\N	0
928	2014-06-17	\N	0
943	2014-06-30	\N	0
1689	2014-06-20	\N	0
1711	2015-06-12	\N	0
633	2015-06-08	\N	0
896	2015-06-02	\N	0
411	2015-06-28	\N	0
1635	2014-06-15	\N	0
547	2014-06-13	\N	0
119	2014-06-08	\N	0
1156	2014-06-28	\N	0
796	2015-06-16	\N	0
1806	2015-06-29	\N	0
1747	2014-06-23	\N	0
791	2014-06-19	\N	0
812	2015-06-24	\N	0
476	2014-06-13	\N	0
1828	2014-06-01	\N	0
360	2014-06-02	\N	0
9	2014-06-14	\N	0
604	2014-06-27	\N	0
1504	2015-06-04	\N	0
148	2015-06-30	\N	0
1018	2014-06-04	\N	0
1973	2014-06-22	\N	0
1157	2015-06-20	\N	0
929	2014-06-17	\N	0
607	2014-06-05	\N	0
457	2014-06-30	\N	0
982	2015-06-12	\N	0
1918	2015-06-28	\N	0
229	2014-06-08	\N	0
602	2014-06-09	\N	0
1598	2015-06-03	\N	0
1079	2015-06-29	\N	0
1393	2015-06-23	\N	0
133	2015-06-06	\N	0
938	2014-06-03	\N	0
934	2014-06-16	\N	0
333	2014-06-19	\N	0
562	2015-06-24	\N	0
1706	2015-06-07	\N	0
931	2014-06-11	\N	0
55	2014-06-24	\N	0
50	2014-06-14	\N	0
77	2014-06-27	\N	0
151	2015-06-02	\N	0
178	2015-06-15	\N	0
193	2015-06-30	\N	0
139	2015-06-28	\N	0
288	2014-06-02	\N	0
286	2014-06-22	\N	0
329	2014-06-05	\N	0
419	2015-06-08	\N	0
1819	2014-06-25	\N	0
2108	2014-06-08	\N	0
591	2014-06-09	\N	0
681	2015-06-29	\N	0
750	2015-06-06	\N	0
483	2014-06-21	\N	0
768	2015-06-19	\N	0
933	2014-06-16	\N	0
609	2014-06-04	\N	0
808	2015-06-11	\N	0
43	2015-06-24	\N	0
879	2015-06-01	\N	0
1548	2014-06-11	\N	0
357	2015-06-27	\N	0
703	2014-06-24	\N	0
349	2015-06-10	\N	0
598	2014-06-25	\N	0
643	2014-06-20	\N	0
275	2015-06-02	\N	0
1012	2015-06-15	\N	0
247	2014-06-15	\N	0
111	2014-06-28	\N	0
1245	2015-06-26	\N	0
873	2014-06-26	\N	0
388	2014-06-09	\N	0
537	2014-06-10	\N	0
1288	2015-06-01	\N	0
1302	2015-06-14	\N	0
913	2015-06-21	\N	0
716	2014-06-21	\N	0
242	2014-06-16	\N	0
543	2014-06-17	\N	0
417	2015-06-07	\N	0
440	2014-06-11	\N	0
835	2014-06-12	\N	0
624	2014-06-25	\N	0
521	2014-06-20	\N	0
11	2015-06-02	\N	0
1342	2015-06-15	\N	0
1002	2015-06-28	\N	0
47	2015-06-05	\N	0
731	2014-06-15	\N	0
52	2014-06-16	\N	0
1137	2015-06-06	\N	0
900	2015-06-19	\N	0
1704	2015-06-26	\N	0
347	2014-06-11	\N	0
175	2015-06-09	\N	0
346	2014-06-19	\N	0
1537	2015-06-01	\N	0
1502	2015-06-27	\N	0
503	2015-06-21	\N	0
186	2014-06-01	\N	0
113	2014-06-17	\N	0
53	2014-06-30	\N	0
1790	2015-06-22	\N	0
1588	2015-06-05	\N	0
640	2015-06-25	\N	0
826	2014-06-12	\N	0
351	2014-06-25	\N	0
710	\N	\N	0
711	\N	\N	0
715	\N	\N	0
720	\N	\N	0
732	\N	\N	0
736	\N	\N	0
751	\N	\N	0
754	\N	\N	0
758	\N	\N	0
764	\N	\N	0
766	\N	\N	0
790	\N	\N	0
320	\N	\N	0
804	\N	\N	0
821	\N	\N	0
824	\N	\N	0
825	\N	\N	0
829	\N	\N	0
832	\N	\N	0
838	\N	\N	0
854	\N	\N	0
860	\N	\N	0
872	\N	\N	0
656	\N	\N	0
549	\N	\N	0
364	\N	\N	0
903	\N	\N	0
906	\N	\N	0
912	\N	\N	0
915	\N	\N	0
237	\N	\N	0
940	\N	\N	0
308	\N	\N	0
949	\N	\N	0
958	\N	\N	0
266	\N	\N	0
965	\N	\N	0
966	\N	\N	0
858	\N	\N	0
1001	\N	\N	0
660	\N	\N	0
1017	\N	\N	0
1024	\N	\N	0
1031	\N	\N	0
1034	\N	\N	0
1048	\N	\N	0
1050	\N	\N	0
1052	\N	\N	0
468	\N	\N	0
283	\N	\N	0
1061	\N	\N	0
1076	\N	\N	0
1078	\N	\N	0
1082	\N	\N	0
1089	\N	\N	0
1102	\N	\N	0
1104	\N	\N	0
1110	\N	\N	0
153	\N	\N	0
370	\N	\N	0
1126	\N	\N	0
264	\N	\N	0
1068	\N	\N	0
1123	\N	\N	0
902	\N	\N	0
539	\N	\N	0
1091	\N	\N	0
995	\N	\N	0
220	\N	\N	0
979	\N	\N	0
1180	\N	\N	0
295	\N	\N	0
1185	\N	\N	0
1187	\N	\N	0
1197	\N	\N	0
1213	\N	\N	0
1222	\N	\N	0
1230	\N	\N	0
1235	\N	\N	0
511	\N	\N	0
323	\N	\N	0
1247	\N	\N	0
1251	\N	\N	0
1255	\N	\N	0
577	\N	\N	0
1260	\N	\N	0
1261	\N	\N	0
1268	\N	\N	0
1270	\N	\N	0
1273	\N	\N	0
994	\N	\N	0
1284	\N	\N	0
1296	\N	\N	0
527	\N	\N	0
20	\N	\N	0
1299	\N	\N	0
1306	\N	\N	0
1307	\N	\N	0
1317	\N	\N	0
1329	\N	\N	0
814	\N	\N	0
1341	\N	\N	0
1345	\N	\N	0
1348	\N	\N	0
1349	\N	\N	0
1358	\N	\N	0
1360	\N	\N	0
1362	\N	\N	0
1368	\N	\N	0
788	\N	\N	0
1375	\N	\N	0
1376	\N	\N	0
1381	\N	\N	0
1384	\N	\N	0
1386	\N	\N	0
1388	\N	\N	0
1389	\N	\N	0
1006	\N	\N	0
1400	\N	\N	0
1402	\N	\N	0
843	\N	\N	0
911	\N	\N	0
984	\N	\N	0
1410	\N	\N	0
2	\N	\N	0
26	\N	\N	0
31	\N	\N	0
39	\N	\N	0
42	\N	\N	0
46	\N	\N	0
54	\N	\N	0
64	\N	\N	0
72	\N	\N	0
78	\N	\N	0
80	\N	\N	0
84	\N	\N	0
90	\N	\N	0
96	\N	\N	0
99	\N	\N	0
94	\N	\N	0
115	\N	\N	0
118	\N	\N	0
123	\N	\N	0
129	\N	\N	0
132	\N	\N	0
169	\N	\N	0
174	\N	\N	0
149	\N	\N	0
189	\N	\N	0
201	\N	\N	0
204	\N	\N	0
246	\N	\N	0
267	\N	\N	0
274	\N	\N	0
277	\N	\N	0
287	\N	\N	0
298	\N	\N	0
301	\N	\N	0
304	\N	\N	0
325	\N	\N	0
330	\N	\N	0
332	\N	\N	0
336	\N	\N	0
342	\N	\N	0
350	\N	\N	0
353	\N	\N	0
356	\N	\N	0
365	\N	\N	0
376	\N	\N	0
381	\N	\N	0
383	\N	\N	0
384	\N	\N	0
387	\N	\N	0
390	\N	\N	0
252	\N	\N	0
398	\N	\N	0
410	\N	\N	0
413	\N	\N	0
433	\N	\N	0
449	\N	\N	0
463	\N	\N	0
409	\N	\N	0
475	\N	\N	0
478	\N	\N	0
484	\N	\N	0
502	\N	\N	0
504	\N	\N	0
528	\N	\N	0
531	\N	\N	0
533	\N	\N	0
544	\N	\N	0
546	\N	\N	0
559	\N	\N	0
561	\N	\N	0
566	\N	\N	0
571	\N	\N	0
173	\N	\N	0
586	\N	\N	0
240	\N	\N	0
630	\N	\N	0
632	\N	\N	0
636	\N	\N	0
639	\N	\N	0
664	\N	\N	0
231	\N	\N	0
687	\N	\N	0
690	\N	\N	0
698	\N	\N	0
1994	\N	\N	0
1946	\N	\N	0
593	\N	\N	0
448	\N	\N	0
2001	\N	\N	0
1574	\N	\N	0
2004	\N	\N	0
1898	\N	\N	0
785	\N	\N	0
2008	\N	\N	0
2009	\N	\N	0
2013	\N	\N	0
2014	\N	\N	0
1431	\N	\N	0
2021	\N	\N	0
1669	\N	\N	0
819	\N	\N	0
1272	\N	\N	0
2027	\N	\N	0
1593	\N	\N	0
1200	\N	\N	0
2033	\N	\N	0
2035	\N	\N	0
1740	\N	\N	0
1656	\N	\N	0
798	\N	\N	0
1543	\N	\N	0
1825	\N	\N	0
1697	\N	\N	0
2049	\N	\N	0
1014	\N	\N	0
2050	\N	\N	0
2061	\N	\N	0
1623	\N	\N	0
1549	\N	\N	0
773	\N	\N	0
1774	\N	\N	0
1491	\N	\N	0
1415	\N	\N	0
184	\N	\N	0
2070	\N	\N	0
1713	\N	\N	0
1597	\N	\N	0
1558	\N	\N	0
1616	\N	\N	0
2082	\N	\N	0
2018	\N	\N	0
784	\N	\N	0
1066	\N	\N	0
2086	\N	\N	0
2036	\N	\N	0
1073	\N	\N	0
972	\N	\N	0
1638	\N	\N	0
2095	\N	\N	0
406	\N	\N	0
1166	\N	\N	0
981	\N	\N	0
244	\N	\N	0
1021	\N	\N	0
2107	\N	\N	0
1383	\N	\N	0
1622	\N	\N	0
2116	\N	\N	0
1923	\N	\N	0
2120	\N	\N	0
2114	\N	\N	0
228	\N	\N	0
1339	\N	\N	0
1691	\N	\N	0
2123	\N	\N	0
1405	\N	\N	0
1646	\N	\N	0
2125	\N	\N	0
2128	\N	\N	0
1220	\N	\N	0
1115	\N	\N	0
1749	\N	\N	0
1528	\N	\N	0
2136	\N	\N	0
2137	\N	\N	0
2140	\N	\N	0
1040	\N	\N	0
1171	\N	\N	0
2141	\N	\N	0
1177	\N	\N	0
1303	\N	\N	0
2147	\N	\N	0
2149	\N	\N	0
1455	\N	\N	0
1602	\N	\N	0
211	\N	\N	0
1582	\N	\N	0
13	\N	\N	0
508	\N	\N	0
1335	\N	\N	0
2156	\N	\N	0
1889	\N	\N	0
1839	\N	\N	0
582	\N	\N	0
2112	\N	\N	0
1407	\N	\N	0
2165	\N	\N	0
1891	\N	\N	0
257	\N	\N	0
1281	\N	\N	0
106	\N	\N	0
1190	\N	\N	0
2170	\N	\N	0
2171	\N	\N	0
2172	\N	\N	0
195	\N	\N	0
1153	\N	\N	0
443	\N	\N	0
1862	\N	\N	0
2028	\N	\N	0
1444	\N	\N	0
761	\N	\N	0
1968	\N	\N	0
1136	\N	\N	0
1239	\N	\N	0
1264	\N	\N	0
1871	\N	\N	0
2181	\N	\N	0
1397	\N	\N	0
490	\N	\N	0
1969	\N	\N	0
2097	\N	\N	0
570	\N	\N	0
2184	\N	\N	0
426	\N	\N	0
1371	\N	\N	0
678	\N	\N	0
2118	\N	\N	0
1921	\N	\N	0
2190	\N	\N	0
167	\N	\N	0
2191	\N	\N	0
315	\N	\N	0
701	\N	\N	0
657	\N	\N	0
1895	\N	\N	0
1563	\N	\N	0
2197	\N	\N	0
1498	\N	\N	0
726	\N	\N	0
1965	\N	\N	0
1647	\N	\N	0
1585	\N	\N	0
2079	\N	\N	0
2205	\N	\N	0
1312	\N	\N	0
596	\N	\N	0
757	\N	\N	0
1974	\N	\N	0
1792	\N	\N	0
1990	\N	\N	0
2200	\N	\N	0
2167	\N	\N	0
137	\N	\N	0
1949	\N	\N	0
1420	\N	\N	0
1422	\N	\N	0
1432	\N	\N	0
1437	\N	\N	0
1439	\N	\N	0
1447	\N	\N	0
1450	\N	\N	0
868	\N	\N	0
970	\N	\N	0
1462	\N	\N	0
947	\N	\N	0
1468	\N	\N	0
1469	\N	\N	0
1472	\N	\N	0
1478	\N	\N	0
1480	\N	\N	0
1482	\N	\N	0
1483	\N	\N	0
1484	\N	\N	0
1179	\N	\N	0
1211	\N	\N	0
847	\N	\N	0
1514	\N	\N	0
1517	\N	\N	0
38	\N	\N	0
1522	\N	\N	0
1529	\N	\N	0
1536	\N	\N	0
820	\N	\N	0
1144	\N	\N	0
1546	\N	\N	0
1552	\N	\N	0
1564	\N	\N	0
1201	\N	\N	0
795	\N	\N	0
1567	\N	\N	0
1571	\N	\N	0
1575	\N	\N	0
1577	\N	\N	0
997	\N	\N	0
1	\N	\N	0
431	\N	\N	0
1587	\N	\N	0
1015	\N	\N	0
1603	\N	\N	0
1607	\N	\N	0
147	\N	\N	0
1613	\N	\N	0
1624	\N	\N	0
245	\N	\N	0
1626	\N	\N	0
1140	\N	\N	0
1229	\N	\N	0
185	\N	\N	0
1409	\N	\N	0
1634	\N	\N	0
778	\N	\N	0
1649	\N	\N	0
719	\N	\N	0
1650	\N	\N	0
1661	\N	\N	0
422	\N	\N	0
1670	\N	\N	0
1672	\N	\N	0
1074	\N	\N	0
1701	\N	\N	0
1705	\N	\N	0
235	\N	\N	0
1167	\N	\N	0
1721	\N	\N	0
1722	\N	\N	0
1332	\N	\N	0
1730	\N	\N	0
1731	\N	\N	0
1735	\N	\N	0
1742	\N	\N	0
1746	\N	\N	0
1754	\N	\N	0
1756	\N	\N	0
1758	\N	\N	0
1676	\N	\N	0
1761	\N	\N	0
1674	\N	\N	0
380	\N	\N	0
1767	\N	\N	0
58	\N	\N	0
864	\N	\N	0
1793	\N	\N	0
1796	\N	\N	0
1798	\N	\N	0
581	\N	\N	0
1805	\N	\N	0
1808	\N	\N	0
1175	\N	\N	0
369	\N	\N	0
1818	\N	\N	0
1820	\N	\N	0
1827	\N	\N	0
1830	\N	\N	0
1832	\N	\N	0
1643	\N	\N	0
292	\N	\N	0
1840	\N	\N	0
1842	\N	\N	0
405	\N	\N	0
663	\N	\N	0
1292	\N	\N	0
1855	\N	\N	0
1570	\N	\N	0
1864	\N	\N	0
1845	\N	\N	0
1865	\N	\N	0
1477	\N	\N	0
255	\N	\N	0
263	\N	\N	0
735	\N	\N	0
1882	\N	\N	0
1883	\N	\N	0
459	\N	\N	0
1423	\N	\N	0
990	\N	\N	0
1708	\N	\N	0
197	\N	\N	0
524	\N	\N	0
1846	\N	\N	0
19	\N	\N	0
1443	\N	\N	0
1907	\N	\N	0
1414	\N	\N	0
1913	\N	\N	0
1919	\N	\N	0
704	\N	\N	0
458	\N	\N	0
1925	\N	\N	0
493	\N	\N	0
1395	\N	\N	0
884	\N	\N	0
1935	\N	\N	0
787	\N	\N	0
1436	\N	\N	0
1941	\N	\N	0
1943	\N	\N	0
128	\N	\N	0
1950	\N	\N	0
425	\N	\N	0
1932	\N	\N	0
1372	\N	\N	0
695	\N	\N	0
1953	\N	\N	0
842	\N	\N	0
1227	\N	\N	0
1928	\N	\N	0
1962	\N	\N	0
273	\N	\N	0
1972	\N	\N	0
1560	\N	\N	0
859	\N	\N	0
1983	\N	\N	0
112	\N	\N	0
1497	\N	\N	0
1045	\N	\N	0
1992	\N	\N	0
1682	\N	\N	0
653	\N	\N	0
1596	\N	\N	0
466	\N	\N	0
1594	\N	\N	0
1648	\N	\N	0
2017	\N	\N	0
519	\N	\N	0
729	\N	\N	0
2214	\N	\N	0
2209	\N	\N	0
1916	\N	\N	0
2221	\N	\N	0
159	\N	\N	0
1542	\N	\N	0
2225	\N	\N	0
1632	\N	\N	0
455	\N	\N	0
2144	\N	\N	0
771	\N	\N	0
1688	\N	\N	0
1554	\N	\N	0
1677	\N	\N	0
1081	\N	\N	0
1768	\N	\N	0
1714	\N	\N	0
2228	\N	\N	0
1531	\N	\N	0
2229	\N	\N	0
742	\N	\N	0
2062	\N	\N	0
1513	\N	\N	0
2159	\N	\N	0
2234	\N	\N	0
1064	\N	\N	0
2048	\N	\N	0
851	\N	\N	0
975	\N	\N	0
1641	\N	\N	0
35	\N	\N	0
2151	\N	\N	0
1559	\N	\N	0
1183	\N	\N	0
88	\N	\N	0
166	\N	\N	0
1879	\N	\N	0
1355	\N	\N	0
1897	\N	\N	0
2242	\N	\N	0
1276	\N	\N	0
1847	\N	\N	0
2263	\N	\N	0
2106	\N	\N	0
1960	\N	\N	0
2187	\N	\N	0
1311	\N	\N	0
1430	\N	\N	0
2160	\N	\N	0
1927	\N	\N	0
1976	\N	\N	0
70	\N	\N	0
1783	\N	\N	0
1929	\N	\N	0
471	\N	\N	0
1874	\N	\N	0
340	\N	\N	0
1989	\N	\N	0
1924	\N	\N	0
1266	\N	\N	0
1948	\N	\N	0
650	\N	\N	0
2052	\N	\N	0
318	\N	\N	0
1557	\N	\N	0
2072	\N	\N	0
401	\N	\N	0
518	\N	\N	0
271	\N	\N	0
1535	\N	\N	0
1108	\N	\N	0
1894	\N	\N	0
2155	\N	\N	0
2177	\N	\N	0
1225	\N	\N	0
1416	\N	\N	0
453	\N	\N	0
307	\N	\N	0
2188	\N	\N	0
999	\N	\N	0
708	\N	\N	0
1930	\N	\N	0
1340	\N	\N	0
557	\N	\N	0
2032	\N	\N	0
1556	\N	\N	0
1739	\N	\N	0
2121	\N	\N	0
435	\N	\N	0
1435	\N	\N	0
659	\N	\N	0
739	\N	\N	0
811	\N	\N	0
1600	\N	\N	0
714	\N	\N	0
2260	\N	\N	0
272	\N	\N	0
2053	\N	\N	0
684	\N	\N	0
857	\N	\N	0
895	\N	\N	0
2019	\N	\N	0
1719	\N	\N	0
1139	\N	\N	0
2055	\N	\N	0
2065	\N	\N	0
1467	\N	\N	0
1955	\N	\N	0
671	\N	\N	0
1686	\N	\N	0
889	\N	\N	0
138	\N	\N	0
146	\N	\N	0
219	\N	\N	0
1869	\N	\N	0
1520	\N	\N	0
682	\N	\N	0
1106	\N	\N	0
1020	\N	\N	0
1621	\N	\N	0
2240	\N	\N	0
1653	\N	\N	0
2054	\N	\N	0
1353	\N	\N	0
1254	\N	\N	0
1687	\N	\N	0
2175	\N	\N	0
1694	\N	\N	0
892	\N	\N	0
1605	\N	\N	0
1788	\N	\N	0
2067	\N	\N	0
2101	\N	\N	0
1116	\N	\N	0
1753	\N	\N	0
2249	\N	\N	0
1316	\N	\N	0
2254	\N	\N	0
2238	\N	\N	0
991	\N	\N	0
1043	\N	\N	0
1173	\N	\N	0
1970	\N	\N	0
284	\N	\N	0
1781	\N	\N	0
2256	\N	\N	0
2127	\N	\N	0
1379	\N	\N	0
2212	\N	\N	0
2044	\N	\N	0
1717	\N	\N	0
1785	\N	\N	0
210	\N	\N	0
1681	\N	\N	0
1055	\N	\N	0
2075	\N	\N	0
1726	\N	\N	0
1720	\N	\N	0
762	\N	\N	0
1838	\N	\N	0
988	\N	\N	0
1663	\N	\N	0
1495	\N	\N	0
108	\N	\N	0
1192	\N	\N	0
2261	\N	\N	0
1911	\N	\N	0
952	\N	\N	0
779	\N	\N	0
1207	\N	\N	0
2093	\N	\N	0
2215	\N	\N	0
1492	\N	\N	0
324	\N	\N	0
1150	\N	\N	0
2078	\N	\N	0
2169	\N	\N	0
918	\N	\N	0
1810	\N	\N	0
887	\N	\N	0
1980	\N	\N	0
1804	\N	\N	0
1240	\N	\N	0
447	\N	\N	0
1696	\N	\N	0
1130	\N	\N	0
1490	\N	\N	0
2043	\N	\N	0
1906	\N	\N	0
777	\N	\N	0
1098	\N	\N	0
1323	\N	\N	0
2134	\N	\N	0
676	\N	\N	0
2180	\N	\N	0
311	\N	\N	0
2178	\N	\N	0
221	\N	\N	0
1910	\N	\N	0
2090	\N	\N	0
828	\N	\N	0
1640	\N	\N	0
1263	\N	\N	0
1802	\N	\N	0
1356	\N	\N	0
560	\N	\N	0
1757	\N	\N	0
871	\N	\N	0
371	\N	\N	0
439	\N	\N	0
1606	\N	\N	0
1351	\N	\N	0
1636	\N	\N	0
590	\N	\N	0
1217	\N	\N	0
1056	\N	\N	0
1886	\N	\N	0
280	\N	\N	0
2192	\N	\N	0
1709	\N	\N	0
2007	\N	\N	0
1385	\N	\N	0
837	\N	\N	0
2085	\N	\N	0
2026	\N	\N	0
1703	\N	\N	0
1029	\N	\N	0
1797	\N	\N	0
2119	\N	\N	0
1541	\N	\N	0
1727	\N	\N	0
393	\N	\N	0
1690	\N	\N	0
1367	\N	\N	0
1032	\N	\N	0
845	\N	\N	0
536	\N	\N	0
693	\N	\N	0
1760	\N	\N	0
1326	\N	\N	0
1007	\N	\N	0
1764	\N	\N	0
1398	\N	\N	0
1406	\N	\N	0
1524	\N	\N	0
1501	\N	\N	0
2056	\N	\N	0
840	\N	\N	0
1163	\N	\N	0
361	\N	\N	0
1530	\N	\N	0
1233	\N	\N	0
1373	\N	\N	0
516	\N	\N	0
898	\N	\N	0
1417	\N	\N	0
1457	\N	\N	0
1561	\N	\N	0
500	\N	\N	0
1776	\N	\N	0
4	\N	\N	0
2217	\N	\N	0
679	\N	\N	0
1465	\N	\N	0
909	\N	\N	0
177	\N	\N	0
1823	\N	\N	0
1149	\N	\N	0
1249	\N	\N	0
1471	\N	\N	0
1109	\N	\N	0
1096	\N	\N	0
1861	\N	\N	0
1259	\N	\N	0
1947	\N	\N	0
1816	\N	\N	0
1853	\N	\N	0
1573	\N	\N	0
733	\N	\N	0
520	\N	\N	0
1202	\N	\N	0
1966	\N	\N	0
258	\N	\N	0
1452	\N	\N	0
1801	\N	\N	0
2020	\N	\N	0
1817	\N	\N	0
1888	\N	\N	0
1741	\N	\N	0
162	\N	\N	0
540	\N	\N	0
986	\N	\N	0
196	\N	\N	0
76	\N	\N	0
1700	\N	\N	0
683	\N	\N	0
781	\N	\N	0
1446	\N	\N	0
1172	\N	\N	0
234	\N	\N	0
2162	\N	\N	0
1857	\N	\N	0
1428	\N	\N	0
2096	\N	\N	0
1766	\N	\N	0
183	\N	\N	0
1540	\N	\N	0
1630	\N	\N	0
2247	\N	\N	0
741	\N	\N	0
60	\N	\N	0
2002	\N	\N	0
921	\N	\N	0
1848	\N	\N	0
2046	\N	\N	0
1738	\N	\N	0
1301	\N	\N	0
1224	\N	\N	0
68	\N	\N	0
1051	\N	\N	0
2237	\N	\N	0
461	\N	\N	0
1975	\N	\N	0
749	\N	\N	0
1252	\N	\N	0
670	\N	\N	0
1521	\N	\N	0
2201	\N	\N	0
865	\N	\N	0
456	\N	\N	0
2076	\N	\N	0
680	\N	\N	0
328	\N	\N	0
107	\N	\N	0
437	\N	\N	0
1609	\N	\N	0
744	\N	\N	0
1789	\N	\N	0
445	\N	\N	0
2012	\N	\N	0
241	\N	\N	0
2157	\N	\N	0
888	\N	\N	0
1566	\N	\N	0
1365	\N	\N	0
1905	\N	\N	0
1212	\N	\N	0
2059	\N	\N	0
1683	\N	\N	0
2103	\N	\N	0
1979	\N	\N	0
738	\N	\N	0
1988	\N	\N	0
1193	\N	\N	0
1419	\N	\N	0
2031	\N	\N	0
595	\N	\N	0
1666	\N	\N	0
1811	\N	\N	0
1936	\N	\N	0
1093	\N	\N	0
1777	\N	\N	0
259	\N	\N	0
87	\N	\N	0
1710	\N	\N	0
1072	\N	\N	0
1305	\N	\N	0
897	\N	\N	0
1931	\N	\N	0
2084	\N	\N	0
1770	\N	\N	0
1412	\N	\N	0
668	\N	\N	0
1476	\N	\N	0
2115	\N	\N	0
1831	\N	\N	0
1748	\N	\N	0
1065	\N	\N	0
1851	\N	\N	0
1892	\N	\N	0
1036	\N	\N	0
2087	\N	\N	0
1544	\N	\N	0
1569	\N	\N	0
1134	\N	\N	0
1424	\N	\N	0
2126	\N	\N	0
249	\N	\N	0
579	\N	\N	0
661	\N	\N	0
1390	\N	\N	0
1380	\N	\N	0
2216	\N	\N	0
1876	\N	\N	0
1004	\N	\N	0
2080	\N	\N	0
1912	\N	\N	0
2025	\N	\N	0
1279	\N	\N	0
1961	\N	\N	0
818	\N	\N	0
2196	\N	\N	0
1786	\N	\N	0
1125	\N	\N	0
919	\N	\N	0
1553	\N	\N	0
1645	\N	\N	0
1579	\N	\N	0
428	\N	\N	0
1205	\N	\N	0
2029	\N	\N	0
1269	\N	\N	0
526	\N	\N	0
1512	\N	\N	0
1809	\N	\N	0
1733	\N	\N	0
1680	\N	\N	0
1601	\N	\N	0
1347	\N	\N	0
2220	\N	\N	0
1664	\N	\N	0
2074	\N	\N	0
1812	\N	\N	0
49	\N	\N	0
1652	\N	\N	0
1814	\N	\N	0
1595	\N	\N	0
706	\N	\N	0
806	\N	\N	0
955	\N	\N	0
1712	\N	\N	0
985	\N	\N	0
774	\N	\N	0
1934	\N	\N	0
1336	\N	\N	0
2154	\N	\N	0
1986	\N	\N	0
807	\N	\N	0
1099	\N	\N	0
402	\N	\N	0
1612	\N	\N	0
2213	\N	\N	0
848	\N	\N	0
1981	\N	\N	0
2000	\N	\N	0
1885	\N	\N	0
2235	\N	\N	0
1287	\N	\N	0
1657	\N	\N	0
2099	\N	\N	0
730	\N	\N	0
2069	\N	\N	0
1022	\N	\N	0
1199	\N	\N	0
2016	\N	\N	0
1627	\N	\N	0
1784	\N	\N	0
1751	\N	\N	0
1086	\N	\N	0
1902	\N	\N	0
1158	\N	\N	0
2109	\N	\N	0
150	\N	\N	0
212	\N	\N	0
1244	\N	\N	0
1858	\N	\N	0
802	\N	\N	0
1922	\N	\N	0
1308	\N	\N	0
337	\N	\N	0
418	\N	\N	0
1234	\N	\N	0
1142	\N	\N	0
472	\N	\N	0
2064	\N	\N	0
1421	\N	\N	0
1880	\N	\N	0
2092	\N	\N	0
1184	\N	\N	0
1533	\N	\N	0
1085	\N	\N	0
1174	\N	\N	0
1743	\N	\N	0
1118	\N	\N	0
1890	\N	\N	0
1293	\N	\N	0
2133	\N	\N	0
297	\N	\N	0
1507	\N	\N	0
878	\N	\N	0
881	\N	\N	0
763	\N	\N	0
1580	\N	\N	0
1275	\N	\N	0
1881	\N	\N	0
1319	\N	\N	0
1011	\N	\N	0
1208	\N	\N	0
1995	\N	\N	0
17	\N	\N	0
574	\N	\N	0
45	\N	\N	0
2182	\N	\N	0
1487	\N	\N	0
2163	\N	\N	0
1322	\N	\N	0
767	\N	\N	0
856	\N	\N	0
876	\N	\N	0
725	\N	\N	0
793	\N	\N	0
964	\N	\N	0
945	\N	\N	0
1684	\N	\N	0
1956	\N	\N	0
24	\N	\N	0
2037	\N	\N	0
2063	\N	http://SIGXYZ-2014.tld	2
2270	\N	http://XSWC-2015.tld	2
2274	\N	http://ZSWC-2014.tld	2
1991	\N	http://YSWC-2015.tld	2
2272	\N	http://YSWC-2014.tld	2
2271	\N	http://XSWC-2014.tld	2
1998	\N	http://ZSWC-2015.tld	2
\.



COPY "Conference_fees" ("ID", amount) FROM stdin;
809	755
1121	756
1617	751
1813	752
2183	754
2203	757
2267	753
\.



COPY "Conference_proceedings" ("ID", has_a_publisher, has_a_volume, has_a_name, "has_an_ISBN") FROM stdin;
224	\N	\N	Proceedings of ZSWC-2015	4815162342007
1084	\N	\N	Proceedings of YSWC-2014	4815162342002
1333	\N	\N	Proceedings of ZSWC-2014	4815162342003
1843	\N	\N	Proceedings of SIGXYZ-2014	4815162342004
1958	\N	\N	Proceedings of XSWC-2015	4815162342005
2186	\N	\N	Proceedings of XSWC-2014	4815162342001
2275	\N	\N	Proceedings of YSWC-2015	4815162342006
\.



COPY "Conference_volume" ("ID", has_a_program_committee, has_an_organizing_committ, has_a_location, has_a_steering_committee, has_important_dates, has_a_name) FROM stdin;
256	\N	\N	Pago Pago	\N	\N	SIGXYZ
7	\N	\N	Annaba	\N	\N	ZSWC
69	\N	\N	Escaldes	\N	\N	YSWC
470	\N	\N	Mascara	\N	\N	YSWC
86	\N	\N	Andorra La Vella	\N	\N	XSWC
163	\N	\N	Benguela	\N	\N	ZSWC
18	\N	\N	Tirane	\N	\N	XSWC
\.



COPY "Important_dates" ("ID", is_a_date_of_acceptance_a, is_a_full_paper_submissio, is_a_date_of_camera_ready, is_an_ending_date, is_a_starting_date, is_an_abstract_submission) FROM stdin;
\.



COPY "Invited_talk" ("ID", is_given_by, has_an_abstract, is_submitted_at) FROM stdin;
\.



COPY "Organization" ("ID", has_a_name) FROM stdin;
\.



COPY "Organizer" ("ID") FROM stdin;
\.



COPY "Organizing_committee" ("ID", was_an_organizing_committ) FROM stdin;
\.



COPY "Paper" ("ID", has_an_abstract, has_a_paper_title, is_submitted_at, "TYPE") FROM stdin;
452	456	bering evasiveness toto teashop reaccepts	256	0
1828	1910	kinkiest xix recollected householder overeducated objurgate	7	0
932	1547	plateauing reoccupations embossers cerebrum gloves mohairs	470	0
450	2115	undamped sharpers forbearer anesthetization	69	0
942	1867	richer succories dwelling scrapped prat islanded burlily thanklessly swiveled	18	0
133	2074	grunts venturers valiantly unremorsefully extradites	163	0
1111	1524	grunts venturers valiantly unremorsefully extradites	69	0
572	2162	summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	18	0
1155	2163	gantleted richer succories dwelling scrapped prat islanded burlily	18	0
626	1934	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	256	0
1236	1238	mongoloids danker raunchiness perspicuously disjoined nigglings midmonths	7	0
637	2084	oralogy tibetans slavishly hipless prs bluejays	163	0
614	945	extradites stollens ponderers conditione loathly	256	0
600	1652	bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	256	0
302	2090	islanded burlily thanklessly swiveled	7	0
205	1664	hipless prs bluejays cuppier nonsurgical skimpiest outpoured	163	0
208	212	pirog desexes summable heliocentricity excretions recelebrating	18	0
467	668	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	86	0
1418	1417	undermentioned outflanking funnyman commuted lachrymation floweret	69	0
916	1224	succories dwelling scrapped prat	18	0
1711	1712	commuted lachrymation floweret arcadian	86	0
606	1936	emanative blowpipe varies thickest machinability orbiters tormentor owner	256	0
299	1802	peeped daydreams permuting immediately canzona interrelated cooked	256	0
479	871	outpoured dissociated heartier petitionee	256	0
1195	1199	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	7	0
613	2087	goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated	256	0
1245	1244	recalculation safest signiory latchets inflecting trephines hops	163	0
877	876	desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	470	0
1366	1365	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	163	0
1900	2002	sandwiching bewitchment cheaters riffled kerneling	86	0
404	574	desexes summable heliocentricity excretions recelebrating dually plateauing	256	0
971	976	jambing sodality outcrop slipcases phenylketonuria grunts	86	0
488	492	arcadian acridities unrealistic substituting surges preheats	256	0
396	395	funnyman commuted lachrymation floweret arcadian acridities unrealistic	69	0
322	1065	bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	7	0
152	1060	lachrymation floweret arcadian acridities unrealistic substituting	470	0
924	1757	undermentioned outflanking funnyman commuted	470	0
268	2080	tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest	256	0
139	207	loggias reconciliating photocatalyst lenity tautological jambing	69	0
1124	1174	villainousness miscalling firefanged skeins	7	0
27	1580	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	86	0
904	1412	evasiveness toto teashop reaccepts	86	0
495	1872	vagus kinkiest xix recollected householder	163	0
612	1507	surges preheats loggias reconciliating photocatalyst lenity tautological	256	0
367	371	stilbestrol villainousness miscalling firefanged skeins	86	0
61	60	rhythmical wastebaskets powderer immigrates inserter	256	0
1025	1380	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	7	0
170	1029	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	86	0
1325	1326	measles decentralizing hogfishes gantleted richer	18	0
649	654	valiantly unremorsefully extradites stollens ponderers conditione	69	0
1159	1158	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	86	0
288	2154	bering evasiveness toto teashop reaccepts gunneries exorcises	7	0
242	241	polers oinked apnea maxillary dumpers bering	18	0
602	2046	earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	256	0
880	881	loggias reconciliating photocatalyst lenity	470	0
541	540	fobbed transcribed swifters redigesting ostinato recalculation	7	0
1551	1902	unknowns mongoloids danker raunchiness perspicuously disjoined	163	0
731	730	burlily thanklessly swiveled polers oinked apnea maxillary	470	0
464	2247	grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly	470	0
1113	1117	heliocentricity excretions recelebrating dually plateauing reoccupations	69	0
969	1896	embossers cerebrum gloves mohairs admiralties bewigged playgoers	86	0
414	1134	kerneling napoleons rifer splinting surmisers satisfying undamped	69	0
354	2059	acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	86	0
53	1817	giros podgy vagus kinkiest xix	7	0
349	955	paraguayans resonates overbites terminals giros podgy vagus kinkiest xix	163	0
529	1099	loggias reconciliating photocatalyst lenity tautological jambing sodality	86	0
496	1620	giros podgy vagus kinkiest xix recollected householder	69	0
156	1442	villainousness miscalling firefanged skeins equalled sandwiching	86	0
52	1601	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	256	0
63	1861	coreless tuberculoses environs hulled preexamination	7	0
611	741	junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	256	0
643	2220	tautological jambing sodality outcrop slipcases phenylketonuria	470	0
179	183	swiveled polers oinked apnea maxillary	18	0
505	1051	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	7	0
567	1086	outcrop slipcases phenylketonuria grunts	163	0
1344	1748	floweret arcadian acridities unrealistic substituting surges	86	0
587	1885	batting waspishly stilbestrol villainousness miscalling firefanged skeins	69	0
190	1541	miscalling firefanged skeins equalled sandwiching bewitchment	256	0
619	1465	dwarflike effulgences coreless tuberculoses environs hulled	256	0
419	418	reoccupations embossers cerebrum gloves mohairs admiralties	86	0
326	1208	maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises	18	0
1704	1703	rifer splinting surmisers satisfying undamped sharpers forbearer	163	0
822	2178	islanded burlily thanklessly swiveled polers oinked apnea maxillary	18	0
658	661	heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	18	0
538	1269	reaccepts gunneries exorcises pirog desexes summable heliocentricity	86	0
1590	1595	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	86	0
603	793	objurgate treaties preprocessor despising	256	0
1012	1011	arcadian acridities unrealistic substituting surges preheats loggias	86	0
1215	1947	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	86	0
846	845	forbearer anesthetization undermentioned outflanking funnyman	86	0
937	1022	funnyman commuted lachrymation floweret arcadian	470	0
1635	1770	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	7	0
936	2201	admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	470	0
394	393	toto teashop reaccepts gunneries exorcises	86	0
1689	1690	unrealistic substituting surges preheats loggias reconciliating photocatalyst	7	0
423	428	dissociated heartier petitionee brill	7	0
1671	1797	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly	163	0
721	1858	apnea maxillary dumpers bering evasiveness toto teashop reaccepts	18	0
645	1202	slipcases phenylketonuria grunts venturers valiantly	7	0
605	1457	funnyman commuted lachrymation floweret arcadian	256	0
569	646	heliocentricity excretions recelebrating dually plateauing reoccupations embossers	86	0
265	1233	summable heliocentricity excretions recelebrating	7	0
547	1776	inserter plights corollaries gaudiness irades inadvisability	256	0
408	1385	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	86	0
391	1612	phenylketonuria grunts venturers valiantly	86	0
894	1534	dwelling scrapped prat islanded burlily	470	0
694	696	lachrymation floweret arcadian acridities unrealistic	163	0
681	680	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	86	0
343	1680	bounden occulters blubberer amenities	256	0
705	706	embossers cerebrum gloves mohairs admiralties bewigged playgoers	470	0
622	1586	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers	256	0
607	1986	forbearer anesthetization undermentioned outflanking	256	0
748	1212	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	470	0
1188	1193	technicolor plenishes nippy bounden occulters blubberer	163	0
1079	2064	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	86	0
178	177	sandwiching bewitchment cheaters riffled kerneling	69	0
226	225	apnea maxillary dumpers bering evasiveness toto	7	0
215	1047	ponderers conditione loathly cancels debiting parrots	470	0
1214	1630	sandwiching bewitchment cheaters riffled kerneling	163	0
1309	1313	householder overeducated objurgate treaties preprocessor despising loftily	7	0
1129	2192	recelebrating dually plateauing reoccupations embossers	18	0
752	1428	plateauing reoccupations embossers cerebrum gloves mohairs admiralties	18	0
928	1666	surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	470	0
512	1234	recollected householder overeducated objurgate treaties preprocessor	163	0
375	1419	evasiveness toto teashop reaccepts gunneries exorcises	18	0
1502	1760	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	86	0
148	1956	napoleons rifer splinting surmisers	86	0
281	280	immediately canzona interrelated cooked	163	0
532	2133	reoccupations embossers cerebrum gloves mohairs admiralties	7	0
618	1109	canzona interrelated cooked reformers goodwife technicolor plenishes nippy	256	0
1157	1979	admiralties bewigged playgoers cheques batting waspishly stilbestrol	163	0
813	897	cheaters riffled kerneling napoleons	470	0
1334	1336	safest signiory latchets inflecting trephines hops exec junketeers	7	0
275	1004	splinting surmisers satisfying undamped sharpers forbearer	86	0
278	1683	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	69	0
407	2157	oinked apnea maxillary dumpers bering evasiveness toto	18	0
1094	1093	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	7	0
91	1063	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters	163	0
202	986	admiralties bewigged playgoers cheques batting	69	0
665	1275	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	69	0
110	1533	preprocessor despising loftily yabber reprovingly blungers	69	0
15	45	latchets inflecting trephines hops exec junketeers isolators reducing	163	0
501	500	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	18	0
866	865	preheats loggias reconciliating photocatalyst lenity tautological	86	0
1018	1971	dually plateauing reoccupations embossers cerebrum gloves	18	0
30	29	objurgate treaties preprocessor despising loftily yabber reprovingly	163	0
689	1922	gloves mohairs admiralties bewigged playgoers	18	0
217	898	householder overeducated objurgate treaties	69	0
930	1172	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	470	0
1778	1777	playgoers cheques batting waspishly stilbestrol villainousness	69	0
161	162	nigglings midmonths labium peeped daydreams permuting immediately canzona	163	0
927	1766	extradites stollens ponderers conditione loathly	470	0
583	1579	plateauing reoccupations embossers cerebrum gloves	163	0
935	1561	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	470	0
362	361	reducing nethermost nonfiction retrogressions eliminates	7	0
83	87	gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	86	0
617	725	giros podgy vagus kinkiest xix recollected householder overeducated	256	0
1069	1072	resonates overbites terminals giros	7	0
513	516	environs hulled preexamination oralogy tibetans slavishly hipless	256	0
377	1125	attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	256	0
625	1373	machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	256	0
430	848	ponderers conditione loathly cancels debiting parrots paraguayans	163	0
640	1880	swifters redigesting ostinato recalculation safest signiory	163	0
551	738	hogfishes gantleted richer succories dwelling scrapped prat	18	0
615	985	bedstraws thoughtless elation swampland earings circumscribed paralyzingly	256	0
111	2237	debiting parrots paraguayans resonates overbites terminals giros podgy	470	0
591	590	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria	256	0
691	1961	bering evasiveness toto teashop reaccepts	18	0
627	1553	paraguayans resonates overbites terminals giros podgy vagus	256	0
1588	1841	recelebrating dually plateauing reoccupations embossers cerebrum gloves	69	0
797	802	substituting surges preheats loggias	86	0
382	1811	desexes summable heliocentricity excretions recelebrating	69	0
1505	1851	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	7	0
216	1751	despising loftily yabber reprovingly blungers dwarflike effulgences coreless	163	0
620	1700	maladjustments subpartnership cordilleras recirculations alkalin	256	0
411	1764	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	163	0
100	1566	inflecting trephines hops exec junketeers isolators reducing nethermost	256	0
462	461	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	18	0
769	774	firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	86	0
1288	1287	grunts venturers valiantly unremorsefully extradites	86	0
67	68	miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	69	0
432	437	paraguayans resonates overbites terminals giros	69	0
0	4	tibetans slavishly hipless prs bluejays cuppier nonsurgical	7	0
1169	1809	nonfiction retrogressions eliminates unknowns mongoloids	163	0
81	1085	loathly cancels debiting parrots paraguayans resonates overbites	470	0
16	17	dwelling scrapped prat islanded burlily	18	0
102	107	unrealistic substituting surges preheats	69	0
194	196	treaties preprocessor despising loftily yabber reprovingly blungers dwarflike	7	0
218	221	decentralizing hogfishes gantleted richer succories dwelling	18	0
233	234	inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction	7	0
253	258	admiralties bewigged playgoers cheques	256	0
291	297	zanier corkscrewed promiscuousness clewed	256	0
306	311	forbearer anesthetization undermentioned outflanking funnyman	69	0
335	337	dually plateauing reoccupations embossers	86	0
397	402	toto teashop reaccepts gunneries exorcises pirog desexes	18	0
316	445	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers	18	0
469	472	bering evasiveness toto teashop reaccepts	470	0
522	526	desexes summable heliocentricity excretions recelebrating	86	0
554	560	bewigged playgoers cheques batting waspishly stilbestrol	86	0
575	579	cheaters riffled kerneling napoleons rifer splinting surmisers	86	0
592	595	outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic	86	0
669	670	excretions recelebrating dually plateauing	163	0
674	679	prat islanded burlily thanklessly swiveled polers	470	0
601	683	sandwiching bewitchment cheaters riffled kerneling napoleons rifer	256	0
136	733	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	470	0
776	786	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	86	0
815	818	vagus kinkiest xix recollected householder overeducated objurgate treaties	69	0
116	837	riffled kerneling napoleons rifer splinting surmisers	163	0
839	840	exorcises pirog desexes summable heliocentricity excretions recelebrating dually	470	0
853	856	sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers	470	0
621	888	desecrated tetrachlorides loutish polygony malines	256	0
385	909	alkalin succulently marquise underlaid neurosurgeon innervated	256	0
305	954	lachrymation floweret arcadian acridities unrealistic	86	0
227	1007	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	163	0
962	1016	reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination	163	0
608	1032	disjoined nigglings midmonths labium peeped daydreams	256	0
1037	1042	isolators reducing nethermost nonfiction	163	0
124	1056	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	256	0
830	1142	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers	69	0
1147	1149	terminals giros podgy vagus	163	0
1161	1163	intermuscular fobbed transcribed swifters redigesting	163	0
1216	1217	hulled preexamination oralogy tibetans slavishly hipless	7	0
702	1259	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment	69	0
374	1280	cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	86	0
950	1293	raunchiness perspicuously disjoined nigglings midmonths labium peeped	163	0
12	1305	thanklessly swiveled polers oinked	18	0
534	1322	exorcises pirog desexes summable heliocentricity	18	0
907	1347	mohairs admiralties bewigged playgoers cheques batting	18	0
629	1356	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	256	0
1228	1398	waspishly stilbestrol villainousness miscalling	86	0
644	1424	debiting parrots paraguayans resonates	69	0
550	1446	oinked apnea maxillary dumpers	256	0
648	1452	maxillary dumpers bering evasiveness	470	0
1231	1476	admiralties bewigged playgoers cheques batting	86	0
1496	1501	bewitchment cheaters riffled kerneling napoleons rifer	86	0
1508	1512	undermentioned outflanking funnyman commuted lachrymation floweret arcadian	86	0
553	1544	outflanking funnyman commuted lachrymation	163	0
623	1573	surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	256	0
95	1606	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological	86	0
262	1633	reaccepts gunneries exorcises pirog desexes summable heliocentricity	470	0
1637	1640	unremorsefully extradites stollens ponderers conditione loathly	163	0
926	1645	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons	470	0
943	1684	swiveled polers oinked apnea maxillary	7	0
130	1727	tautological jambing sodality outcrop slipcases	86	0
633	1738	gloves mohairs admiralties bewigged	69	0
896	1745	surges preheats loggias reconciliating photocatalyst lenity tautological	163	0
119	1784	gloves mohairs admiralties bewigged playgoers cheques batting	7	0
1156	1789	debiting parrots paraguayans resonates overbites terminals giros podgy vagus	7	0
796	1816	cheaters riffled kerneling napoleons rifer splinting	69	0
1806	1823	photocatalyst lenity tautological jambing sodality outcrop slipcases	69	0
1833	1834	petitionee brill neologic intermuscular	163	0
667	1848	cooked reformers goodwife technicolor plenishes	163	0
1747	1853	jambing sodality outcrop slipcases	7	0
791	1876	retrogressions eliminates unknowns mongoloids danker raunchiness	7	0
1856	1890	teashop reaccepts gunneries exorcises pirog desexes	86	0
812	1892	lachrymation floweret arcadian acridities unrealistic substituting surges preheats	69	0
476	1905	burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering	18	0
861	1912	gunneries exorcises pirog desexes	18	0
360	1917	unmuzzling measles decentralizing hogfishes	18	0
9	1920	redigesting ostinato recalculation safest signiory latchets inflecting	7	0
604	1931	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs	256	0
1504	1940	excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	86	0
348	1966	loathly cancels debiting parrots paraguayans resonates overbites terminals giros	69	0
1973	1975	midmonths labium peeped daydreams permuting immediately canzona interrelated cooked	7	0
929	1981	oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts	470	0
457	1988	playgoers cheques batting waspishly	470	0
628	1995	loftily yabber reprovingly blungers dwarflike	256	0
982	2000	mohairs admiralties bewigged playgoers	86	0
97	2007	anesthetization undermentioned outflanking funnyman commuted lachrymation	86	0
154	2012	slipcases phenylketonuria grunts venturers	69	0
957	2016	objurgate treaties preprocessor despising loftily	69	0
127	2020	richer succories dwelling scrapped	470	0
1918	2025	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	163	0
939	2026	recelebrating dually plateauing reoccupations embossers	470	0
40	2029	loathly cancels debiting parrots paraguayans resonates	256	0
229	2031	rifer splinting surmisers satisfying undamped sharpers	470	0
36	2037	recalculation safest signiory latchets inflecting trephines hops	256	0
1598	2056	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	86	0
1393	2069	firefanged skeins equalled sandwiching	163	0
938	2076	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	470	0
934	2085	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity	470	0
333	2092	floweret arcadian acridities unrealistic substituting surges	7	0
498	2096	teratoid coadjutors thuggeries nondestructive	256	0
59	2099	funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges	86	0
562	2103	lenity tautological jambing sodality	86	0
1706	2109	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	69	0
1660	2119	acridities unrealistic substituting surges preheats loggias	163	0
931	2122	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	470	0
55	2126	valiantly unremorsefully extradites stollens	470	0
50	49	kerneling napoleons rifer splinting surmisers satisfying undamped	7	0
77	76	conditione loathly cancels debiting parrots paraguayans resonates overbites	7	0
75	114	nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular	7	0
151	150	exorcises pirog desexes summable	69	0
193	192	pirog desexes summable heliocentricity	86	0
250	249	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	163	0
286	285	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	7	0
329	328	blungers dwarflike effulgences coreless	7	0
1819	2180	reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	18	0
2108	2182	cerebrum gloves mohairs admiralties	18	0
750	749	ponderers conditione loathly cancels debiting parrots paraguayans resonates	69	0
483	763	perspicuously disjoined nigglings midmonths labium peeped daydreams permuting	7	0
768	767	cerebrum gloves mohairs admiralties bewigged playgoers	163	0
933	2196	swiveled polers oinked apnea maxillary dumpers bering evasiveness	470	0
609	781	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	256	0
232	806	mongoloids danker raunchiness perspicuously disjoined	256	0
808	807	gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol	86	0
43	828	equalled sandwiching bewitchment cheaters	86	0
879	878	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	69	0
1548	2213	admiralties bewigged playgoers cheques batting waspishly stilbestrol	18	0
357	921	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	163	0
703	2216	heliocentricity excretions recelebrating dually	470	0
32	2217	kerneling napoleons rifer splinting surmisers	470	0
598	964	transcribed swifters redigesting ostinato recalculation safest	256	0
925	2230	stilbestrol villainousness miscalling firefanged skeins equalled	470	0
1097	1096	environs hulled preexamination oralogy tibetans	163	0
247	2235	arcadian acridities unrealistic substituting surges preheats loggias	470	0
1119	1118	funnyman commuted lachrymation floweret arcadian	7	0
647	1184	plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged	69	0
1206	1205	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	69	0
485	1249	bewitchment cheaters riffled kerneling napoleons rifer	7	0
565	1252	pasturage thurifer teazle fringier	256	0
25	24	recelebrating dually plateauing reoccupations embossers	7	0
873	1263	extradites stollens ponderers conditione loathly cancels debiting	7	0
388	1279	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier	7	0
537	536	scrapped prat islanded burlily thanklessly swiveled	18	0
1302	1301	skeins equalled sandwiching bewitchment	69	0
1145	1308	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	86	0
1267	1319	surges preheats loggias reconciliating photocatalyst	69	0
913	1351	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	163	0
716	1367	preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	7	0
260	259	desexes summable heliocentricity excretions recelebrating dually plateauing	18	0
543	1390	exec junketeers isolators reducing	7	0
319	1406	batting waspishly stilbestrol villainousness miscalling	256	0
417	1421	plateauing reoccupations embossers cerebrum gloves	86	0
440	439	prat islanded burlily thanklessly swiveled polers oinked	18	0
835	1471	brill neologic intermuscular fobbed transcribed	7	0
747	1474	overbites terminals giros podgy vagus kinkiest	69	0
624	1487	reaccepts gunneries exorcises pirog desexes summable	256	0
521	520	toto teashop reaccepts gunneries exorcises pirog	470	0
11	1521	summable heliocentricity excretions recelebrating dually plateauing	86	0
1342	1530	playgoers cheques batting waspishly stilbestrol villainousness miscalling	86	0
1002	1540	riffled kerneling napoleons rifer splinting surmisers satisfying undamped	86	0
47	1569	extradites stollens ponderers conditione loathly cancels debiting	69	0
157	693	excretions recelebrating dually plateauing	18	0
745	744	gloves mohairs admiralties bewigged playgoers cheques batting waspishly	470	0
599	1609	nonfiction retrogressions eliminates unknowns	256	0
1440	1627	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	86	0
1137	1636	sharpers forbearer anesthetization undermentioned	86	0
900	1657	surges preheats loggias reconciliating photocatalyst	86	0
347	1709	grunts venturers valiantly unremorsefully	256	0
175	1710	cancels debiting parrots paraguayans resonates overbites terminals giros	163	0
65	1723	brill neologic intermuscular fobbed transcribed	256	0
346	919	photocatalyst lenity tautological jambing sodality	470	0
188	1733	malines cliffhanger entailments reindexed bedstraws thoughtless	256	0
610	1741	neurosurgeon innervated hunts barrens emanative blowpipe varies	256	0
1537	1743	rifer splinting surmisers satisfying undamped	86	0
503	1786	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	163	0
186	1036	batting waspishly stilbestrol villainousness miscalling	470	0
122	1801	effulgences coreless tuberculoses environs	163	0
113	1812	anesthetization undermentioned outflanking funnyman	7	0
616	1814	manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds	256	0
1790	1831	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	86	0
460	1857	rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization	69	0
826	1881	skeins equalled sandwiching bewitchment cheaters	7	0
1736	1886	bounden occulters blubberer amenities desecrated tetrachlorides loutish	163	0
351	1888	venturers valiantly unremorsefully extradites stollens ponderers	7	0
1242	1241	dumpers bering evasiveness toto	18	0
\.



COPY "Person" ("ID", has_the_first_name, has_the_last_name, has_gender, "is_Conference_contributor", "is_Contribution_co-author", "is_Committee_member", "is_Chair", "is_Contribution_1th-author", "is_Reviewer", "TYPE") FROM stdin;
62	Fovro	Chung	f	t	t	f	f	f	f	0
168	Adolfa	Leuthauser	f	t	t	f	f	f	f	0
199	Marna	Crookshanks	f	t	t	f	f	f	f	0
214	Hagibis	Kihn	m	t	t	f	f	f	f	0
290	Yves	Hunsucker	m	t	t	f	f	f	f	0
294	Benita	Hatzenbuehler	m	t	t	f	f	f	f	0
296	Avniel	Debiase	m	t	t	f	f	f	f	0
424	Everardo	Yidiaris	f	t	t	f	f	f	f	0
434	Vasyklo	Netz	m	t	t	f	f	f	f	0
441	Clementine	Barga	m	t	t	f	f	f	f	0
494	Rico	Boronat	m	t	t	f	f	f	f	0
497	Faqueza	Correll	f	t	t	f	f	f	f	0
499	Gigi	Barfuss	m	t	t	f	f	f	f	0
564	Raktavira	Danforth	m	t	t	f	f	f	f	0
743	Rebeca	Aday	f	t	t	f	f	f	f	0
817	Gil	Holben	m	t	t	f	f	f	f	0
852	Giselher	Nibler	f	t	t	f	f	f	f	0
883	Tango	Constable	f	t	t	f	f	f	f	0
893	Rosamar	Wish	m	t	t	f	f	f	f	0
956	Toshimichi	Speth	m	t	t	f	f	f	f	0
960	Cloelia	Shein	f	t	t	f	f	f	f	0
1028	Dele	Galla	m	t	t	f	f	f	f	0
1038	Iulia	Morra	f	t	t	f	f	f	f	0
1053	Aberthol	Wilczak	m	t	t	f	f	f	f	0
1059	Liselotte	Groleau	f	t	t	f	f	f	f	0
1071	Graud	Shuker	m	t	t	f	f	f	f	0
1087	Herberta	Fullenwider	m	t	t	f	f	f	f	0
1095	Gerharde	Heidtbrink	f	t	t	f	f	f	f	0
1146	ra	Jansons	m	t	t	f	f	f	f	0
1148	Kyledyr	Constantino	f	t	t	f	f	f	f	0
1151	Cady	Schweizer	m	t	t	f	f	f	f	0
1154	Sharise	Heagy	f	t	t	f	f	f	f	0
1164	Maela	Chamley	f	t	t	f	f	f	f	0
1170	Yakamochi	Alonza	m	t	t	f	f	f	f	0
1221	Marce	Fiscalini	f	t	t	f	f	f	f	0
1294	Mirra	Tygart	m	t	t	f	f	f	f	0
1315	Gabriele	Darsey	f	t	t	f	f	f	f	0
1327	Amalia	Krajcik	m	t	t	f	f	f	f	0
1338	Rosalinde	Leinbach	m	t	t	f	f	f	f	0
1350	Torokanova	Kosloski	f	t	t	f	f	f	f	0
1532	Pazia	Comnick	f	t	t	f	f	f	f	0
1658	Jake	Bober	m	t	t	f	f	f	f	0
1679	Clariee	Martucci	m	t	t	f	f	f	f	0
1698	Aseel	Waddups	f	t	t	f	f	f	f	0
1750	Stacie	Ciesielski	f	t	t	f	f	f	f	0
1779	Feli	Trainham	f	t	t	f	f	f	f	0
1836	Xuqiu	Deller	m	t	t	f	f	f	f	0
1837	Zeanes	Hinsley	m	t	t	f	f	f	f	0
1849	Liebetraud	Kiddy	m	t	t	f	f	f	f	0
1852	Kobe	Guttirez	f	t	t	f	f	f	f	0
1859	Detana	Trautz	f	t	t	f	f	f	f	0
1873	Noburo	Charleton	m	t	t	f	f	f	f	0
1878	Jada	Grech	m	t	t	f	f	f	f	0
1915	Adamanta	Schlitt	m	t	t	f	f	f	f	0
1938	Janah	Moryl	f	t	t	f	f	f	f	0
2045	Freda	Freimuth	m	t	t	f	f	f	f	0
2091	Guiseppa	Thurstonson	m	t	t	f	f	f	f	0
2105	Momus	Rivadeneira	f	t	t	f	f	f	f	0
2124	Hedda	Yoshida	f	t	t	f	f	f	f	0
2135	Javier	Hausauer	f	t	t	f	f	f	f	0
2153	Marisa	Roufs	m	t	t	f	f	f	f	0
2194	Imelde	Ballin	f	t	t	f	f	f	f	0
2195	Janny	Mccaine	f	t	t	f	f	f	f	0
2246	Favio	Mutherspaw	m	t	t	f	f	f	f	0
2251	Plakida	Gothe	f	t	t	f	f	f	f	0
2255	Evgnios	Feasel	m	t	t	f	f	f	f	0
2268	Christelle	Garced	f	t	t	f	f	f	f	0
187	Pieter	Frend	m	t	t	f	f	f	f	5
372	Claudios	Lemmert	m	t	t	f	f	f	f	5
416	Jaen	Kerechanko	f	t	t	f	f	f	f	5
523	Shaka	Enget	f	t	t	f	f	f	f	5
875	Xylina	Mcnicoll	f	t	t	f	f	f	f	5
899	Julien	Triveno	m	t	t	f	f	f	f	5
2266	Hita	Porell	f	f	f	f	f	f	t	0
2227	Alon	Paulik	f	f	f	f	f	f	t	0
2068	Timotheos	Cazaree	f	f	f	f	f	f	t	0
251	Tasia	Ellenburg	f	f	f	f	f	f	t	0
172	Bernharda	Riese	f	f	f	f	f	f	t	0
1565	Emily	Mileski	f	f	f	f	f	f	t	0
1926	Coireall	Shelor	f	f	f	f	f	f	t	0
2166	LaReina	Iqbal	f	f	f	f	f	f	t	0
1844	Parma	Borgese	f	f	f	f	f	f	t	0
1628	Tamah	Misemer	f	f	f	f	f	f	t	0
1993	Dandrae	Dorne	f	f	f	f	f	f	t	0
2129	Melker	Kayastha	f	f	f	f	f	f	t	0
1877	Goncalo	Gahm	m	f	f	f	f	f	t	0
993	Shijo	Mccullon	m	f	f	f	f	f	t	0
996	Rodell	Sonnefeld	m	f	f	f	f	f	t	0
1382	Aonghas	Pashley	f	f	f	f	f	f	t	0
125	Vasuki	Riech	m	f	f	f	f	f	t	0
1518	Cadell	Parral	f	f	f	f	f	f	t	0
82	Hesperos	Schindele	m	f	f	f	f	f	t	0
1485	Ariela	Harpine	m	f	f	f	f	f	t	0
2176	Lamesha	Neher	f	f	f	f	f	f	t	0
1182	Matro	Newell	m	f	f	f	f	f	t	0
176	Adriaan	Belter	m	f	f	f	f	f	t	0
389	Paco	Filary	f	f	f	f	f	f	t	0
1952	Kotaro	Leitheiser	f	f	f	f	f	f	t	0
243	Elvera	Zito	f	f	f	f	f	f	t	0
1773	Ashakiran	Bingley	f	f	f	f	f	f	t	0
2168	Wolfhild	Torros	f	f	f	f	f	f	t	0
2257	Apela	Brewton	f	f	f	f	f	f	t	0
718	Breana	Scheffler	m	f	f	f	f	f	t	0
2131	Raffaello	Herard	m	f	f	f	f	f	t	0
1300	Husain	Coaxum	f	f	f	f	f	f	t	0
392	Gengyo	Cumbass	m	f	f	f	f	f	t	0
886	Ekantika	Bisogno	m	f	f	f	f	f	t	0
641	Triesha	Carland	f	f	f	f	f	f	t	0
794	Faas	Chitty	f	f	f	f	f	f	t	0
269	Kemina	Wyke	f	f	f	f	f	f	t	0
1387	Bruno	Barthe	m	f	f	f	f	f	t	0
863	Lowell	Kostka	f	f	f	f	f	f	t	0
631	Alala	Cilento	f	f	f	f	f	f	t	0
722	Loreliese	Aspri	f	f	f	f	f	f	t	0
1253	Anissa	Sciarretta	f	f	f	f	f	f	t	0
989	Radosha	Ferioli	f	f	f	f	f	f	t	0
662	Agamemnon	Bouras	m	f	f	f	f	f	t	0
1610	Yuka	Heikes	f	f	f	f	f	f	t	0
1945	Becca	Curney	m	f	f	f	f	f	t	0
2117	Traci	Erazmus	f	f	f	f	f	f	t	0
780	Arno	Barquera	f	f	f	f	f	f	t	0
728	Crysta	Mateen	f	f	f	f	f	f	t	0
1576	Gerke	Ostermeyer	m	f	f	f	f	f	t	0
2083	Gerik	Ferries	f	f	f	f	f	f	t	0
548	Amba	Guidos	f	f	f	f	f	f	t	0
1583	Wilhelm	Juart	f	f	f	f	f	f	t	0
1996	Naazil	Buchannan	m	f	f	f	f	f	t	0
2110	Florentyna	Cost	f	f	f	f	f	f	t	0
352	Materia	Newsum	m	f	f	f	f	f	t	0
1734	Garrett	Blair	f	f	f	f	f	f	t	0
1737	Ingetrud	Balezentis	f	f	f	f	f	f	t	0
1434	Pascale	Skripko	f	f	f	f	f	f	t	0
1515	Elan	Malloch	m	f	f	f	f	f	t	0
1291	Leonarda	Imai	f	f	f	f	f	f	t	0
1589	Ludovica	Diekmann	f	f	f	f	f	f	t	0
2100	Ariana	Berardinelli	f	f	f	f	f	f	t	0
1083	Feofana	Knudsen	f	f	f	f	f	f	t	0
2231	Sharisha	Gebhart	m	f	f	f	f	f	t	0
2244	Fjodora	Sleger	m	f	f	f	f	f	t	0
563	Jokin	Hytros	m	f	f	f	f	f	t	0
1343	Angel	Delcarmen	f	f	f	f	f	f	t	0
1527	Jennie	Schatzel	f	f	f	f	f	f	t	0
101	Asisa	Finke	f	f	f	f	f	f	t	0
2222	Zytka	Skeete	m	f	f	f	f	f	t	0
2040	Pete	Salada	f	f	f	f	f	f	t	0
2250	Ryo	Zanders	f	f	f	f	f	f	t	0
1780	Berakhiah	Province	m	f	f	f	f	f	t	0
874	Aracely	Kuka	m	f	f	f	f	f	t	0
782	Harumi	Valenza	m	f	f	f	f	f	t	0
2143	Hellmut	Tousant	f	f	f	f	f	f	t	0
37	Kywrkh	Tomaino	m	f	f	f	f	f	t	0
1725	Isadoro	Bently	m	f	f	f	f	f	t	0
1724	Uliaanitsa	Samul	m	f	f	f	f	f	t	0
2146	Terao	Asley	f	f	f	f	f	f	t	0
941	Satoru	Beaumont	f	f	f	f	f	f	t	0
1401	Inayat	Deignan	m	f	f	f	f	f	t	0
1987	Dores	Hugi	m	f	f	f	f	f	t	0
2024	Abderus	Boston	m	f	f	f	f	f	t	0
239	Krystyn	Slutsky	f	f	f	f	f	f	t	0
850	Severin	Buzard	m	f	f	f	f	f	t	0
1062	Aishwarya	Hallmon	f	f	f	f	f	f	t	0
2066	Phoolan	Mackie	m	f	f	f	f	f	t	0
978	Twain	Sannon	m	f	f	f	f	f	t	0
1584	Vychan	Stotz	m	f	f	f	f	f	t	0
545	Kazuhiko	Campas	f	f	f	f	f	f	t	0
465	Kiuprila	Inscore	m	f	f	f	f	f	t	0
1860	Masakazu	Lisko	m	f	f	f	f	f	t	0
2130	Lyron	Strawder	m	f	f	f	f	f	t	0
386	Abbie	Manjarres	f	f	f	f	f	f	t	0
1899	Ivonne	Elreda	f	f	f	f	f	f	t	0
1361	ris	Kotter	m	f	f	f	f	f	t	0
1581	Teodoro	Coyt	m	f	f	f	f	f	t	0
1964	Mita	Schwering	m	f	f	f	f	f	t	0
1887	Aetos	Bitar	f	f	f	f	f	f	t	0
1963	Kaspar	Reierson	f	f	f	f	f	f	t	0
2034	Holda	Dible	f	f	f	f	f	f	t	0
507	Tetsui	Zekria	f	f	f	f	f	f	t	0
2058	Tekusa	Houlberg	f	f	f	f	f	f	t	0
1759	Vrata	Socks	f	f	f	f	f	f	t	0
1479	Newa	Sabina	f	f	f	f	f	f	t	0
1578	Angha	Bievenue	m	f	f	f	f	f	t	0
363	Irmgard	Accala	m	f	f	f	f	f	t	0
1608	Ora	Poleyestewa	f	f	f	f	f	f	t	0
1486	Zotico	Cerrano	m	f	f	f	f	f	t	0
1297	Lashaune	Lava	f	f	f	f	f	f	t	0
282	Sadayoshi	Englemann	f	f	f	f	f	f	t	0
1795	Sibylla	Reas	m	f	f	f	f	f	t	0
279	Zarek	Laasaga	f	f	f	f	f	f	t	0
2089	Teana	Stallworth	m	f	f	f	f	f	t	0
1519	Leopoldina	Alvey	m	f	f	f	f	f	t	0
1729	Emmanoul	Gianunzio	m	f	f	f	f	f	t	0
1392	Ashley	Kesselring	f	f	f	f	f	f	t	0
901	Hilmiyya	Pagon	m	f	f	f	f	f	t	0
2174	Sebina	Prakoth	m	f	f	f	f	f	t	0
1103	Izazkun	Suleski	f	f	f	f	f	f	t	0
1942	Estrelle	Wedgworth	m	f	f	f	f	f	t	0
1782	Natascha	Neverson	f	f	f	f	f	f	t	0
737	Maksimina	Pecinousky	m	f	f	f	f	f	t	0
1286	Hoitsu	Mccahill	f	f	f	f	f	f	t	0
2248	Kerstine	Finders	m	f	f	f	f	f	t	0
44	Hilario	Kovats	m	f	f	f	f	f	t	0
1250	Clarinda	Oberg	m	f	f	f	f	f	t	0
2041	Lubachitsa	Husch	m	f	f	f	f	f	t	0
2239	Korotskovaia	Stowell	m	f	f	f	f	f	t	0
1181	Swidbert	Repka	m	f	f	f	f	f	t	0
1824	Dunja	Luchenbill	m	f	f	f	f	f	t	0
1655	Ieshia	Demarrais	m	f	f	f	f	f	t	0
2219	Juichi	Porep	m	f	f	f	f	f	t	0
1985	Otylia	Lowdermilk	f	f	f	f	f	f	t	0
1035	Salmoneus	Duncans	f	f	f	f	f	f	t	0
1285	Guiletta	Rosek	m	f	f	f	f	f	t	0
344	Jafar	Abbenante	f	f	f	f	f	f	t	0
1411	Thanaa	Bustos	f	f	f	f	f	f	t	0
917	Shiko	Seagroves	f	f	f	f	f	f	t	0
2198	Bruna	Nervis	m	f	f	f	f	f	t	0
1413	Cicely	Genna	m	f	f	f	f	f	t	0
1933	Ladinka	Ehiginator	m	f	f	f	f	f	t	0
1369	Alfonso	Billen	m	f	f	f	f	f	t	0
2226	Yayang	Kuczenski	m	f	f	f	f	f	t	0
481	Burkhard	Hussein	m	f	f	f	f	f	t	0
1453	Korotsek	Baltzell	f	f	f	f	f	f	t	0
1799	Baucis	Campese	m	f	f	f	f	f	t	0
379	Angelica	Maccarter	m	f	f	f	f	f	t	0
2252	Ehud	Bazzle	f	f	f	f	f	f	t	0
2276	Clarine	Waynick	f	f	f	f	f	f	t	0
1642	Muzammil	Mutter	f	f	f	f	f	f	t	0
755	Eberhardine	Hazim	f	f	f	f	f	f	t	0
760	Tashiya	Marrable	m	f	f	f	f	f	t	0
1178	Hortencia	Brenda	m	f	f	f	f	f	t	0
959	Lene	Vosquez	m	f	f	f	f	f	t	0
1539	Benignus	Diec	f	f	f	f	f	f	t	0
1803	Liebtraud	Schorsch	m	f	f	f	f	f	t	0
1651	Bernhareda	Mcclenny	f	f	f	f	f	f	t	0
2113	Gyoergy	Rakoci	m	f	f	f	f	f	t	0
1204	Enya	Coll	f	f	f	f	f	f	t	0
2193	Jamie	Berrie	m	f	f	f	f	f	t	0
2158	Lex	Hoven	f	f	f	f	f	f	t	0
1404	Adwr	Liiv	f	f	f	f	f	f	t	0
923	Oscar	Formica	f	f	f	f	f	f	t	0
1631	Vedetta	Pilkins	f	f	f	f	f	f	t	0
1572	Nandin	Uribazo	m	f	f	f	f	f	t	0
1461	Sophronia	Peakes	m	f	f	f	f	f	t	0
1408	Krispin	Macnamee	m	f	f	f	f	f	t	0
1695	Alonza	Galyan	f	f	f	f	f	f	t	0
1438	Sasson	Kniffin	m	f	f	f	f	f	t	0
792	Seinosuke	Grimaldi	m	f	f	f	f	f	t	0
833	Kazushige	Goeppner	m	f	f	f	f	f	t	0
1359	Delmara	Mrazek	m	f	f	f	f	f	t	0
789	Luithilde	Brandolino	m	f	f	f	f	f	t	0
2241	Cato	Himmelwright	f	f	f	f	f	f	t	0
1702	NewyddIlyn	Borchers	f	f	f	f	f	f	t	0
1614	Virgilio	Englander	m	f	f	f	f	f	t	0
914	Jamuna	Orts	f	f	f	f	f	f	t	0
1755	Kantha	Lybert	f	f	f	f	f	f	t	0
2010	Saahir	Muto	f	f	f	f	f	f	t	0
1954	Kozue	Efthimiou	f	f	f	f	f	f	t	0
655	Bailee	Chabolla	f	f	f	f	f	f	t	0
378	Daya	Luhr	f	f	f	f	f	f	t	0
1951	Iselle	Churches	f	f	f	f	f	f	t	0
1026	Elvis	Rocasah	f	f	f	f	f	f	t	0
2206	Pantyslawa	Pemble	f	f	f	f	f	f	t	0
573	Sebastiano	Lockyer	m	f	f	f	f	f	t	0
2005	Faatin	Bonn	f	f	f	f	f	f	t	0
1331	Bussho	Oda	m	f	f	f	f	f	t	0
1160	Edmondo	Rommelfanger	m	f	f	f	f	f	t	0
2138	Sanya	Parma	f	f	f	f	f	f	t	0
1473	Eijiro	Majied	f	f	f	f	f	f	t	0
270	Elli	Asner	m	f	f	f	f	f	t	0
10	Barsha	Murrain	m	t	t	f	f	f	t	0
21	Melisa	Patriarco	m	t	t	f	f	f	t	0
28	Kit	Storrs	m	t	t	f	f	f	t	0
34	Duron	Dibella	f	t	t	f	f	f	t	0
57	Jonam	Steinle	f	t	t	f	f	f	t	0
66	Huaning	Zwolski	f	t	t	f	f	f	t	0
93	Jamaall	Rohen	f	t	t	f	f	f	t	0
103	Maysak	Anetsberger	m	t	t	f	f	f	t	0
164	Daris	Astley	m	t	t	f	f	f	t	0
171	Dondrea	Crocco	m	t	t	f	f	f	t	0
180	Solange	Alson	f	t	t	f	f	f	t	0
181	Tydeus	Dyckman	m	t	t	f	f	f	t	0
198	Zanthe	Felarca	m	t	t	f	f	f	t	0
203	Angela	Hager	m	t	t	f	f	f	t	0
206	Che	Kess	m	t	t	f	f	f	t	0
230	Cyril	Croslen	f	t	t	f	f	f	t	0
254	Inejiro	Javens	m	t	t	f	f	f	t	0
261	Loke	Tuton	m	t	t	f	f	f	t	0
276	Giovanna	Douthit	m	t	t	f	f	f	t	0
303	Trina	Sjerven	f	t	t	f	f	f	t	0
6	Hypnos	Blank	m	t	t	t	f	f	t	0
310	Garon	Tischler	m	t	t	f	f	f	t	0
321	Richild	Brinius	f	t	t	f	f	f	t	0
331	Kellie	Frenner	m	t	t	f	f	f	t	0
334	Edmonda	Ditullio	m	t	t	f	f	f	t	0
338	Taaliba	Debrita	f	t	t	f	f	f	t	0
355	Uleia	Mineah	m	t	t	f	f	f	t	0
358	Gavriella	Sasson	m	t	t	f	f	f	t	0
399	Makhna	Stabile	m	t	t	f	f	f	t	0
412	Yoriko	Boot	f	t	t	f	f	f	t	0
442	Datja	Carner	m	t	t	f	f	f	t	0
446	Anbessa	Gulde	f	t	t	f	f	f	t	0
477	Argos	Cumings	f	t	t	f	f	f	t	0
480	Dayu	Vient	m	t	t	f	f	f	t	0
486	Sigurd	Mahli	m	t	t	f	f	f	t	0
506	Takako	Nordine	m	t	t	f	f	f	t	0
515	Misty	Holladay	m	t	t	f	f	f	t	0
568	Latoya	Lovato	f	t	t	f	f	f	t	0
576	Lottchen	Pillitteri	f	t	t	f	f	f	t	0
635	Vasilista	Hamic	f	t	t	f	f	f	t	0
666	Deverell	Anez	f	t	t	f	f	f	t	0
673	Dianmu	Aver	f	t	t	f	f	f	t	0
688	Octave	Diana	m	t	t	f	f	f	t	0
692	Tarran	Pointer	m	t	t	f	f	f	t	0
699	Handy	Ratajczak	f	t	t	f	f	f	t	0
709	Einian	Frascella	m	t	t	f	f	f	t	0
712	Ayla	Moncrief	f	t	t	f	f	f	t	0
717	Solymar	Palisbo	f	t	t	f	f	f	t	0
724	Silvester	Yelvington	m	t	t	f	f	f	t	0
775	Hidemichi	Tropp	f	t	t	f	f	f	t	0
801	Lucile	Homola	f	t	t	f	f	f	t	0
803	Sander	Garriss	m	t	t	f	f	f	t	0
827	Kim	Colombe	f	t	t	f	f	f	t	0
849	Carli	Maggert	f	t	t	f	f	f	t	0
862	Jenna	Ovit	m	t	t	f	f	f	t	0
867	Asami	Sellek	m	t	t	f	f	f	t	0
870	Radoste	Hoefling	m	t	t	f	f	f	t	0
905	Juriaan	Schremp	f	t	t	f	f	f	t	0
908	Kristin	Sandhu	m	t	t	f	f	f	t	0
948	Alyss	Wuitschick	m	t	t	f	f	f	t	0
951	Gerakna	Ryneer	m	t	t	f	f	f	t	0
968	Letizia	Madaras	f	t	t	f	f	f	t	0
973	Luitfriede	Westmark	f	t	t	f	f	f	t	0
983	Haimo	Huesso	m	t	t	f	f	f	t	0
1003	Blanca	Ursery	f	t	t	f	f	f	t	0
1009	Krosa	Kuney	f	t	t	f	f	f	t	0
1041	Evi	Heidebrecht	f	t	t	f	f	f	t	0
1067	Muni	Mccuiston	m	t	t	f	f	f	t	0
1075	Uchdryd	Locicero	m	t	t	f	f	f	t	0
1080	Taliyah	Jafari	m	t	t	f	f	f	t	0
1101	Iravati	Pizzolato	f	t	t	f	f	f	t	0
1105	Miles	Manero	m	t	t	f	f	f	t	0
1112	Ineng	Alkbsh	m	t	t	f	f	f	t	0
1122	Calida	Starace	m	t	t	f	f	f	t	0
1127	Yaineris	Francisco	m	t	t	f	f	f	t	0
1128	Evamarie	Coraham	m	t	t	f	f	f	t	0
1131	Patroklus	Hertel	m	t	t	f	f	f	t	0
1132	Irminwin	Milloy	f	t	t	f	f	f	t	0
1135	Dewayne	Buttermore	m	t	t	f	f	f	t	0
1143	Gia	Stonesifer	m	t	t	f	f	f	t	0
1223	Helene	Nik	m	t	t	f	f	f	t	0
1256	Miloushka	Pezez	f	t	t	f	f	f	t	0
1262	Kakuei	Blanford	f	t	t	f	f	f	t	0
1271	Nessa	Thomison	m	t	t	f	f	f	t	0
1274	Odysseus	Dilthey	m	t	t	f	f	f	t	0
1278	Aristomnis	Dauber	f	t	t	f	f	f	t	0
1320	Cathy	Phebus	m	t	t	f	f	f	t	0
1321	Erechtheus	Muschick	f	t	t	f	f	f	t	0
1324	Erminia	Damrell	f	t	t	f	f	f	t	0
1328	Tatsukichi	Gerstenberger	m	t	t	f	f	f	t	0
1352	Toku	Synowiec	f	t	t	f	f	f	t	0
1377	Korechika	Mamer	f	t	t	f	f	f	t	0
1391	Iasion	Kirt	f	t	t	f	f	f	t	0
1426	Cassian	Cozzy	f	t	t	f	f	f	t	0
1429	Socorro	Mcsorley	m	t	t	f	f	f	t	0
1451	Ieshige	Kosinski	m	t	t	f	f	f	t	0
1459	Pilib	Seu	f	t	t	f	f	f	t	0
1460	Graziana	Callabrass	f	t	t	f	f	f	t	0
1463	Caryn	Grudzinski	m	t	t	f	f	f	t	0
1470	Lilja	Siwiec	m	t	t	f	f	f	t	0
1481	Mikolas	Sirman	m	t	t	f	f	f	t	0
1494	Shesha	Humbird	m	t	t	f	f	f	t	0
1506	Loris	Elder	f	t	t	f	f	f	t	0
1509	Koshiro	Augusto	f	t	t	f	f	f	t	0
1510	Liska	Lambourne	f	t	t	f	f	f	t	0
1525	Soshu	Burress	f	t	t	f	f	f	t	0
1545	Aida	Appelt	f	t	t	f	f	f	t	0
1562	Mawar	Camfield	m	t	t	f	f	f	t	0
1568	Yae	Timblin	f	t	t	f	f	f	t	0
1604	Mora	Christofferse	m	t	t	f	f	f	t	0
1615	Eshita	Whitby	f	t	t	f	f	f	t	0
1625	Francoise	Rioux	f	t	t	f	f	f	t	0
1667	Vladlena	Tlumacki	f	t	t	f	f	f	t	0
1685	Dama	Leino	m	t	t	f	f	f	t	0
1716	Sam	Mattheis	m	t	t	f	f	f	t	0
1718	Conchetta	Cater	f	t	t	f	f	f	t	0
1765	Brenda	Varley	f	t	t	f	f	f	t	0
1771	JamAan	Kine	f	t	t	f	f	f	t	0
1772	Gizla	Nordmark	m	t	t	f	f	f	t	0
1787	Cherry	Dolence	m	t	t	f	f	f	t	0
1794	Krystal	Farria	m	t	t	f	f	f	t	0
1821	Lance	Fernandes	f	t	t	f	f	f	t	0
1822	Jazmine	Susman	m	t	t	f	f	f	t	0
1829	Este	Manon	m	t	t	f	f	f	t	0
1870	Aandranee	Sakamaki	m	t	t	f	f	f	t	0
1884	Katreen	Osthoff	f	t	t	f	f	f	t	0
2006	Nana	Stania	f	t	t	f	f	f	t	0
2015	Tera	Vigen	m	t	t	f	f	f	t	0
2023	Maeko	Kontogiannis	m	t	t	f	f	f	t	0
2057	Nisus	Coby	m	t	t	f	f	f	t	0
2071	Immanuel	Bugos	m	t	t	f	f	f	t	0
2104	Brys	Robak	m	t	t	f	f	f	t	0
2132	Reiko	Castile	f	t	t	f	f	f	t	0
2142	Chebi	Selking	f	t	t	f	f	f	t	0
2145	Shahaama	Berum	m	t	t	f	f	f	t	0
2202	Madaleno	Bercier	m	t	t	f	f	f	t	0
2204	Frangiskos	Truly	m	t	t	f	f	f	t	0
2262	Lili	Atoe	f	t	t	f	f	f	t	0
1454	Shizu	Capener	f	f	f	t	f	f	t	0
1800	Xiomara	Plowe	f	f	f	t	f	f	t	0
2139	Galni	Mclarty	f	f	f	t	f	f	t	0
1673	Kaveri	Zombro	f	f	f	t	f	f	t	0
759	Latorray	Delawder	f	f	f	t	f	f	t	0
300	Patrizio	Iliffe	f	f	f	t	f	f	t	0
56	Raimund	Widdowson	f	f	f	t	f	f	t	0
998	Cenon	Colon	f	f	f	t	f	f	t	0
1210	Libera	Ahlborn	m	f	f	t	f	f	t	0
1488	Dijana	Murfin	f	f	f	t	f	f	t	0
144	Emina	Yeeloy	m	f	f	t	f	f	t	0
48	Sypovaia	Wegmann	m	f	f	t	f	f	t	0
143	Karita	Sukovich	f	f	f	t	f	f	t	0
584	Vseslava	Szollosi	f	f	f	t	f	f	t	0
142	Olzhbeta	Hasenberg	m	t	t	t	f	f	t	0
158	Eskil	Littledave	m	t	t	t	f	f	t	0
585	Tekla	Gallerani	f	t	t	t	f	f	t	0
1815	Riddhi	Colesar	m	t	t	t	f	f	t	0
823	Raaid	Chrispen	m	f	f	t	t	f	t	0
558	Casswallawn	Scheiblich	m	t	t	t	t	f	t	0
1396	Jace	Ruotolo	m	t	t	t	t	f	t	0
5	Breonia	Gierling	m	t	t	f	f	f	f	1
8	Amir	Conkling	f	t	t	f	f	f	f	1
236	Gerald	Fieselman	m	t	t	f	f	f	f	1
359	Barbi	Denery	m	t	t	f	f	f	f	1
740	Gisselle	Teigen	f	t	t	f	f	f	f	1
890	Hortense	Ganotisi	f	t	t	f	f	f	f	1
961	Jakoba	Bueche	f	t	t	f	f	f	f	1
1054	Annunziata	Ravi	f	t	t	f	f	f	f	1
1057	Marlene	Dague	f	t	t	f	f	f	f	1
1162	Luca	Dolbin	f	t	t	f	f	f	f	1
1168	Kea	Croshaw	f	t	t	f	f	f	f	1
1203	Yumiko	Ginther	m	t	t	f	f	f	f	1
1209	Rhea	Platas	f	t	t	f	f	f	f	1
1237	Walto	Messman	f	t	t	f	f	f	f	1
1289	Natasia	Sliter	m	t	t	f	f	f	f	1
1310	Chesell	Vatter	m	t	t	f	f	f	f	1
1370	Vonda	Jasmine	f	t	t	f	f	f	f	1
1458	Toyoaki	Richoux	f	t	t	f	f	f	f	1
1526	Bozena	Tilly	m	t	t	f	f	f	f	1
1654	Saer	Dillenbeck	f	t	t	f	f	f	f	1
1662	Bhavin	Primavera	m	t	t	f	f	f	f	1
1665	Primavera	Huffstickler	m	t	t	f	f	f	f	1
1744	Tamiko	Docken	f	t	t	f	f	f	f	1
1763	Myshka	Krishnamurthy	m	t	t	f	f	f	f	1
1826	Fajyaz	Mutana	f	t	t	f	f	f	f	1
1850	Honey	Eidinger	m	t	t	f	f	f	f	1
1863	Eber	Ebinger	m	t	t	f	f	f	f	1
1904	Janita	Bolieu	f	t	t	f	f	f	f	1
1978	Muna	Lastovica	m	t	t	f	f	f	f	1
2011	Iken	Siluis	f	t	t	f	f	f	f	1
2073	Janeka	Hochhalter	f	t	t	f	f	f	f	1
2077	Garca	Diers	f	t	t	f	f	f	f	1
2088	Sajag	Traunfeld	f	t	t	f	f	f	f	1
2098	Matashichi	Butman	f	t	t	f	f	f	f	1
2102	Gerlind	Boomershine	f	t	t	f	f	f	f	1
2111	Vrotsislava	Bouman	m	t	t	f	f	f	f	1
2150	Yukako	Klingbeil	m	t	t	f	f	f	f	1
2173	Oryan	Mirles	m	t	t	f	f	f	f	1
2189	Urako	Staker	m	t	t	f	f	f	f	1
2223	Alka	Groshek	m	t	t	f	f	f	f	1
2233	Bennet	Melendes	f	t	t	f	f	f	f	1
2253	Clmentine	Engellant	f	t	t	f	f	f	f	1
2259	Tsuruki	Hazelrigg	f	t	t	f	f	f	f	1
2264	Sherry	Mullennix	m	t	t	f	f	f	f	1
23	Booker	Spiker	f	t	t	f	f	f	t	1
33	Galyn	Stobie	m	t	t	f	f	f	t	1
41	Athindoros	Shurgot	m	t	t	f	f	f	t	1
89	Miranda	Leinen	m	t	t	f	f	f	t	1
92	Lexi	Faulk	m	t	t	f	f	f	t	1
105	Eileen	Heick	m	t	t	f	f	f	t	1
73	Demont	Escalet	m	t	t	f	f	f	t	5
79	Chikafusa	Koolman	f	t	t	f	f	f	t	5
309	Mikio	Brunston	m	t	t	f	f	f	t	5
415	Bezubaia	Wiece	m	t	t	f	f	f	t	5
438	Aspasa	Abaunza	m	t	t	f	f	f	t	5
474	Oka	Prock	f	t	t	f	f	f	t	5
489	Bhoomika	Secord	f	t	t	f	f	f	t	5
836	Davida	Rho	m	t	t	f	f	f	t	5
1023	Seriozhenka	Homen	f	t	t	f	f	f	t	5
109	Dirthe	Kiewiet	m	t	t	f	f	f	t	1
117	Tienne	Segraves	f	t	t	f	f	f	t	1
120	Eligius	Vanwechel	f	t	t	f	f	f	t	1
126	Martina	Mcclary	f	t	t	f	f	f	t	1
131	Tatiiana	Sublett	m	t	t	f	f	f	t	1
134	Demetria	Tramonti	f	t	t	f	f	f	t	1
135	Atsumichi	Licano	m	t	t	f	f	f	t	1
145	Houke	Luthe	f	t	t	f	f	f	t	1
191	Anthony	Row	f	t	t	f	f	f	t	1
209	Arcadia	Granade	f	t	t	f	f	f	t	1
222	Akina	Jang	m	t	t	f	f	f	t	1
248	Juanisha	Seppi	m	t	t	f	f	f	t	1
289	Shinji	Kapler	f	t	t	f	f	f	t	1
327	Ofelia	Golde	m	t	t	f	f	f	t	1
339	Gorshedna	Marone	m	t	t	f	f	f	t	1
366	Hasnaa	Sietsema	f	t	t	f	f	f	t	1
421	Malcolm	Voelz	f	t	t	f	f	f	t	1
429	Latrice	Ghrist	m	t	t	f	f	f	t	1
451	Erik	Strothmann	f	t	t	f	f	f	t	1
454	Alexandros	Lagazo	f	t	t	f	f	f	t	1
514	Barbie	Dubonnet	f	t	t	f	f	f	t	1
530	Shontal	Sehnert	f	t	t	f	f	f	t	1
535	Gustel	Pitek	m	t	t	f	f	f	t	1
555	Elif	Gameros	m	t	t	f	f	f	t	1
580	Heidelore	Ruschmann	f	t	t	f	f	f	t	1
588	Atsumori	Bloyer	f	t	t	f	f	f	t	1
597	Teriuihi	Lachner	m	t	t	f	f	f	t	1
634	Fedorav	Solich	m	t	t	f	f	f	t	1
638	Roseann	Ora	f	t	t	f	f	f	t	1
652	Tadao	Pentaris	m	t	t	f	f	f	t	1
677	Motoyasu	Calligy	m	t	t	f	f	f	t	1
686	Toyoko	Colden	f	t	t	f	f	f	t	1
697	Oleka	Tommasino	f	t	t	f	f	f	t	1
713	Kinaana	Kodera	m	t	t	f	f	f	t	1
753	Gratia	Flach	m	t	t	f	f	f	t	1
756	Notburg	Towber	m	t	t	f	f	f	t	1
765	Nik	Reposa	m	t	t	f	f	f	t	1
770	Warona	Pelligrino	f	t	t	f	f	f	t	1
783	Lucretia	Ferndez	m	t	t	f	f	f	t	1
805	Trillare	Stukel	f	t	t	f	f	f	t	1
810	Tyonna	Sturdevant	f	t	t	f	f	f	t	1
831	Michizane	Krips	f	t	t	f	f	f	t	1
841	Caddock	Stagowski	f	t	t	f	f	f	t	1
885	Mamie	Howen	f	t	t	f	f	f	t	1
946	Daniel	Harriston	m	t	t	f	f	f	t	1
967	Fedoritsa	Stinner	f	t	t	f	f	f	t	1
974	Karina	Eggington	m	t	t	f	f	f	t	1
1005	Reece	Raburn	m	t	t	f	f	f	t	1
1010	Alona	Lucario	f	t	t	f	f	f	t	1
1044	Nonna	Laplaunt	m	t	t	f	f	f	t	1
1049	Nolan	Brownle	f	t	t	f	f	f	t	1
1077	Safiyya	Letchaw	f	t	t	f	f	f	t	1
1090	Igone	Rader	f	t	t	f	f	f	t	1
1092	Aleydis	Virgadamo	f	t	t	f	f	f	t	1
1186	Firdaus	Casavez	f	t	t	f	f	f	t	1
1196	Maureo	Benedict	f	t	t	f	f	f	t	1
1226	Shaakira	Ricklefs	f	t	t	f	f	f	t	1
1232	Agpios	Bia	m	t	t	f	f	f	t	1
1248	Faith	Neeld	f	t	t	f	f	f	t	1
1282	Hilary	Braddy	f	t	t	f	f	f	t	1
1298	Torah	Giller	m	t	t	f	f	f	t	1
1318	Tramaine	Scruton	m	t	t	f	f	f	t	1
1346	Lloyd	Stallsmith	m	t	t	f	f	f	t	1
1363	Sanaaa	Yoneda	f	t	t	f	f	f	t	1
1378	Ernst	Bengtson	m	t	t	f	f	f	t	1
1403	Shoko	Moel	m	t	t	f	f	f	t	1
1425	Deelon	Sephton	m	t	t	f	f	f	t	1
1433	Hannele	Kneifl	m	t	t	f	f	f	t	1
1441	Wira	Majette	m	t	t	f	f	f	t	1
1449	Wava	Goubeaux	f	t	t	f	f	f	t	1
1500	Flaca	Sodawasser	m	t	t	f	f	f	t	1
1538	Akila	Terlizzi	m	t	t	f	f	f	t	1
1591	Grite	Faddis	m	t	t	f	f	f	t	1
1629	Dewi	Rappleyea	m	t	t	f	f	f	t	1
1675	Dymas	Houskeeper	m	t	t	f	f	f	t	1
1693	Cleveland	Navarez	f	t	t	f	f	f	t	1
1732	Inez	Meeroff	m	t	t	f	f	f	t	1
1762	Flaco	Reyome	m	t	t	f	f	f	t	1
1807	Deke	Mirabelli	m	t	t	f	f	f	t	1
1866	Colombe	Bermea	m	t	t	f	f	f	t	1
1893	Alwin	Roewe	f	t	t	f	f	f	t	1
1944	Lucrecia	Rollings	f	t	t	f	f	f	t	1
2022	Effie	Menzie	m	t	t	f	f	f	t	1
2164	Mya	Swilley	f	t	t	f	f	f	t	1
2199	Valentina	Topia	f	t	t	f	f	f	t	1
2245	Leonora	Peli	m	t	t	f	f	f	t	1
313	Adrien	Hoit	f	t	t	t	f	f	t	1
800	Llyn	Hardge	f	t	t	t	f	f	t	1
1120	Charlette	Negron	m	t	t	t	f	f	t	1
1464	Brittani	Gasman	f	t	t	t	f	f	t	1
1644	Cindi	Ginanni	f	t	t	t	f	f	t	1
141	Uqbah	Oconnell	m	t	t	t	t	f	t	1
403	Ernestine	Barkan	m	t	t	t	t	f	t	1
910	Waliyya	Dandrea	f	t	t	f	f	f	f	5
953	Volotkoveia	Klees	f	t	t	f	f	f	f	5
992	Donald	Ludlow	f	t	t	f	f	f	f	5
1030	Lacrasha	Slavick	m	t	t	f	f	f	f	5
1283	Lilly	Rissanen	m	t	t	f	f	f	f	5
1357	Shoichi	Mathey	m	t	t	f	f	f	f	5
1466	Danaus	Dacanay	m	t	t	f	f	f	f	5
1475	Salaah	Elio	f	t	t	f	f	f	f	5
1550	Majdiyya	Bonsall	m	t	t	f	f	f	f	5
1728	Amora	Ockmond	f	t	t	f	f	f	f	5
1769	Kiyoemon	Wesby	m	t	t	f	f	f	f	5
1868	Lone	Pavese	f	t	t	f	f	f	f	5
1909	Aurelian	Fealy	m	t	t	f	f	f	f	5
1967	Dyllan	Mairs	m	t	t	f	f	f	f	5
2003	Tsumemasa	Lloyd	f	t	t	f	f	f	f	5
2218	Cellina	Schlosser	f	t	t	f	f	f	f	5
2232	Aedd	Lurye	m	t	t	f	f	f	f	5
2269	Saalim	Velasquez	m	t	t	f	f	f	f	5
3	Flora	Aveni	f	t	f	f	f	t	f	5
14	Ruwaid	Solian	f	t	f	f	f	t	f	5
22	Yemena	Knebel	f	t	f	f	f	t	f	5
51	Casandra	Shire	m	t	f	f	f	t	f	5
71	Bia	Klemme	m	t	f	f	f	t	f	5
74	Zeenab	Lasane	f	t	f	f	f	t	f	5
85	Eupeithes	Bevens	m	t	f	f	f	t	f	5
104	Cornelius	Dolak	f	t	f	f	f	t	f	5
121	Leonel	Meche	m	t	f	f	f	t	f	5
155	Khadija	Lagerquist	m	t	f	f	f	t	f	5
165	Jeanine	Garoner	f	t	f	f	f	t	f	5
182	Gulika	Alipio	f	t	f	f	f	t	f	5
200	Dodie	Tedford	f	t	f	f	f	t	f	5
213	Joey	Yarboro	m	t	f	f	f	t	f	5
223	Fahroni	Anglea	m	t	f	f	f	t	f	5
238	Ajanta	Mischel	m	t	f	f	f	t	f	5
293	Lauranne	Brwon	m	t	f	f	f	t	f	5
312	Addison	Bovio	f	t	f	f	f	t	f	5
341	Dmitreeva	Ellsbury	m	t	f	f	f	t	f	5
345	Fikriyya	Siddiq	f	t	f	f	f	t	f	5
368	Gulielma	Arce	f	t	f	f	f	t	f	5
373	Lecia	Baumeister	m	t	f	f	f	t	f	5
400	Waatiq	Perico	f	t	f	f	f	t	f	5
420	Jermaine	Mandahl	m	t	f	f	f	t	f	5
427	Castalia	Ryser	m	t	f	f	f	t	f	5
436	Sabina	Conde	m	t	f	f	f	t	f	5
444	Honami	Docherty	f	t	f	f	f	t	f	5
473	Timun	Silverstein	f	t	f	f	f	t	f	5
482	Ayushmati	Appelgren	f	t	f	f	f	t	f	5
487	Junichi	Hagele	m	t	f	f	f	t	f	5
491	Strezislava	Weingard	m	t	f	f	f	t	f	5
517	Tuhfa	Pedez	f	t	f	f	f	t	f	5
525	Dena	Mcentire	f	t	f	f	f	t	f	5
542	Jascha	Plantier	f	t	f	f	f	t	f	5
552	Radha	Sloan	f	t	f	f	f	t	f	5
556	Coch	Foulger	m	t	f	f	f	t	f	5
578	Blossom	Quero	f	t	f	f	f	t	f	5
589	Carevel	Tardif	m	t	f	f	f	t	f	5
594	Vyshia	Waldall	m	t	f	f	f	t	f	5
642	Juro	Scogin	f	t	f	f	f	t	f	5
651	Podolphe	Fluitt	f	t	f	f	f	t	f	5
672	Araceli	Ertel	f	t	f	f	f	t	f	5
675	Phaethon	Gearon	f	t	f	f	f	t	f	5
685	LeVaughan	Laity	f	t	f	f	f	t	f	5
700	Dorinda	Cuchiara	m	t	f	f	f	t	f	5
707	Takehide	Gauna	m	t	f	f	f	t	f	5
723	Pippo	Nascimento	m	t	f	f	f	t	f	5
727	Evdxios	Fageraes	m	t	f	f	f	t	f	5
734	Hanka	Henness	f	t	f	f	f	t	f	5
746	Jedrick	Relacion	m	t	f	f	f	t	f	5
772	Sozui	Jalovel	f	t	f	f	f	t	f	5
799	Shaunene	Libera	f	t	f	f	f	t	f	5
816	Tanja	Lockmiller	m	t	f	f	f	t	f	5
834	Stopolcha	Starowicz	f	t	f	f	f	t	f	5
844	AbdulHaadi	Castellan	m	t	f	f	f	t	f	5
855	Kulthum	Liverance	f	t	f	f	f	t	f	5
869	Winand	Poulton	m	t	f	f	f	t	f	5
882	Ran	Rubendall	f	t	f	f	f	t	f	5
891	Oles	Sumaran	m	t	f	f	f	t	f	5
920	Llwyr	Fagerstrom	m	t	f	f	f	t	f	5
922	Mimi	Stremmel	f	t	f	f	f	t	f	5
944	Khynika	Borwig	m	t	f	f	f	t	f	5
963	Lippio	Llopis	f	t	f	f	f	t	f	5
977	Fedyenka	Terrasi	m	t	f	f	f	t	f	5
980	Maxime	Higgs	m	t	f	f	f	t	f	5
987	Bibiane	Eddens	m	t	f	f	f	t	f	5
1008	Masafumi	Gipson	f	t	f	f	f	t	f	5
1013	Glafira	Geng	m	t	f	f	f	t	f	5
1019	Kiraanna	Scherping	m	t	f	f	f	t	f	5
1027	Stolpolcha	Shigemi	m	t	f	f	f	t	f	5
1033	Namiko	Leval	m	t	f	f	f	t	f	5
1039	Patrido	Sielaff	f	t	f	f	f	t	f	5
1046	Paloma	Schnall	m	t	f	f	f	t	f	5
1058	Apelino	Reeber	m	t	f	f	f	t	f	5
1070	Gwalchmei	Halbert	f	t	f	f	f	t	f	5
1088	Nomi	Rosato	f	t	f	f	f	t	f	5
1100	Nazarova	Abundis	m	t	f	f	f	t	f	5
1114	Luzia	Rahib	f	t	f	f	f	t	f	5
1133	Dawn	Lauinger	f	t	f	f	f	t	f	5
1152	Kerry	Navarrate	f	t	f	f	f	t	f	5
1165	Nene	Rhea	f	t	f	f	f	t	f	5
1176	Lisandro	Harpst	f	t	f	f	f	t	f	5
1191	Ulia	Kaines	f	t	f	f	f	t	f	5
1194	Tarrant	Alsbrooks	f	t	f	f	f	t	f	5
1198	Jelawat	Balletta	m	t	f	f	f	t	f	5
1219	Takuboku	Aicklen	m	t	f	f	f	t	f	5
1243	Abdul	Spicer	m	t	f	f	f	t	f	5
1246	Julika	Smar	f	t	f	f	f	t	f	5
1257	Anzhela	Venturelli	m	t	f	f	f	t	f	5
1265	Petros	Josefy	f	t	f	f	f	t	f	5
1277	Mazcho	Stringer	f	t	f	f	f	t	f	5
1290	Sameera	Beazley	f	t	f	f	f	t	f	5
1295	Inocente	Arntzen	m	t	f	f	f	t	f	5
1304	Diana	Gulbranson	m	t	f	f	f	t	f	5
1314	Ksniatintsa	Fuchser	f	t	f	f	f	t	f	5
1330	Cecil	Kochler	f	t	f	f	f	t	f	5
1337	Fanaila	Torain	m	t	f	f	f	t	f	5
1354	Juri	Guzik	m	t	f	f	f	t	f	5
1364	Bhadra	Whidden	m	t	f	f	f	t	f	5
1374	Cipriana	Wadzinski	m	t	f	f	f	t	f	5
1394	Egor	Braue	m	t	f	f	f	t	f	5
1399	Okichi	Spradlin	f	t	f	f	f	t	f	5
1427	Boje	Ostrum	f	t	f	f	f	t	f	5
1445	Prebrana	Kekiwi	f	t	f	f	f	t	f	5
1456	Augusto	Kempson	f	t	f	f	f	t	f	5
1493	Meena	Riegel	m	t	f	f	f	t	f	5
1499	Isha	Quave	m	t	f	f	f	t	f	5
1503	Rufio	Guitard	f	t	f	f	f	t	f	5
1511	Kallie	Bednarek	f	t	f	f	f	t	f	5
1516	Mitsuo	Neff	f	t	f	f	f	t	f	5
1523	Jurgisr	Arkins	m	t	f	f	f	t	f	5
1555	Yoyon	Lecroy	m	t	f	f	f	t	f	5
1592	Martino	Nommay	m	t	f	f	f	t	f	5
1611	Marulia	Bondura	f	t	f	f	f	t	f	5
1618	Constantino	Thielen	f	t	f	f	f	t	f	5
1619	Fokina	Poythress	m	t	f	f	f	t	f	5
1659	Mukhtaar	Grewe	m	t	f	f	f	t	f	5
1668	Adelio	Zahner	f	t	f	f	f	t	f	5
1678	Madelynn	Hoehn	m	t	f	f	f	t	f	5
1692	Gota	Dorff	m	t	f	f	f	t	f	5
1699	Ovidio	Bostrom	m	t	f	f	f	t	f	5
1715	Salamon	Julien	m	t	f	f	f	t	f	5
1752	Shandee	Finnicum	m	t	f	f	f	t	f	5
1775	Mercede	Naslund	f	t	f	f	f	t	f	5
1791	Caden	Failing	f	t	f	f	f	t	f	5
1835	Lonce	Jiron	f	t	f	f	f	t	f	5
1854	YolandaAbigail	Insogna	m	t	f	f	f	t	f	5
1875	Anwar	Katayama	m	t	f	f	f	t	f	5
1901	Kuemon	Coatie	f	t	f	f	f	t	f	5
1903	Sadahige	Taglialatela	f	t	f	f	f	t	f	5
1908	Tahlia	Francisque	f	t	f	f	f	t	f	5
1914	Sela	Funnye	f	t	f	f	f	t	f	5
1937	Ceanna	Vangoff	m	t	f	f	f	t	f	5
1939	Utathya	Kreig	f	t	f	f	f	t	f	5
1957	Chantrelle	Gruiger	m	t	f	f	f	t	f	5
1959	Shontaya	Klitzner	f	t	f	f	f	t	f	5
1977	Querida	Kreatsoulas	f	t	f	f	f	t	f	5
1984	AbdulBaasid	Chilvers	m	t	f	f	f	t	f	5
1997	Nia	Drakes	m	t	f	f	f	t	f	5
1999	Doppo	Kieser	m	t	f	f	f	t	f	5
2030	Prokop	Limage	f	t	f	f	f	t	f	5
2038	Baptist	Schubert	m	t	f	f	f	t	f	5
2039	Gayle	Wingrove	m	t	f	f	f	t	f	5
2042	Finn	Carboneau	m	t	f	f	f	t	f	5
2047	Vilena	Orillion	f	t	f	f	f	t	f	5
2060	Zumruda	Fishman	f	t	f	f	f	t	f	5
2081	Emese	Abadie	m	t	f	f	f	t	f	5
2094	Zufar	Pestoni	f	t	f	f	f	t	f	5
2148	Ramonda	Tripplett	f	t	f	f	f	t	f	5
2152	Mudri	Gamero	m	t	f	f	f	t	f	5
2161	Razan	Symons	m	t	f	f	f	t	f	5
2179	Dukinea	Zmijewski	f	t	f	f	f	t	f	5
2207	Yoshida	Volo	m	t	f	f	f	t	f	5
2208	Aleece	Thorn	m	t	f	f	f	t	f	5
2210	Avigdor	Puglia	m	t	f	f	f	t	f	5
2211	Editta	Servoss	m	t	f	f	f	t	f	5
2224	Matteo	Mestre	f	t	f	f	f	t	f	5
2236	Ilsegret	Akerley	m	t	f	f	f	t	f	5
2243	Fabiana	Demase	m	t	f	f	f	t	f	5
2258	Jared	Torgersen	f	t	f	f	f	t	f	5
2265	Aeacus	Veloz	m	t	f	f	f	t	f	5
2273	Analeigh	Sebring	m	t	f	f	f	t	f	5
1107	Dorel	Brandt	m	t	t	f	f	f	t	5
1138	Iha	Em	m	t	t	f	f	f	t	5
1141	Naglaya	Tantillo	m	t	t	f	f	f	t	5
1189	Argus	Bierwirth	f	t	t	f	f	f	t	5
1218	Marek	Mancino	f	t	t	f	f	f	t	5
1258	Chasidy	Hoop	m	t	t	f	f	f	t	5
1448	Katyushka	Gabriele	m	t	t	f	f	f	t	5
1639	Lotta	Francoise	f	t	t	f	f	f	t	5
1707	Iudita	Altew	m	t	t	f	f	f	t	5
1982	Gennadi	Schanck	f	t	t	f	f	f	t	5
2051	Guido	Genier	m	t	t	f	f	f	t	5
98	Coby	Smaller	m	t	t	t	f	f	t	5
509	Bodil	Korinta	f	t	t	t	f	f	t	5
2185	Shaqeeqa	Levra	m	t	t	t	f	f	t	5
1599	Lane	Portes	f	t	t	t	t	f	t	5
\.



COPY "Poster" ("ID", has_an_abstract, is_submitted_at) FROM stdin;
\.



COPY "Publisher" ("ID", has_a_name) FROM stdin;
\.



COPY "Review" ("ID", reviews, has_detailed_comments) FROM stdin;
710	705	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
711	608	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
715	716	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
720	721	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
732	136	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
736	645	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
751	752	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
754	616	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
758	329	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
764	151	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
766	512	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
790	791	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
320	796	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
804	15	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
821	822	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
824	591	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
825	826	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
829	830	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
832	156	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
838	116	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
854	853	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
860	861	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
872	873	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
656	880	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
549	894	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
364	541	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
903	904	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
906	907	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
912	913	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
915	916	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
237	233	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
940	538	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
308	306	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
949	950	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
958	419	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
266	604	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
965	812	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
966	281	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
858	319	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1001	1002	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
660	658	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1017	1018	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1024	1025	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1031	608	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1034	606	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1048	215	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1050	505	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1052	731	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
468	702	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
283	11	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1061	483	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1076	648	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1078	537	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1082	362	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1089	408	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1102	607	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1104	467	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1110	1111	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
153	612	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
370	367	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1126	346	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
264	375	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1068	619	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1123	148	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
902	1137	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
539	669	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1091	1157	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
995	127	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
220	218	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
979	835	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1180	866	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
295	291	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1185	942	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1187	877	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1197	1195	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1213	932	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1222	404	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1230	1231	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1235	32	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
511	40	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
323	43	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1247	47	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1251	626	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1255	52	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
577	575	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1260	702	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1261	644	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1268	81	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1270	538	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1273	100	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
994	97	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1284	232	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1296	170	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
527	522	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
20	16	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1299	175	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1306	186	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1307	190	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1317	926	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1329	1325	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
814	609	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1341	1342	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1345	907	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1348	154	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1349	247	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1358	268	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1360	275	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1362	278	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1368	628	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
788	776	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1375	110	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1376	302	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1381	265	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1384	408	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1386	343	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1388	354	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1389	357	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1006	227	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1400	615	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1402	900	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
843	839	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
911	385	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
984	391	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1410	122	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2	0	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
26	27	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
31	32	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
39	40	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
42	43	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
46	47	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
54	55	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
64	65	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
72	67	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
78	59	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
80	81	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
84	83	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
90	91	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
96	97	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
99	100	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
94	113	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
115	116	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
118	119	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
123	124	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
129	130	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
132	133	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
169	170	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
174	175	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
149	186	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
189	190	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
201	202	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
204	205	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
246	247	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
267	268	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
274	275	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
277	278	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
287	288	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
298	299	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
301	302	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
304	305	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
325	326	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
330	265	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
332	333	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
336	335	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
342	343	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
350	351	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
353	354	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
356	357	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
365	227	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
376	377	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
381	382	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
383	30	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
384	385	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
387	388	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
390	391	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
252	122	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
398	397	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
410	411	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
413	414	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
433	432	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
449	450	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
463	464	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
409	469	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
475	476	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
478	479	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
484	485	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
502	503	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
504	505	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
528	529	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
531	532	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
533	534	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
544	77	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
546	547	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
559	554	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
561	562	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
566	567	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
571	572	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
173	53	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
586	587	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
240	250	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
630	543	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
632	633	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
636	637	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
639	640	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
664	665	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
231	667	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
687	226	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
690	691	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
698	694	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1994	846	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1946	599	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
593	592	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
448	982	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2001	1094	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1574	623	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
2004	1900	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1898	1502	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
785	430	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2008	938	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
2009	622	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
2013	879	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2014	152	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1431	957	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
2021	1537	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1669	928	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
819	815	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1272	603	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2027	939	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1593	1590	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1200	1195	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2033	613	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
2035	1012	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1740	896	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1656	188	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
798	797	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1543	553	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1825	602	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1697	620	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2049	1079	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1014	962	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2050	1588	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2061	931	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1623	347	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1549	1206	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
773	769	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1774	1169	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1491	748	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1415	1393	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
184	179	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2070	598	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1713	1711	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1597	938	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1558	25	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1616	1119	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2082	61	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2018	1159	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
784	934	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1066	322	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2086	1671	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2036	260	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1073	1069	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
972	971	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1638	1637	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2095	498	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
406	1706	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
380	495	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1166	1161	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
981	1778	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
244	193	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1021	937	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
2107	1267	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1383	1736	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1622	496	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2116	407	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1923	1660	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2120	1660	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2114	618	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
228	1344	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1339	1242	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1691	1689	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2123	931	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1405	1288	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1646	495	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2125	501	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
2128	50	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1220	1216	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1115	1113	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1749	216	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1528	75	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2136	178	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2137	1245	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2140	460	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1040	1037	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1171	930	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
2141	440	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1177	1124	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1303	12	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2147	1819	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
2149	139	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1455	565	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1602	1790	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
211	208	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1582	1156	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
112	617	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
13	288	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
508	286	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1335	1334	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2156	647	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1889	1856	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1839	1833	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
582	1145	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2112	396	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1407	1155	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2165	1366	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1891	936	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
257	253	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1281	374	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
106	102	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1190	1188	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2170	242	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2171	394	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2172	1129	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
195	194	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1153	1147	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
443	316	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1862	63	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2028	1302	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1444	550	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
761	1504	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1968	521	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1136	1551	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1239	1236	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1264	417	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1871	2108	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2181	2108	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1397	1228	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
490	488	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1969	462	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
2097	569	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
570	768	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2184	1548	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
426	423	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1371	625	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
678	674	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
2118	681	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1921	9	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2190	624	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
167	161	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2191	1418	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
315	745	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
701	629	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
657	750	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1895	969	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1563	935	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
2197	933	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1498	1496	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
726	617	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1965	348	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1647	747	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1585	603	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2079	157	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2205	599	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1312	1309	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
596	592	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
757	808	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1974	1973	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1792	622	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1990	457	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
2200	879	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
2167	813	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
137	605	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1949	1215	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1420	375	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1422	924	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1432	614	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1437	450	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1439	1440	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1447	464	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1450	648	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
868	479	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
970	503	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1462	36	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
947	846	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1468	1214	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1469	532	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1472	547	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1478	562	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1480	1094	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1482	567	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1483	572	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1484	623	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1179	53	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1211	1502	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
847	430	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1514	633	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1517	637	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
38	640	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1522	1111	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1529	152	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1536	1537	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
820	815	The paper "YSWC-2015" is mainly about YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1144	226	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1546	932	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1552	721	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1564	613	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1201	645	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
795	1012	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1567	896	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1571	616	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1575	512	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1577	151	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
997	620	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1	0	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
431	1079	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1587	1588	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1015	962	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1603	796	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1607	15	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
147	1206	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1613	1169	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1624	748	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
245	822	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1626	826	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1140	830	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1229	1214	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
185	179	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1409	262	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1634	1635	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
778	926	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1649	25	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
719	861	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1650	61	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1661	873	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
422	1159	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1670	1671	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1672	260	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1074	1069	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1701	913	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1705	1706	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
235	233	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1167	1161	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1721	193	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1722	812	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1332	281	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1730	319	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1731	1267	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1735	1736	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1742	407	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1746	1747	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1754	1018	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1756	924	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1758	1025	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1676	501	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1761	1288	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1674	606	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1767	927	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
58	1635	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
864	1216	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1793	362	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1796	178	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1798	1245	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
581	440	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1805	1806	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1808	612	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1175	1124	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
369	367	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1818	1819	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1820	1806	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1827	1828	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1830	1157	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1832	127	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1643	835	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
292	291	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1840	689	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1842	942	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
405	1505	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
663	1747	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1292	1334	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1855	1856	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1570	404	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1864	936	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1845	1366	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1865	396	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1477	1231	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
255	253	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
263	374	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
735	136	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1882	626	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1883	52	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
459	575	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1423	644	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
990	1129	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1708	232	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
197	194	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
524	522	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1846	929	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
19	16	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1443	550	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1907	1504	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1414	1828	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1913	360	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1919	609	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
704	1342	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
458	689	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1925	154	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
493	488	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1395	1228	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
884	880	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1935	628	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
787	776	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1436	110	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1941	768	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1943	1548	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
128	1325	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1950	615	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
425	423	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1932	900	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1372	625	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
695	694	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1953	1155	The paper "XSWC-2014" is mainly about XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
842	839	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1227	939	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1928	624	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1962	982	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
273	348	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1972	614	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1560	935	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
859	1440	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1983	929	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1497	1496	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1045	215	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1992	36	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1682	217	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
653	649	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1596	928	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
466	703	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1594	1590	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1648	643	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
2017	957	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
519	513	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
729	349	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2214	583	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2209	598	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1916	360	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2221	188	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
159	797	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1542	553	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2225	551	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1632	262	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
455	452	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
2144	347	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
771	769	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1688	229	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1554	627	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1677	1900	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1081	91	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1768	927	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1714	1711	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2228	111	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1531	1393	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2229	925	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
742	611	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2062	1119	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1513	1508	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
2159	1097	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2234	1704	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1064	322	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2048	602	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
851	618	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
975	971	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1641	1637	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
35	9	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2151	394	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1559	587	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1183	250	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
88	83	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
166	161	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1879	745	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1355	629	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1897	969	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2242	157	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1276	665	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1847	667	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2263	583	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2106	731	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1960	691	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
2187	681	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1311	1309	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1430	752	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2160	329	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1927	933	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1976	1973	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
70	67	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1783	1137	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1929	569	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
471	469	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1874	791	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
340	335	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1989	457	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1924	813	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1266	605	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1948	1215	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
650	649	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
2052	591	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
318	1704	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1557	877	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
2072	643	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
401	397	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
518	513	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
271	346	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1535	894	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1108	551	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1894	541	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2155	904	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
2177	610	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1225	916	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1416	703	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
453	452	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
307	306	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
2188	808	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
999	950	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
708	705	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1930	604	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1340	419	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
557	554	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2032	229	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1556	627	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1739	750	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2121	1002	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
435	432	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1435	111	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
659	658	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
739	611	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
811	1508	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1600	537	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
714	483	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2260	11	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
272	349	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2053	925	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
684	601	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
857	853	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
895	607	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2019	467	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1719	934	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1139	600	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
2055	1598	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2065	217	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1467	619	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1955	148	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
671	669	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1686	943	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
889	621	In their paper 'SIGXYZ-2014' the authors discuss SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
138	95	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
146	1918	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
219	218	The paper "XSWC-2014" is mainly about XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1869	866	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1520	1097	In their paper 'ZSWC-2015' the authors discuss ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
682	601	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1106	1778	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1020	937	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
1621	496	The paper "YSWC-2015" is mainly about YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2240	647	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1653	600	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2054	1598	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1353	1505	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1254	1344	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1687	943	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2175	1242	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1694	1689	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
892	621	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
1605	95	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1788	1918	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2067	498	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2101	565	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1116	1113	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1753	216	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2249	610	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1316	75	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2254	388	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
2238	460	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
991	27	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1043	1037	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1173	930	The paper "YSWC-2014" is mainly about YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1970	55	The paper "YSWC-2014" is mainly about YSWC-2014.\nThough apparently a contribution of remarkable novelty, 'YSWC-2014' also has its weaknesses.
284	12	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1781	65	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThough apparently a contribution of remarkable novelty, 'SIGXYZ-2014' also has its weaknesses.
2256	1302	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
2127	50	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1379	59	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2212	1145	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2044	113	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1717	1790	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1785	119	The paper "ZSWC-2014" is mainly about ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
210	208	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1681	1156	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
1055	124	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
2075	133	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1726	130	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
1720	716	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
762	242	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
1838	1833	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
988	202	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1663	205	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1495	543	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
108	102	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1192	1188	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
2261	299	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
1911	286	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
952	305	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
779	1418	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1207	326	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
2093	333	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
2215	417	The paper "XSWC-2015" is mainly about XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1492	351	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
324	316	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1150	1147	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
2078	156	The paper "XSWC-2015" is mainly about XSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2015 in particular
2169	377	The paper "SIGXYZ-2014" is mainly about SIGXYZ-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight SIGXYZ-2014 in particular
918	63	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1810	382	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
887	30	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1980	521	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
1804	1551	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2015' also has its weaknesses.
1240	1236	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
447	462	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
1696	411	The paper "ZSWC-2015" is mainly about ZSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2015 in particular
1130	414	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2015 in particular
1490	747	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
2043	139	In their paper 'YSWC-2015' the authors discuss YSWC-2015.\nThough apparently a contribution of remarkable novelty, 'YSWC-2015' also has its weaknesses.
1906	476	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight XSWC-2014 in particular
777	485	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight ZSWC-2014 in particular
1098	529	In their paper 'XSWC-2015' the authors discuss XSWC-2015.\nThough apparently a contribution of remarkable novelty, 'XSWC-2015' also has its weaknesses.
1323	534	In their paper 'XSWC-2014' the authors discuss XSWC-2014.\nThough apparently a contribution of remarkable novelty, 'XSWC-2014' also has its weaknesses.
2134	77	In their paper 'ZSWC-2014' the authors discuss ZSWC-2014.\nThough apparently a contribution of remarkable novelty, 'ZSWC-2014' also has its weaknesses.
676	674	In their paper 'YSWC-2014' the authors discuss YSWC-2014.\nThis says about all about both its strong and weak suits.\nHowever, the reviewer would like to highlight YSWC-2014 in particular
\.



COPY "Review_expertise" ("ID", has_an_expertise, has_a_submitted_contribut) FROM stdin;
\.



COPY "Review_preference" ("ID", belongs_to_a_review_refer, has_a_degree, has_a_topic_or_a_submissi) FROM stdin;
\.



COPY "Steering_committee" ("ID", was_a_steering_committee_) FROM stdin;
\.



COPY "Topic" ("ID", has_a_name) FROM stdin;
\.



COPY "Track" ("ID", "has_tracks_Inv", "has_a_track-workshop-tuto", is_part_of_conference_vol, has_a_name) FROM stdin;
\.



COPY "Tutorial" ("ID", "has_tutorials_Inv", is_part_of_conference_vol, has_a_name) FROM stdin;
\.



COPY "Workshop" ("ID", "has_a_track-workshop-tuto", "has_workshops_Inv", is_part_of_conference_vol, has_a_name) FROM stdin;
\.



COPY belongs_to_reviewers ("Entity", "Reviewer") FROM stdin;
\.



COPY contributes ("Person", "Conference_document") FROM stdin;
3	0
3	600
5	0
6	0
6	1653
8	9
10	11
10	12
10	13
14	15
21	16
21	538
21	539
22	16
22	382
22	452
22	538
22	731
23	16
23	381
23	452
23	538
23	671
23	1052
28	26
28	119
28	178
28	705
28	2172
33	31
33	1276
33	1711
33	1740
34	35
34	36
37	38
41	39
41	55
41	815
41	873
44	42
44	443
48	46
48	1669
48	1911
51	52
51	53
56	54
56	766
56	819
57	58
57	59
62	63
66	64
66	423
71	67
71	253
71	260
71	939
71	1214
71	1215
73	67
73	939
73	1948
73	2036
74	75
79	32
79	78
79	665
82	80
82	1431
85	83
85	226
85	537
89	83
89	537
89	1810
89	2106
92	90
92	462
92	604
92	843
92	981
92	982
93	94
93	95
98	96
98	396
98	853
98	1660
98	1919
101	99
103	102
103	227
103	228
103	229
104	102
104	229
104	305
104	505
105	102
105	229
105	304
105	895
105	896
109	110
109	111
109	112
117	27
117	115
117	319
117	710
117	1129
117	2136
120	118
120	156
120	157
120	253
120	1213
120	2028
121	122
125	123
126	127
126	128
131	129
131	133
131	152
131	153
131	154
134	132
134	562
134	1021
134	2013
135	136
135	137
135	138
135	139
141	455
141	933
141	1113
141	2141
141	2212
142	503
142	521
142	633
142	1339
142	1340
143	577
143	1840
144	1397
144	1483
145	146
145	147
145	148
145	149
155	116
155	156
155	157
158	113
158	159
164	161
164	739
165	161
168	161
171	169
171	247
171	716
171	824
171	1111
172	173
176	174
176	884
176	1739
180	179
180	569
180	570
181	179
181	569
181	1450
181	1941
181	2240
182	179
182	569
182	647
182	648
187	188
191	189
191	457
191	458
191	459
191	460
198	194
198	1935
199	194
200	194
203	201
203	502
203	604
203	691
203	969
203	1632
206	204
206	628
209	208
209	466
209	467
209	468
213	208
213	467
213	532
214	215
214	216
214	217
222	218
222	995
223	218
223	302
230	231
230	232
236	233
238	233
238	611
239	240
243	244
243	245
248	170
248	246
248	1522
251	252
254	72
254	253
254	260
254	531
254	1215
254	2027
261	202
261	262
261	263
261	264
261	265
261	266
269	267
270	271
270	272
270	273
276	274
276	450
276	553
276	925
279	277
279	383
279	1767
282	283
282	284
289	11
289	12
289	287
289	1587
289	1846
290	9
293	291
294	291
296	291
300	298
303	301
303	549
303	550
303	551
309	306
309	485
309	938
309	1593
309	1792
310	306
310	826
310	938
310	2055
312	306
312	622
312	938
312	1598
313	43
313	315
313	316
313	318
313	319
313	320
321	322
321	323
321	324
327	325
327	521
327	633
327	1157
327	1222
327	2215
331	330
331	397
331	808
331	842
331	1106
334	332
334	1159
338	335
338	721
338	1091
339	335
339	471
339	721
339	1705
339	1830
341	335
341	721
344	342
345	346
345	347
345	348
345	349
352	350
355	113
355	353
355	935
355	1266
355	1267
358	356
358	575
358	689
358	1989
358	2238
359	360
363	364
366	365
366	605
366	1012
366	1563
366	2107
368	119
368	367
368	658
368	932
368	1302
372	367
372	658
373	265
373	374
373	375
378	376
379	380
386	384
389	387
392	390
399	397
399	808
399	1381
400	91
400	397
400	808
400	839
400	1778
403	404
403	405
403	406
403	407
403	408
403	409
412	65
412	410
415	190
415	413
415	1891
416	326
416	417
420	351
421	133
421	422
424	423
427	423
429	430
429	431
434	432
434	645
434	930
436	432
436	614
436	930
438	351
438	432
438	930
438	1972
441	329
442	43
442	316
442	2234
444	43
444	316
446	265
446	447
446	448
451	275
451	449
451	601
451	1626
451	2229
454	193
454	452
454	822
454	1115
454	2197
454	2263
465	463
465	1622
465	1661
473	404
473	407
473	408
473	469
473	1157
473	1706
474	469
474	1384
474	1706
474	2116
477	475
477	524
477	583
477	929
477	1588
480	478
480	1245
481	195
482	483
486	484
486	776
487	61
489	488
489	1820
489	2123
491	488
491	900
491	931
491	1119
491	1806
494	464
494	495
494	496
497	498
499	483
506	504
506	1344
507	508
509	464
509	496
509	511
509	512
514	513
514	2160
515	513
515	918
517	250
517	513
523	476
523	522
525	288
525	476
525	522
525	624
525	929
525	1588
530	493
530	528
530	830
530	924
530	1119
535	25
535	533
535	701
535	702
535	703
535	704
542	543
545	544
548	546
552	275
552	553
555	554
555	861
555	1557
555	1558
555	1559
556	554
556	861
556	1393
558	554
558	861
558	1649
563	561
563	1808
564	565
568	529
568	566
568	1140
568	1756
573	257
573	571
573	1395
576	575
576	689
576	1389
578	457
578	460
578	575
578	689
580	581
580	582
580	583
584	108
584	2032
585	617
585	1268
585	1749
585	2017
588	586
588	629
588	1187
589	9
594	592
594	1635
597	592
597	965
597	2167
631	630
634	404
634	419
634	632
634	1200
634	1242
634	1968
635	84
635	669
635	1078
638	628
638	636
641	639
642	643
642	644
642	645
651	430
651	649
651	934
651	1079
652	649
652	934
652	2049
652	2052
655	656
655	657
662	663
666	59
666	607
666	664
666	1235
666	1634
672	669
672	916
672	1856
673	151
673	669
673	674
673	1225
673	1855
675	151
675	394
675	674
675	942
675	943
677	151
677	674
677	1443
677	1842
677	2151
685	186
685	601
685	681
685	1206
685	1548
685	1918
686	601
686	681
686	1175
686	1306
686	1548
686	1549
688	440
688	687
688	1116
688	1145
688	1927
692	202
692	262
692	690
692	1897
697	694
697	788
699	396
699	694
699	853
699	1994
700	694
700	776
700	926
700	1418
707	27
707	178
707	319
707	705
707	1129
709	178
709	322
709	705
709	773
709	1017
709	1730
712	711
712	1236
713	299
713	714
717	715
717	1079
718	559
718	719
722	340
722	720
722	1570
723	81
723	617
723	957
724	617
724	1014
724	1375
724	2228
727	613
728	729
734	95
734	136
734	139
734	1671
737	736
740	611
743	388
746	495
746	747
746	748
753	745
753	751
753	796
753	858
753	859
755	754
756	91
756	401
756	757
759	758
760	761
760	762
765	550
765	678
765	764
765	916
765	1686
765	1856
770	708
770	769
770	1018
770	1796
772	322
772	769
772	1018
775	776
775	777
775	778
775	779
780	2
782	295
783	391
783	591
783	653
783	784
783	785
789	166
792	790
794	795
799	797
800	605
800	732
800	797
800	2086
800	2149
801	797
801	1670
803	336
803	1505
803	1552
805	65
805	804
810	50
810	811
810	812
810	813
810	814
816	55
816	815
817	55
817	77
817	815
823	821
823	1721
827	275
827	825
831	829
831	1422
831	1790
833	832
833	2242
834	598
834	835
836	116
836	932
836	1302
836	2078
836	2079
841	398
841	839
841	1778
841	1930
841	2188
844	385
849	47
849	430
849	928
849	1405
850	851
852	329
855	50
855	396
855	609
855	846
855	853
862	557
862	587
862	860
862	877
862	1355
862	1393
863	864
867	479
867	2254
869	479
869	1245
870	479
870	1316
874	872
875	541
882	750
882	880
883	750
883	880
883	1747
885	750
885	880
885	1251
886	887
890	621
891	621
893	621
899	900
901	902
905	302
905	903
905	1407
908	457
908	460
908	906
908	1124
908	2121
910	385
914	912
917	915
917	1889
920	205
922	565
923	237
941	20
941	940
944	628
946	50
946	947
948	308
948	622
948	1543
948	1597
948	1598
951	100
951	949
953	305
956	81
956	957
959	958
959	2175
960	615
961	962
963	170
963	716
967	232
967	966
968	691
968	969
968	970
973	971
973	1691
974	612
974	971
974	1348
974	1529
974	1694
977	971
977	1637
978	979
980	110
980	111
980	962
983	716
983	984
987	202
987	262
987	604
987	691
987	969
989	990
989	991
992	637
993	994
996	997
998	999
1003	357
1003	1001
1003	1345
1005	433
1005	614
1005	1153
1005	1173
1008	227
1008	1344
1009	227
1009	1388
1010	255
1010	369
1010	660
1010	932
1010	1214
1010	1302
1013	913
1019	133
1019	612
1019	879
1019	937
1019	1159
1023	879
1023	937
1023	2018
1026	1024
1027	377
1028	61
1030	608
1033	608
1033	1236
1035	1034
1038	1037
1039	1037
1041	1037
1041	2209
1044	30
1044	215
1044	217
1044	1554
1046	215
1046	217
1046	1156
1049	505
1049	952
1053	281
1054	623
1057	124
1058	124
1059	124
1062	1061
1067	913
1067	1068
1070	1069
1071	1069
1075	81
1075	726
1075	957
1075	1069
1077	242
1077	1076
1077	1504
1077	2156
1080	462
1080	982
1080	1081
1083	1082
1087	913
1088	63
1090	1089
1090	1157
1090	1742
1092	609
1092	854
1092	2112
1095	362
1100	529
1100	830
1100	924
1101	529
1101	1482
1103	1102
1103	1713
1105	210
1105	1104
1105	1393
1107	894
1107	1108
1112	591
1112	1110
1112	1349
1112	1502
1112	1638
1114	440
1114	583
1114	933
1114	1113
1114	1145
1120	119
1120	370
1120	659
1122	1123
1122	1124
1127	347
1127	1126
1127	1746
1127	1965
1128	27
1128	838
1128	1129
1131	414
1131	936
1131	1704
1131	2004
1131	2125
1132	357
1132	414
1132	936
1132	1307
1132	1497
1132	1871
1133	190
1133	414
1133	501
1133	936
1133	1094
1133	1900
1135	100
1135	1136
1138	640
1138	1139
1141	333
1141	830
1141	924
1141	1602
1143	440
1143	1144
1143	1145
1146	606
1148	1147
1151	643
1151	644
1151	1147
1152	1147
1154	904
1154	1155
1160	220
1162	1161
1164	1161
1165	1161
1168	1169
1170	205
1176	907
1176	1002
1176	1124
1178	1179
1181	1180
1182	1183
1186	943
1186	1185
1186	2171
1189	1031
1189	1188
1191	1188
1194	562
1196	1195
1196	1207
1196	1264
1198	326
1198	417
1198	521
1198	633
1198	1195
1203	645
1204	1167
1209	950
1210	1211
1218	1216
1218	1358
1219	1216
1221	543
1223	916
1223	1687
1223	1856
1226	70
1226	572
1226	1227
1226	1228
1226	1229
1232	25
1232	1230
1232	1818
1237	1236
1243	619
1243	1025
1246	411
1248	626
1248	1247
1248	1596
1250	1192
1253	1254
1256	53
1256	1255
1257	534
1257	702
1257	703
1257	1342
1258	211
1258	532
1258	702
1258	703
1258	2019
1262	347
1262	1201
1262	1261
1262	1648
1265	541
1271	1097
1271	1272
1274	1273
1274	1334
1277	32
1277	59
1277	607
1277	665
1277	896
1278	698
1278	1137
1282	374
1282	375
1282	988
1282	1409
1283	547
1285	1284
1286	596
1289	1245
1290	667
1291	1292
1294	950
1295	950
1297	1296
1298	288
1298	527
1298	1906
1300	1299
1304	11
1304	12
1304	768
1310	1309
1314	1309
1315	1309
1318	622
1318	695
1318	1137
1318	1317
1318	2191
1320	534
1320	1260
1320	1342
1320	1415
1320	1416
1321	534
1321	1342
1321	1531
1324	419
1324	1197
1324	1242
1327	1325
1328	1325
1328	1832
1330	127
1330	1325
1331	1332
1337	1334
1338	1334
1343	1323
1343	1341
1346	907
1346	1002
1346	1990
1346	2140
1350	15
1352	407
1352	408
1352	1353
1354	25
1354	587
1354	629
1354	877
1354	1231
1354	1819
1357	846
1359	235
1361	1360
1363	627
1363	1362
1363	1768
1363	2134
1364	623
1369	1368
1370	625
1374	625
1377	551
1377	1376
1378	896
1378	1379
1382	1383
1387	1386
1391	1006
1391	1012
1392	1329
1394	572
1394	1228
1396	572
1396	1228
1396	1468
1399	100
1401	1400
1403	1119
1403	1402
1404	1190
1408	911
1411	1410
1413	1414
1425	643
1425	644
1425	1623
1426	752
1426	1064
1426	1440
1427	745
1427	752
1427	796
1427	1440
1427	1704
1429	752
1429	1066
1429	1440
1429	1603
1429	1879
1433	747
1433	748
1433	1432
1434	1074
1434	1435
1434	1436
1438	1437
1438	2053
1441	1430
1441	1439
1441	1704
1445	550
1445	551
1445	894
1448	40
1448	1447
1448	1621
1449	184
1449	288
1449	647
1449	648
1449	1928
1449	1929
1451	647
1451	648
1451	1505
1451	1907
1451	2170
1453	868
1454	1455
1456	605
1456	935
1456	1012
1456	1267
1458	495
1459	127
1459	219
1459	302
1460	627
1460	1048
1460	1681
1460	1682
1461	1040
1463	1169
1463	1462
1464	106
1464	607
1464	1050
1464	1344
1464	1688
1466	619
1470	260
1470	1215
1470	1469
1473	1472
1475	1231
1475	1819
1479	1478
1481	1480
1481	1496
1481	2108
1485	1484
1486	1372
1488	1490
1488	1491
1488	1492
1493	498
1494	599
1494	1495
1499	357
1499	1496
1499	2108
1500	1130
1500	1496
1500	1864
1500	2001
1500	2108
1503	242
1503	1504
1503	1505
1506	391
1506	847
1509	1508
1509	1722
1509	1923
1509	1924
1510	1508
1510	2120
1511	812
1511	813
1511	1508
1515	1514
1515	1980
1516	193
1516	822
1518	1517
1519	1520
1523	247
1523	591
1523	1111
1523	1502
1525	247
1525	1111
1525	1689
1525	1898
1526	620
1527	1528
1532	343
1538	826
1538	1536
1539	820
1539	1970
1545	553
1545	1594
1550	1551
1555	30
1555	278
1555	627
1555	927
1562	935
1562	1267
1562	2035
1565	1564
1568	1567
1568	1711
1572	1571
1576	1575
1578	676
1578	1577
1581	1582
1583	1
1584	1585
1589	1015
1591	307
1591	1590
1591	2008
1592	485
1592	1590
1599	88
1599	226
1599	382
1599	453
1599	731
1599	1600
1604	95
1604	735
1604	2043
1604	2044
1608	1607
1610	1556
1611	391
1614	1613
1615	866
1615	1616
1618	603
1618	1097
1619	40
1619	464
1619	496
1619	873
1625	614
1625	1624
1625	1646
1625	1647
1628	889
1629	1214
1629	1672
1629	1949
1631	185
1631	2097
1639	152
1639	154
1639	972
1639	1637
1642	1643
1644	787
1644	926
1644	1418
1644	2009
1651	1650
1654	600
1655	1656
1658	122
1659	97
1659	1660
1662	30
1665	205
1667	47
1667	175
1667	928
1667	1882
1668	47
1668	286
1668	626
1668	928
1668	1288
1673	1674
1675	1094
1675	1676
1675	1677
1678	343
1679	343
1685	19
1685	382
1685	731
1685	943
1685	1270
1692	130
1692	152
1692	154
1692	1689
1693	1689
1693	1726
1695	1696
1698	620
1699	620
1702	1701
1707	791
1707	1708
1715	1711
1716	567
1716	1717
1718	650
1718	1079
1718	1719
1718	1720
1724	1574
1725	197
1728	130
1729	292
1732	354
1732	1560
1732	1731
1734	426
1737	1735
1744	1156
1750	216
1752	216
1755	771
1755	1754
1759	1758
1762	286
1762	1761
1763	411
1765	268
1765	1166
1769	278
1769	927
1771	1635
1771	1714
1772	593
1772	812
1772	813
1772	1635
1773	1774
1775	547
1779	606
1780	1781
1782	1783
1787	148
1787	1788
1791	904
1791	1155
1794	599
1794	1793
1795	1150
1799	1798
1800	1838
1803	1804
1807	866
1807	1805
1807	2061
1807	2062
1815	503
1815	1281
1815	1420
1821	931
1821	1806
1821	1932
1822	490
1822	567
1822	931
1822	1806
1822	1869
1824	1825
1826	61
1829	603
1829	1827
1835	1833
1836	1833
1837	1833
1844	1845
1849	667
1850	667
1852	1747
1854	1747
1859	616
1860	1546
1860	2256
1863	63
1866	97
1866	857
1866	1865
1866	2127
1868	394
1868	942
1870	587
1870	877
1870	1477
1870	2147
1873	602
1875	791
1877	1312
1878	498
1884	122
1884	1883
1887	1423
1887	2072
1893	36
1893	1894
1899	1467
1901	419
1901	503
1901	1242
1903	1551
1904	362
1908	1828
1909	1828
1914	360
1915	360
1926	1925
1926	2014
1933	435
1933	1171
1937	606
1938	543
1939	640
1942	1335
1944	1918
1944	1943
1944	2118
1945	1946
1951	1950
1952	425
1954	1444
1954	1953
1954	2155
1957	148
1959	362
1963	1962
1963	1969
1964	1847
1967	346
1967	348
1977	1973
1978	1973
1982	768
1982	929
1982	1303
1982	1588
1982	2190
1982	2260
1984	637
1985	1697
1987	1045
1987	2065
1993	1992
1996	798
1997	1137
1999	462
1999	982
2003	501
2003	1900
2005	1895
2005	1960
2006	97
2006	2128
2010	1239
2011	75
2015	268
2015	1839
2022	450
2022	682
2022	925
2022	2021
2023	299
2023	1976
2024	1974
2030	450
2030	826
2030	925
2030	1537
2034	2033
2038	36
2038	1169
2039	175
2040	742
2041	1913
2042	77
2045	602
2047	602
2051	624
2051	1983
2051	2050
2057	1542
2057	1598
2058	167
2060	113
2060	354
2066	2067
2068	1663
2071	835
2071	2070
2073	1025
2077	377
2081	268
2083	2082
2088	613
2089	1073
2091	618
2094	333
2094	1790
2098	1366
2100	2101
2102	873
2104	562
2104	2075
2105	610
2110	1874
2111	615
2113	2114
2117	1371
2124	15
2129	2095
2130	1220
2131	519
2132	1502
2132	1641
2135	77
2138	2137
2139	1921
2142	681
2142	1177
2142	1548
2143	2144
2145	193
2145	822
2145	2214
2146	975
2148	610
2150	250
2152	281
2153	281
2158	2159
2161	329
2164	904
2164	1155
2164	1535
2166	2165
2168	2169
2173	349
2174	1862
2176	2177
2179	65
2185	186
2185	1206
2185	2184
2185	2187
2189	53
2193	1098
2194	618
2195	483
2198	1498
2198	2181
2199	612
2199	1020
2199	1159
2199	2093
2199	2200
2202	156
2202	157
2202	1785
2204	603
2204	1311
2206	2205
2207	232
2208	299
2208	1736
2210	388
2211	567
2211	866
2218	598
2219	1916
2222	2221
2223	835
2224	615
2226	2225
2227	2048
2231	1513
2232	1288
2233	1097
2236	618
2239	1240
2241	2054
2243	512
2244	892
2245	1605
2245	1671
2246	175
2248	2249
2250	1043
2251	565
2252	1753
2253	52
2255	388
2257	1055
2258	599
2258	1366
2259	610
2262	1736
2262	2261
2264	1736
2265	616
2266	518
2268	616
2269	1537
2273	188
2276	684
2276	1955
\.



COPY "has_a_committee_co-chair" ("Committee", "Co-chair") FROM stdin;
\.



COPY "has_a_track-workshop-tuto" ("Conference_part", "Topic") FROM stdin;
\.



COPY has_an_email ("Person", "VALUE") FROM stdin;
688	Octave.Diana@secretresearch.tld
1449	Wava.Goubeaux@secretresearch.tld
723	Pippo.Nascimento@secretresearch.tld
1445	Prebrana.Kekiwi@secretresearch.tld
523	Shaka.Enget@secretresearch.tld
1330	Cecil.Kochler@secretresearch.tld
1821	Lance.Fernandes@secretresearch.tld
1933	Ladinka.Ehiginator@secretresearch.tld
1518	Cadell.Parral@secretresearch.tld
1728	Amora.Ockmond@secretresearch.tld
1592	Martino.Nommay@secretresearch.tld
1361	ris.Kotter@secretresearch.tld
1938	Janah.Moryl@secretresearch.tld
1939	Utathya.Kreig@secretresearch.tld
1441	Wira.Majette@secretresearch.tld
1942	Estrelle.Wedgworth@secretresearch.tld
1315	Gabriele.Darsey@secretresearch.tld
1945	Becca.Curney@secretresearch.tld
1411	Thanaa.Bustos@secretresearch.tld
1849	Liebetraud.Kiddy@secretresearch.tld
1959	Shontaya.Klitzner@secretresearch.tld
1403	Shoko.Moel@secretresearch.tld
1964	Mita.Schwering@secretresearch.tld
634	Fedorav.Solich@secretresearch.tld
1963	Kaspar.Reierson@secretresearch.tld
1539	Benignus.Diec@secretresearch.tld
1120	Charlette.Negron@secretresearch.tld
1338	Rosalinde.Leinbach@secretresearch.tld
1515	Elan.Malloch@secretresearch.tld
1984	AbdulBaasid.Chilvers@secretresearch.tld
1985	Otylia.Lowdermilk@secretresearch.tld
525	Dena.Mcentire@secretresearch.tld
1996	Naazil.Buchannan@secretresearch.tld
1203	Yumiko.Ginther@secretresearch.tld
1997	Nia.Drakes@secretresearch.tld
1993	Dandrae.Dorne@secretresearch.tld
1752	Shandee.Finnicum@secretresearch.tld
312	Addison.Bovio@secretresearch.tld
2005	Faatin.Bonn@secretresearch.tld
1343	Angel.Delcarmen@secretresearch.tld
2010	Saahir.Muto@secretresearch.tld
1732	Inez.Meeroff@secretresearch.tld
2011	Iken.Siluis@secretresearch.tld
85	Eupeithes.Bevens@secretresearch.tld
1277	Mazcho.Stringer@secretresearch.tld
2015	Tera.Vigen@secretresearch.tld
1023	Seriozhenka.Homen@secretresearch.tld
1258	Chasidy.Hoop@secretresearch.tld
2023	Maeko.Kontogiannis@secretresearch.tld
1049	Nolan.Brownle@secretresearch.tld
1070	Gwalchmei.Halbert@secretresearch.tld
2024	Abderus.Boston@secretresearch.tld
477	Argos.Cumings@secretresearch.tld
1538	Akila.Terlizzi@secretresearch.tld
120	Eligius.Vanwechel@secretresearch.tld
1392	Ashley.Kesselring@secretresearch.tld
2030	Prokop.Limage@secretresearch.tld
1285	Guiletta.Rosek@secretresearch.tld
1568	Yae.Timblin@secretresearch.tld
73	Demont.Escalet@secretresearch.tld
2039	Gayle.Wingrove@secretresearch.tld
2040	Pete.Salada@secretresearch.tld
2042	Finn.Carboneau@secretresearch.tld
1604	Mora.Christofferse@secretresearch.tld
734	Hanka.Henness@secretresearch.tld
1800	Xiomara.Plowe@secretresearch.tld
1769	Kiyoemon.Wesby@secretresearch.tld
652	Tadao.Pentaris@secretresearch.tld
1438	Sasson.Kniffin@secretresearch.tld
2058	Tekusa.Houlberg@secretresearch.tld
885	Mamie.Howen@secretresearch.tld
1807	Deke.Mirabelli@secretresearch.tld
1987	Dores.Hugi@secretresearch.tld
2066	Phoolan.Mackie@secretresearch.tld
1850	Honey.Eidinger@secretresearch.tld
2068	Timotheos.Cazaree@secretresearch.tld
2041	Lubachitsa.Husch@secretresearch.tld
1887	Aetos.Bitar@secretresearch.tld
2073	Janeka.Hochhalter@secretresearch.tld
436	Sabina.Conde@secretresearch.tld
2077	Garca.Diers@secretresearch.tld
836	Davida.Rho@secretresearch.tld
198	Zanthe.Felarca@secretresearch.tld
1327	Amalia.Krajcik@secretresearch.tld
2091	Guiseppa.Thurstonson@secretresearch.tld
1631	Vedetta.Pilkins@secretresearch.tld
2098	Matashichi.Butman@secretresearch.tld
2100	Ariana.Berardinelli@secretresearch.tld
2102	Gerlind.Boomershine@secretresearch.tld
2105	Momus.Rivadeneira@secretresearch.tld
987	Bibiane.Eddens@secretresearch.tld
1654	Saer.Dillenbeck@secretresearch.tld
164	Daris.Astley@secretresearch.tld
1009	Krosa.Kuney@secretresearch.tld
759	Latorray.Delawder@secretresearch.tld
1038	Iulia.Morra@secretresearch.tld
89	Miranda.Leinen@secretresearch.tld
1591	Grite.Faddis@secretresearch.tld
1003	Blanca.Ursery@secretresearch.tld
1500	Flaca.Sodawasser@secretresearch.tld
1576	Gerke.Ostermeyer@secretresearch.tld
2110	Florentyna.Cost@secretresearch.tld
2111	Vrotsislava.Bouman@secretresearch.tld
1092	Aleydis.Virgadamo@secretresearch.tld
1463	Caryn.Grudzinski@secretresearch.tld
2113	Gyoergy.Rakoci@secretresearch.tld
2117	Traci.Erazmus@secretresearch.tld
1944	Lucrecia.Rollings@secretresearch.tld
104	Cornelius.Dolak@secretresearch.tld
1499	Isha.Quave@secretresearch.tld
908	Kristin.Sandhu@secretresearch.tld
1678	Madelynn.Hoehn@secretresearch.tld
1044	Nonna.Laplaunt@secretresearch.tld
923	Oscar.Formica@secretresearch.tld
2131	Raffaello.Herard@secretresearch.tld
2132	Reiko.Castile@secretresearch.tld
2057	Nisus.Coby@secretresearch.tld
1191	Ulia.Kaines@secretresearch.tld
1884	Katreen.Osthoff@secretresearch.tld
1408	Krispin.Macnamee@secretresearch.tld
1133	Dawn.Lauinger@secretresearch.tld
563	Jokin.Hytros@secretresearch.tld
1829	Este.Manon@secretresearch.tld
2143	Hellmut.Tousant@secretresearch.tld
2129	Melker.Kayastha@secretresearch.tld
641	Triesha.Carland@secretresearch.tld
2146	Terao.Asley@secretresearch.tld
2148	Ramonda.Tripplett@secretresearch.tld
101	Asisa.Finke@secretresearch.tld
2045	Freda.Freimuth@secretresearch.tld
799	Shaunene.Libera@secretresearch.tld
1762	Flaco.Reyome@secretresearch.tld
1903	Sadahige.Taglialatela@secretresearch.tld
677	Motoyasu.Calligy@secretresearch.tld
1448	Katyushka.Gabriele@secretresearch.tld
1954	Kozue.Efthimiou@secretresearch.tld
780	Arno.Barquera@secretresearch.tld
2158	Lex.Hoven@secretresearch.tld
1481	Mikolas.Sirman@secretresearch.tld
1223	Helene.Nik@secretresearch.tld
473	Timun.Silverstein@secretresearch.tld
1614	Virgilio.Englander@secretresearch.tld
597	Teriuihi.Lachner@secretresearch.tld
2022	Effie.Menzie@secretresearch.tld
386	Abbie.Manjarres@secretresearch.tld
2168	Wolfhild.Torros@secretresearch.tld
368	Gulielma.Arce@secretresearch.tld
585	Tekla.Gallerani@secretresearch.tld
1427	Boje.Ostrum@secretresearch.tld
855	Kulthum.Liverance@secretresearch.tld
1473	Eijiro.Majied@secretresearch.tld
1274	Odysseus.Dilthey@secretresearch.tld
2173	Oryan.Mirles@secretresearch.tld
1755	Kantha.Lybert@secretresearch.tld
98	Coby.Smaller@secretresearch.tld
568	Latoya.Lovato@secretresearch.tld
823	Raaid.Chrispen@secretresearch.tld
1693	Cleveland.Navarez@secretresearch.tld
1863	Eber.Ebinger@secretresearch.tld
2038	Baptist.Schubert@secretresearch.tld
1750	Stacie.Ciesielski@secretresearch.tld
959	Lene.Vosquez@secretresearch.tld
2176	Lamesha.Neher@secretresearch.tld
1164	Maela.Chamley@secretresearch.tld
2179	Dukinea.Zmijewski@secretresearch.tld
200	Dodie.Tedford@secretresearch.tld
893	Rosamar.Wish@secretresearch.tld
1008	Masafumi.Gipson@secretresearch.tld
2083	Gerik.Ferries@secretresearch.tld
1165	Nene.Rhea@secretresearch.tld
1952	Kotaro.Leitheiser@secretresearch.tld
1062	Aishwarya.Hallmon@secretresearch.tld
800	Llyn.Hardge@secretresearch.tld
1506	Loris.Elder@secretresearch.tld
41	Athindoros.Shurgot@secretresearch.tld
2138	Sanya.Parma@secretresearch.tld
594	Vyshia.Waldall@secretresearch.tld
1562	Mawar.Camfield@secretresearch.tld
1737	Ingetrud.Balezentis@secretresearch.tld
2166	LaReina.Iqbal@secretresearch.tld
1426	Cassian.Cozzy@secretresearch.tld
2089	Teana.Stallworth@secretresearch.tld
427	Castalia.Ryser@secretresearch.tld
1868	Lone.Pavese@secretresearch.tld
1589	Ludovica.Diekmann@secretresearch.tld
548	Amba.Guidos@secretresearch.tld
841	Caddock.Stagowski@secretresearch.tld
2189	Urako.Staker@secretresearch.tld
1298	Torah.Giller@secretresearch.tld
1875	Anwar.Katayama@secretresearch.tld
2193	Jamie.Berrie@secretresearch.tld
2194	Imelde.Ballin@secretresearch.tld
134	Demetria.Tramonti@secretresearch.tld
2199	Valentina.Topia@secretresearch.tld
1644	Cindi.Ginanni@secretresearch.tld
914	Jamuna.Orts@secretresearch.tld
792	Seinosuke.Grimaldi@secretresearch.tld
2202	Madaleno.Bercier@secretresearch.tld
1433	Hannele.Kneifl@secretresearch.tld
1127	Yaineris.Francisco@secretresearch.tld
545	Kazuhiko.Campas@secretresearch.tld
699	Handy.Ratajczak@secretresearch.tld
1057	Marlene.Dague@secretresearch.tld
3	Flora.Aveni@secretresearch.tld
2206	Pantyslawa.Pemble@secretresearch.tld
1328	Tatsukichi.Gerstenberger@secretresearch.tld
22	Yemena.Knebel@secretresearch.tld
2208	Aleece.Thorn@secretresearch.tld
1937	Ceanna.Vangoff@secretresearch.tld
1041	Evi.Heidebrecht@secretresearch.tld
1639	Lotta.Francoise@secretresearch.tld
1101	Iravati.Pizzolato@secretresearch.tld
1978	Muna.Lastovica@secretresearch.tld
2104	Brys.Robak@secretresearch.tld
2210	Avigdor.Puglia@secretresearch.tld
556	Coch.Foulger@secretresearch.tld
2153	Marisa.Roufs@secretresearch.tld
1186	Firdaus.Casavez@secretresearch.tld
352	Materia.Newsum@secretresearch.tld
1148	Kyledyr.Constantino@secretresearch.tld
213	Joey.Yarboro@secretresearch.tld
141	Uqbah.Oconnell@secretresearch.tld
1387	Bruno.Barthe@secretresearch.tld
2174	Sebina.Prakoth@secretresearch.tld
2145	Shahaama.Berum@secretresearch.tld
1466	Danaus.Dacanay@secretresearch.tld
327	Ofelia.Golde@secretresearch.tld
1572	Nandin.Uribazo@secretresearch.tld
1699	Ovidio.Bostrom@secretresearch.tld
1977	Querida.Kreatsoulas@secretresearch.tld
2003	Tsumemasa.Lloyd@secretresearch.tld
2223	Alka.Groshek@secretresearch.tld
1999	Doppo.Kieser@secretresearch.tld
1815	Riddhi.Colesar@secretresearch.tld
1651	Bernhareda.Mcclenny@secretresearch.tld
517	Tuhfa.Pedez@secretresearch.tld
1077	Safiyya.Letchaw@secretresearch.tld
2227	Alon.Paulik@secretresearch.tld
700	Dorinda.Cuchiara@secretresearch.tld
941	Satoru.Beaumont@secretresearch.tld
1926	Coireall.Shelor@secretresearch.tld
1152	Kerry.Navarrate@secretresearch.tld
2204	Frangiskos.Truly@secretresearch.tld
2222	Zytka.Skeete@secretresearch.tld
399	Makhna.Stabile@secretresearch.tld
2164	Mya.Swilley@secretresearch.tld
1692	Gota.Dorff@secretresearch.tld
438	Aspasa.Abaunza@secretresearch.tld
692	Tarran.Pointer@secretresearch.tld
882	Ran.Rubendall@secretresearch.tld
2081	Emese.Abadie@secretresearch.tld
2232	Aedd.Lurye@secretresearch.tld
2233	Bennet.Melendes@secretresearch.tld
1702	NewyddIlyn.Borchers@secretresearch.tld
1915	Adamanta.Schlitt@secretresearch.tld
143	Karita.Sukovich@secretresearch.tld
874	Aracely.Kuka@secretresearch.tld
451	Erik.Strothmann@secretresearch.tld
358	Gavriella.Sasson@secretresearch.tld
2152	Mudri.Gamero@secretresearch.tld
168	Adolfa.Leuthauser@secretresearch.tld
2047	Vilena.Orillion@secretresearch.tld
1771	JamAan.Kine@secretresearch.tld
1456	Augusto.Kempson@secretresearch.tld
817	Gil.Holben@secretresearch.tld
236	Gerald.Fieselman@secretresearch.tld
2239	Korotskovaia.Stowell@secretresearch.tld
672	Araceli.Ertel@secretresearch.tld
339	Gorshedna.Marone@secretresearch.tld
833	Kazushige.Goeppner@secretresearch.tld
6	Hypnos.Blank@secretresearch.tld
576	Lottchen.Pillitteri@secretresearch.tld
2218	Cellina.Schlosser@secretresearch.tld
171	Dondrea.Crocco@secretresearch.tld
910	Waliyya.Dandrea@secretresearch.tld
2246	Favio.Mutherspaw@secretresearch.tld
1957	Chantrelle.Gruiger@secretresearch.tld
2248	Kerstine.Finders@secretresearch.tld
2250	Ryo.Zanders@secretresearch.tld
2124	Hedda.Yoshida@secretresearch.tld
2251	Plakida.Gothe@secretresearch.tld
2253	Clmentine.Engellant@secretresearch.tld
867	Asami.Sellek@secretresearch.tld
1218	Marek.Mancino@secretresearch.tld
1256	Miloushka.Pezez@secretresearch.tld
181	Tydeus.Dyckman@secretresearch.tld
801	Lucile.Homola@secretresearch.tld
891	Oles.Sumaran@secretresearch.tld
1619	Fokina.Poythress@secretresearch.tld
1836	Xuqiu.Deller@secretresearch.tld
973	Luitfriede.Westmark@secretresearch.tld
1374	Cipriana.Wadzinski@secretresearch.tld
489	Bhoomika.Secord@secretresearch.tld
1835	Lonce.Jiron@secretresearch.tld
206	Che.Kess@secretresearch.tld
1232	Agpios.Bia@secretresearch.tld
310	Garon.Tischler@secretresearch.tld
1565	Emily.Mileski@secretresearch.tld
1176	Lisandro.Harpst@secretresearch.tld
474	Oka.Prock@secretresearch.tld
1608	Ora.Poleyestewa@secretresearch.tld
2224	Matteo.Mestre@secretresearch.tld
293	Lauranne.Brwon@secretresearch.tld
2051	Guido.Genier@secretresearch.tld
1715	Salamon.Julien@secretresearch.tld
2198	Bruna.Nervis@secretresearch.tld
1090	Igone.Rader@secretresearch.tld
651	Podolphe.Fluitt@secretresearch.tld
1860	Masakazu.Lisko@secretresearch.tld
2071	Immanuel.Bugos@secretresearch.tld
1665	Primavera.Huffstickler@secretresearch.tld
1799	Baucis.Campese@secretresearch.tld
2257	Apela.Brewton@secretresearch.tld
372	Claudios.Lemmert@secretresearch.tld
2259	Tsuruki.Hazelrigg@secretresearch.tld
1583	Wilhelm.Juart@secretresearch.tld
1219	Takuboku.Aicklen@secretresearch.tld
491	Strezislava.Weingard@secretresearch.tld
2243	Fabiana.Demase@secretresearch.tld
1346	Lloyd.Stallsmith@secretresearch.tld
2255	Evgnios.Feasel@secretresearch.tld
772	Sozui.Jalovel@secretresearch.tld
1967	Dyllan.Mairs@secretresearch.tld
1369	Alfonso.Billen@secretresearch.tld
1629	Dewi.Rappleyea@secretresearch.tld
951	Gerakna.Ryneer@secretresearch.tld
1105	Miles.Manero@secretresearch.tld
1479	Newa.Sabina@secretresearch.tld
1951	Iselle.Churches@secretresearch.tld
1982	Gennadi.Schanck@secretresearch.tld
1354	Juri.Guzik@secretresearch.tld
514	Barbie.Dubonnet@secretresearch.tld
1103	Izazkun.Suleski@secretresearch.tld
1685	Dama.Leino@secretresearch.tld
1679	Clariee.Martucci@secretresearch.tld
1370	Vonda.Jasmine@secretresearch.tld
1852	Kobe.Guttirez@secretresearch.tld
1160	Edmondo.Rommelfanger@secretresearch.tld
1475	Salaah.Elio@secretresearch.tld
584	Vseslava.Szollosi@secretresearch.tld
1485	Ariela.Harpine@secretresearch.tld
2219	Juichi.Porep@secretresearch.tld
1391	Iasion.Kirt@secretresearch.tld
454	Alexandros.Lagazo@secretresearch.tld
1909	Aurelian.Fealy@secretresearch.tld
2264	Sherry.Mullennix@secretresearch.tld
254	Inejiro.Javens@secretresearch.tld
1545	Aida.Appelt@secretresearch.tld
28	Kit.Storrs@secretresearch.tld
1914	Sela.Funnye@secretresearch.tld
2265	Aeacus.Veloz@secretresearch.tld
1083	Feofana.Knudsen@secretresearch.tld
2207	Yoshida.Volo@secretresearch.tld
2266	Hita.Porell@secretresearch.tld
2262	Lili.Atoe@secretresearch.tld
1870	Aandranee.Sakamaki@secretresearch.tld
1510	Liska.Lambourne@secretresearch.tld
917	Shiko.Seagroves@secretresearch.tld
2241	Cato.Himmelwright@secretresearch.tld
673	Dianmu.Aver@secretresearch.tld
2006	Nana.Stania@secretresearch.tld
635	Vasilista.Hamic@secretresearch.tld
1114	Luzia.Rahib@secretresearch.tld
2150	Yukako.Klingbeil@secretresearch.tld
1523	Jurgisr.Arkins@secretresearch.tld
1131	Patroklus.Hertel@secretresearch.tld
424	Everardo.Yidiaris@secretresearch.tld
1555	Yoyon.Lecroy@secretresearch.tld
740	Gisselle.Teigen@secretresearch.tld
2268	Christelle.Garced@secretresearch.tld
770	Warona.Pelligrino@secretresearch.tld
2195	Janny.Mccaine@secretresearch.tld
1181	Swidbert.Repka@secretresearch.tld
117	Tienne.Segraves@secretresearch.tld
1058	Apelino.Reeber@secretresearch.tld
2252	Ehud.Bazzle@secretresearch.tld
1451	Ieshige.Kosinski@secretresearch.tld
2185	Shaqeeqa.Levra@secretresearch.tld
79	Chikafusa.Koolman@secretresearch.tld
737	Maksimina.Pecinousky@secretresearch.tld
2269	Saalim.Velasquez@secretresearch.tld
1866	Colombe.Bermea@secretresearch.tld
974	Karina.Eggington@secretresearch.tld
1297	Lashaune.Lava@secretresearch.tld
2130	Lyron.Strawder@secretresearch.tld
638	Roseann.Ora@secretresearch.tld
1759	Vrata.Socks@secretresearch.tld
1394	Egor.Braue@secretresearch.tld
685	LeVaughan.Laity@secretresearch.tld
2244	Fjodora.Sleger@secretresearch.tld
1363	Sanaaa.Yoneda@secretresearch.tld
724	Silvester.Yelvington@secretresearch.tld
2060	Zumruda.Fishman@secretresearch.tld
2236	Ilsegret.Akerley@secretresearch.tld
2226	Yayang.Kuczenski@secretresearch.tld
1908	Tahlia.Francisque@secretresearch.tld
1318	Tramaine.Scruton@secretresearch.tld
1401	Inayat.Deignan@secretresearch.tld
1763	Myshka.Krishnamurthy@secretresearch.tld
1377	Korechika.Mamer@secretresearch.tld
334	Edmonda.Ditullio@secretresearch.tld
631	Alala.Cilento@secretresearch.tld
296	Avniel.Debiase@secretresearch.tld
1667	Vladlena.Tlumacki@secretresearch.tld
2142	Chebi.Selking@secretresearch.tld
827	Kim.Colombe@secretresearch.tld
2139	Galni.Mclarty@secretresearch.tld
1453	Korotsek.Baltzell@secretresearch.tld
248	Juanisha.Seppi@secretresearch.tld
400	Waatiq.Perico@secretresearch.tld
1775	Mercede.Naslund@secretresearch.tld
1237	Walto.Messman@secretresearch.tld
2161	Razan.Symons@secretresearch.tld
279	Zarek.Laasaga@secretresearch.tld
2094	Zufar.Pestoni@secretresearch.tld
2273	Analeigh.Sebring@secretresearch.tld
203	Angela.Hager@secretresearch.tld
588	Atsumori.Bloyer@secretresearch.tld
1304	Diana.Gulbranson@secretresearch.tld
712	Ayla.Moncrief@secretresearch.tld
2245	Leonora.Peli@secretresearch.tld
2034	Holda.Dible@secretresearch.tld
2231	Sharisha.Gebhart@secretresearch.tld
2211	Editta.Servoss@secretresearch.tld
442	Datja.Carner@secretresearch.tld
238	Ajanta.Mischel@secretresearch.tld
2135	Javier.Hausauer@secretresearch.tld
890	Hortense.Ganotisi@secretresearch.tld
366	Hasnaa.Sietsema@secretresearch.tld
2088	Sajag.Traunfeld@secretresearch.tld
1010	Alona.Lucario@secretresearch.tld
1100	Nazarova.Abundis@secretresearch.tld
2258	Jared.Torgersen@secretresearch.tld
953	Volotkoveia.Klees@secretresearch.tld
341	Dmitreeva.Ellsbury@secretresearch.tld
2276	Clarine.Waynick@secretresearch.tld
1071	Graud.Shuker@secretresearch.tld
1611	Marulia.Bondura@secretresearch.tld
8	Amir.Conkling@secretresearch.tld
10	Barsha.Murrain@secretresearch.tld
14	Ruwaid.Solian@secretresearch.tld
34	Duron.Dibella@secretresearch.tld
37	Kywrkh.Tomaino@secretresearch.tld
51	Casandra.Shire@secretresearch.tld
57	Jonam.Steinle@secretresearch.tld
62	Fovro.Chung@secretresearch.tld
74	Zeenab.Lasane@secretresearch.tld
93	Jamaall.Rohen@secretresearch.tld
109	Dirthe.Kiewiet@secretresearch.tld
121	Leonel.Meche@secretresearch.tld
5	Breonia.Gierling@secretresearch.tld
126	Martina.Mcclary@secretresearch.tld
135	Atsumichi.Licano@secretresearch.tld
145	Houke.Luthe@secretresearch.tld
131	Tatiiana.Sublett@secretresearch.tld
155	Khadija.Lagerquist@secretresearch.tld
158	Eskil.Littledave@secretresearch.tld
172	Bernharda.Riese@secretresearch.tld
187	Pieter.Frend@secretresearch.tld
214	Hagibis.Kihn@secretresearch.tld
103	Maysak.Anetsberger@secretresearch.tld
230	Cyril.Croslen@secretresearch.tld
239	Krystyn.Slutsky@secretresearch.tld
243	Elvera.Zito@secretresearch.tld
251	Tasia.Ellenburg@secretresearch.tld
261	Loke.Tuton@secretresearch.tld
270	Elli.Asner@secretresearch.tld
282	Sadayoshi.Englemann@secretresearch.tld
290	Yves.Hunsucker@secretresearch.tld
313	Adrien.Hoit@secretresearch.tld
321	Richild.Brinius@secretresearch.tld
345	Fikriyya.Siddiq@secretresearch.tld
359	Barbi.Denery@secretresearch.tld
363	Irmgard.Accala@secretresearch.tld
373	Lecia.Baumeister@secretresearch.tld
379	Angelica.Maccarter@secretresearch.tld
294	Benita.Hatzenbuehler@secretresearch.tld
403	Ernestine.Barkan@secretresearch.tld
416	Jaen.Kerechanko@secretresearch.tld
420	Jermaine.Mandahl@secretresearch.tld
421	Malcolm.Voelz@secretresearch.tld
429	Latrice.Ghrist@secretresearch.tld
441	Clementine.Barga@secretresearch.tld
446	Anbessa.Gulde@secretresearch.tld
191	Anthony.Row@secretresearch.tld
209	Arcadia.Granade@secretresearch.tld
481	Burkhard.Hussein@secretresearch.tld
482	Ayushmati.Appelgren@secretresearch.tld
487	Junichi.Hagele@secretresearch.tld
494	Rico.Boronat@secretresearch.tld
497	Faqueza.Correll@secretresearch.tld
499	Gigi.Barfuss@secretresearch.tld
507	Tetsui.Zekria@secretresearch.tld
509	Bodil.Korinta@secretresearch.tld
21	Melisa.Patriarco@secretresearch.tld
542	Jascha.Plantier@secretresearch.tld
303	Trina.Sjerven@secretresearch.tld
552	Radha.Sloan@secretresearch.tld
564	Raktavira.Danforth@secretresearch.tld
180	Solange.Alson@secretresearch.tld
580	Heidelore.Ruschmann@secretresearch.tld
589	Carevel.Tardif@secretresearch.tld
642	Juro.Scogin@secretresearch.tld
182	Gulika.Alipio@secretresearch.tld
655	Bailee.Chabolla@secretresearch.tld
662	Agamemnon.Bouras@secretresearch.tld
269	Kemina.Wyke@secretresearch.tld
578	Blossom.Quero@secretresearch.tld
535	Gustel.Pitek@secretresearch.tld
713	Kinaana.Kodera@secretresearch.tld
718	Breana.Scheffler@secretresearch.tld
727	Evdxios.Fageraes@secretresearch.tld
728	Crysta.Mateen@secretresearch.tld
743	Rebeca.Aday@secretresearch.tld
746	Jedrick.Relacion@secretresearch.tld
756	Notburg.Towber@secretresearch.tld
760	Tashiya.Marrable@secretresearch.tld
775	Hidemichi.Tropp@secretresearch.tld
782	Harumi.Valenza@secretresearch.tld
783	Lucretia.Ferndez@secretresearch.tld
486	Sigurd.Mahli@secretresearch.tld
789	Luithilde.Brandolino@secretresearch.tld
794	Faas.Chitty@secretresearch.tld
810	Tyonna.Sturdevant@secretresearch.tld
834	Stopolcha.Starowicz@secretresearch.tld
844	AbdulHaadi.Castellan@secretresearch.tld
850	Severin.Buzard@secretresearch.tld
852	Giselher.Nibler@secretresearch.tld
753	Gratia.Flach@secretresearch.tld
863	Lowell.Kostka@secretresearch.tld
875	Xylina.Mcnicoll@secretresearch.tld
886	Ekantika.Bisogno@secretresearch.tld
105	Eileen.Heick@secretresearch.tld
899	Julien.Triveno@secretresearch.tld
901	Hilmiyya.Pagon@secretresearch.tld
515	Misty.Holladay@secretresearch.tld
920	Llwyr.Fagerstrom@secretresearch.tld
922	Mimi.Stremmel@secretresearch.tld
675	Phaethon.Gearon@secretresearch.tld
944	Khynika.Borwig@secretresearch.tld
946	Daniel.Harriston@secretresearch.tld
956	Toshimichi.Speth@secretresearch.tld
960	Cloelia.Shein@secretresearch.tld
961	Jakoba.Bueche@secretresearch.tld
963	Lippio.Llopis@secretresearch.tld
44	Hilario.Kovats@secretresearch.tld
968	Letizia.Madaras@secretresearch.tld
978	Twain.Sannon@secretresearch.tld
980	Maxime.Higgs@secretresearch.tld
92	Lexi.Faulk@secretresearch.tld
983	Haimo.Huesso@secretresearch.tld
989	Radosha.Ferioli@secretresearch.tld
992	Donald.Ludlow@secretresearch.tld
993	Shijo.Mccullon@secretresearch.tld
222	Akina.Jang@secretresearch.tld
996	Rodell.Sonnefeld@secretresearch.tld
998	Cenon.Colon@secretresearch.tld
1013	Glafira.Geng@secretresearch.tld
697	Oleka.Tommasino@secretresearch.tld
1027	Stolpolcha.Shigemi@secretresearch.tld
1028	Dele.Galla@secretresearch.tld
1053	Aberthol.Wilczak@secretresearch.tld
1054	Annunziata.Ravi@secretresearch.tld
1067	Muni.Mccuiston@secretresearch.tld
717	Solymar.Palisbo@secretresearch.tld
1080	Taliyah.Jafari@secretresearch.tld
1087	Herberta.Fullenwider@secretresearch.tld
1088	Nomi.Rosato@secretresearch.tld
338	Taaliba.Debrita@secretresearch.tld
1095	Gerharde.Heidtbrink@secretresearch.tld
331	Kellie.Frenner@secretresearch.tld
1107	Dorel.Brandt@secretresearch.tld
1122	Calida.Starace@secretresearch.tld
1128	Evamarie.Coraham@secretresearch.tld
1135	Dewayne.Buttermore@secretresearch.tld
1138	Iha.Em@secretresearch.tld
1143	Gia.Stonesifer@secretresearch.tld
1146	ra.Jansons@secretresearch.tld
1154	Sharise.Heagy@secretresearch.tld
1046	Paloma.Schnall@secretresearch.tld
392	Gengyo.Cumbass@secretresearch.tld
1168	Kea.Croshaw@secretresearch.tld
1170	Yakamochi.Alonza@secretresearch.tld
1178	Hortencia.Brenda@secretresearch.tld
1182	Matro.Newell@secretresearch.tld
707	Takehide.Gauna@secretresearch.tld
1194	Tarrant.Alsbrooks@secretresearch.tld
1204	Enya.Coll@secretresearch.tld
1209	Rhea.Platas@secretresearch.tld
1210	Libera.Ahlborn@secretresearch.tld
71	Bia.Klemme@secretresearch.tld
1221	Marce.Fiscalini@secretresearch.tld
1030	Lacrasha.Slavick@secretresearch.tld
1226	Shaakira.Ricklefs@secretresearch.tld
1243	Abdul.Spicer@secretresearch.tld
530	Shontal.Sehnert@secretresearch.tld
1246	Julika.Smar@secretresearch.tld
1250	Clarinda.Oberg@secretresearch.tld
1253	Anissa.Sciarretta@secretresearch.tld
1196	Maureo.Benedict@secretresearch.tld
1265	Petros.Josefy@secretresearch.tld
355	Uleia.Mineah@secretresearch.tld
1271	Nessa.Thomison@secretresearch.tld
1278	Aristomnis.Dauber@secretresearch.tld
1283	Lilly.Rissanen@secretresearch.tld
1286	Hoitsu.Mccahill@secretresearch.tld
1289	Natasia.Sliter@secretresearch.tld
1290	Sameera.Beazley@secretresearch.tld
1291	Leonarda.Imai@secretresearch.tld
389	Paco.Filary@secretresearch.tld
378	Daya.Luhr@secretresearch.tld
56	Raimund.Widdowson@secretresearch.tld
1294	Mirra.Tygart@secretresearch.tld
870	Radoste.Hoefling@secretresearch.tld
1324	Erminia.Damrell@secretresearch.tld
1331	Bussho.Oda@secretresearch.tld
142	Olzhbeta.Hasenberg@secretresearch.tld
506	Takako.Nordine@secretresearch.tld
1350	Torokanova.Kosloski@secretresearch.tld
1352	Toku.Synowiec@secretresearch.tld
1357	Shoichi.Mathey@secretresearch.tld
1359	Delmara.Mrazek@secretresearch.tld
1364	Bhadra.Whidden@secretresearch.tld
1378	Ernst.Bengtson@secretresearch.tld
1382	Aonghas.Pashley@secretresearch.tld
862	Jenna.Ovit@secretresearch.tld
1399	Okichi.Spradlin@secretresearch.tld
1404	Adwr.Liiv@secretresearch.tld
849	Carli.Maggert@secretresearch.tld
66	Huaning.Zwolski@secretresearch.tld
905	Juriaan.Schremp@secretresearch.tld
1282	Hilary.Braddy@secretresearch.tld
1413	Cicely.Genna@secretresearch.tld
1320	Cathy.Phebus@secretresearch.tld
1019	Kiraanna.Scherping@secretresearch.tld
1314	Ksniatintsa.Fuchser@secretresearch.tld
82	Hesperos.Schindele@secretresearch.tld
1434	Pascale.Skripko@secretresearch.tld
573	Sebastiano.Lockyer@secretresearch.tld
1454	Shizu.Capener@secretresearch.tld
1458	Toyoaki.Richoux@secretresearch.tld
1459	Pilib.Seu@secretresearch.tld
1461	Sophronia.Peakes@secretresearch.tld
1310	Chesell.Vatter@secretresearch.tld
1151	Cady.Schweizer@secretresearch.tld
1396	Jace.Ruotolo@secretresearch.tld
1486	Zotico.Cerrano@secretresearch.tld
1488	Dijana.Murfin@secretresearch.tld
1493	Meena.Riegel@secretresearch.tld
1494	Shesha.Humbird@secretresearch.tld
1503	Rufio.Guitard@secretresearch.tld
1059	Liselotte.Groleau@secretresearch.tld
1516	Mitsuo.Neff@secretresearch.tld
444	Honami.Docherty@secretresearch.tld
1519	Leopoldina.Alvey@secretresearch.tld
1526	Bozena.Tilly@secretresearch.tld
1527	Jennie.Schatzel@secretresearch.tld
1321	Erechtheus.Muschick@secretresearch.tld
1532	Pazia.Comnick@secretresearch.tld
1511	Kallie.Bednarek@secretresearch.tld
686	Toyoko.Colden@secretresearch.tld
1550	Majdiyya.Bonsall@secretresearch.tld
1005	Reece.Raburn@secretresearch.tld
555	Elif.Gameros@secretresearch.tld
1198	Jelawat.Balletta@secretresearch.tld
722	Loreliese.Aspri@secretresearch.tld
1470	Lilja.Siwiec@secretresearch.tld
1257	Anzhela.Venturelli@secretresearch.tld
805	Trillare.Stukel@secretresearch.tld
1581	Teodoro.Coyt@secretresearch.tld
300	Patrizio.Iliffe@secretresearch.tld
1584	Vychan.Stotz@secretresearch.tld
1248	Faith.Neeld@secretresearch.tld
480	Dayu.Vient@secretresearch.tld
948	Alyss.Wuitschick@secretresearch.tld
1599	Lane.Portes@secretresearch.tld
125	Vasuki.Riech@secretresearch.tld
344	Jafar.Abbenante@secretresearch.tld
1141	Naglaya.Tantillo@secretresearch.tld
1189	Argus.Bierwirth@secretresearch.tld
1610	Yuka.Heikes@secretresearch.tld
1039	Patrido.Sielaff@secretresearch.tld
1615	Eshita.Whitby@secretresearch.tld
1618	Constantino.Thielen@secretresearch.tld
1425	Deelon.Sephton@secretresearch.tld
1628	Tamah.Misemer@secretresearch.tld
1300	Husain.Coaxum@secretresearch.tld
1642	Muzammil.Mutter@secretresearch.tld
1625	Francoise.Rioux@secretresearch.tld
1262	Kakuei.Blanford@secretresearch.tld
1655	Ieshia.Demarrais@secretresearch.tld
869	Winand.Poulton@secretresearch.tld
1658	Jake.Bober@secretresearch.tld
1659	Mukhtaar.Grewe@secretresearch.tld
1662	Bhavin.Primavera@secretresearch.tld
1026	Elvis.Rocasah@secretresearch.tld
1673	Kaveri.Zombro@secretresearch.tld
1675	Dymas.Houskeeper@secretresearch.tld
1460	Graziana.Callabrass@secretresearch.tld
1464	Brittani.Gasman@secretresearch.tld
1695	Alonza.Galyan@secretresearch.tld
1707	Iudita.Altew@secretresearch.tld
1716	Sam.Mattheis@secretresearch.tld
1718	Conchetta.Cater@secretresearch.tld
1724	Uliaanitsa.Samul@secretresearch.tld
1725	Isadoro.Bently@secretresearch.tld
1729	Emmanoul.Gianunzio@secretresearch.tld
967	Fedoritsa.Stinner@secretresearch.tld
1734	Garrett.Blair@secretresearch.tld
1075	Uchdryd.Locicero@secretresearch.tld
1668	Adelio.Zahner@secretresearch.tld
977	Fedyenka.Terrasi@secretresearch.tld
176	Adriaan.Belter@secretresearch.tld
33	Galyn.Stobie@secretresearch.tld
1744	Tamiko.Docken@secretresearch.tld
434	Vasyklo.Netz@secretresearch.tld
666	Deverell.Anez@secretresearch.tld
1035	Salmoneus.Duncans@secretresearch.tld
1295	Inocente.Arntzen@secretresearch.tld
1765	Brenda.Varley@secretresearch.tld
1773	Ashakiran.Bingley@secretresearch.tld
1779	Feli.Trainham@secretresearch.tld
1780	Berakhiah.Province@secretresearch.tld
276	Giovanna.Douthit@secretresearch.tld
1782	Natascha.Neverson@secretresearch.tld
1787	Cherry.Dolence@secretresearch.tld
831	Michizane.Krips@secretresearch.tld
1112	Ineng.Alkbsh@secretresearch.tld
1791	Caden.Failing@secretresearch.tld
309	Mikio.Brunston@secretresearch.tld
1795	Sibylla.Reas@secretresearch.tld
558	Casswallawn.Scheiblich@secretresearch.tld
1803	Liebtraud.Schorsch@secretresearch.tld
816	Tanja.Lockmiller@secretresearch.tld
165	Jeanine.Garoner@secretresearch.tld
465	Kiuprila.Inscore@secretresearch.tld
1698	Aseel.Waddups@secretresearch.tld
23	Booker.Spiker@secretresearch.tld
1824	Dunja.Luchenbill@secretresearch.tld
1826	Fajyaz.Mutana@secretresearch.tld
755	Eberhardine.Hazim@secretresearch.tld
1033	Namiko.Leval@secretresearch.tld
1844	Parma.Borgese@secretresearch.tld
289	Shinji.Kapler@secretresearch.tld
709	Einian.Frascella@secretresearch.tld
1772	Gizla.Nordmark@secretresearch.tld
1859	Detana.Trautz@secretresearch.tld
1822	Jazmine.Susman@secretresearch.tld
1132	Irminwin.Milloy@secretresearch.tld
1854	YolandaAbigail.Insogna@secretresearch.tld
1873	Noburo.Charleton@secretresearch.tld
1877	Goncalo.Gahm@secretresearch.tld
1878	Jada.Grech@secretresearch.tld
1429	Socorro.Mcsorley@secretresearch.tld
144	Emina.Yeeloy@secretresearch.tld
883	Tango.Constable@secretresearch.tld
412	Yoriko.Boot@secretresearch.tld
1337	Fanaila.Torain@secretresearch.tld
223	Fahroni.Anglea@secretresearch.tld
415	Bezubaia.Wiece@secretresearch.tld
1893	Alwin.Roewe@secretresearch.tld
199	Marna.Crookshanks@secretresearch.tld
1525	Soshu.Burress@secretresearch.tld
803	Sander.Garriss@secretresearch.tld
1837	Zeanes.Hinsley@secretresearch.tld
1899	Ivonne.Elreda@secretresearch.tld
1901	Kuemon.Coatie@secretresearch.tld
1794	Krystal.Farria@secretresearch.tld
1162	Luca.Dolbin@secretresearch.tld
1904	Janita.Bolieu@secretresearch.tld
48	Sypovaia.Wegmann@secretresearch.tld
1578	Angha.Bievenue@secretresearch.tld
1509	Koshiro.Augusto@secretresearch.tld
765	Nik.Reposa@secretresearch.tld
\.



COPY has_members ("Committee", "Committee_member") FROM stdin;
140	141
140	142
140	143
140	144
160	98
160	158
160	823
160	1120
160	1210
160	1815
160	2185
314	48
314	313
314	403
314	584
314	585
317	48
317	313
317	403
317	584
317	585
510	6
510	300
510	509
510	1454
510	1599
510	1644
510	1673
1000	56
1000	800
1000	998
1000	1396
1000	1800
1489	558
1489	759
1489	1464
1489	1488
1489	2139
\.



COPY invited_by ("Reviewer1", "Reviewer2") FROM stdin;
\.



ALTER TABLE ONLY "Abstract"
    ADD CONSTRAINT "AbstractPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Committee"
    ADD CONSTRAINT "CommitteePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Conference_document"
    ADD CONSTRAINT "Conference_documentPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Conference_fees"
    ADD CONSTRAINT "Conference_feesPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Conference_proceedings"
    ADD CONSTRAINT "Conference_proceedingsPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Conference_volume"
    ADD CONSTRAINT "Conference_volumePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Important_dates"
    ADD CONSTRAINT "Important_datesPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Invited_talk"
    ADD CONSTRAINT "Invited_talkPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Organization"
    ADD CONSTRAINT "OrganizationPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Organizer"
    ADD CONSTRAINT "OrganizerPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Organizing_committee"
    ADD CONSTRAINT "Organizing_committeePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Person"
    ADD CONSTRAINT "PersonPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Poster"
    ADD CONSTRAINT "PosterPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Publisher"
    ADD CONSTRAINT "PublisherPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Review"
    ADD CONSTRAINT "ReviewPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Review_expertise"
    ADD CONSTRAINT "Review_expertisePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Review_preference"
    ADD CONSTRAINT "Review_preferencePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Steering_committee"
    ADD CONSTRAINT "Steering_committeePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Topic"
    ADD CONSTRAINT "TopicPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Track"
    ADD CONSTRAINT "TrackPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Tutorial"
    ADD CONSTRAINT "TutorialPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Workshop"
    ADD CONSTRAINT "WorkshopPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY belongs_to_reviewers
    ADD CONSTRAINT "belongs_to_reviewersPK" PRIMARY KEY ("Entity", "Reviewer");



ALTER TABLE ONLY contributes
    ADD CONSTRAINT "contributesPK" PRIMARY KEY ("Person", "Conference_document");



ALTER TABLE ONLY "has_a_committee_co-chair"
    ADD CONSTRAINT "has_a_committee_co-chairPK" PRIMARY KEY ("Committee", "Co-chair");



ALTER TABLE ONLY "has_a_track-workshop-tuto"
    ADD CONSTRAINT "has_a_track-workshop-tutoPK" PRIMARY KEY ("Conference_part", "Topic");



ALTER TABLE ONLY has_an_email
    ADD CONSTRAINT "has_an_emailPK" PRIMARY KEY ("Person", "VALUE");



ALTER TABLE ONLY has_members
    ADD CONSTRAINT "has_membersPK" PRIMARY KEY ("Committee", "Committee_member");



ALTER TABLE ONLY invited_by
    ADD CONSTRAINT "invited_byPK" PRIMARY KEY ("Reviewer1", "Reviewer2");



ALTER TABLE ONLY "Abstract"
    ADD CONSTRAINT "Abstract_ID_fkey" FOREIGN KEY ("ID") REFERENCES "Conference_document"("ID");



ALTER TABLE ONLY "Abstract"
    ADD CONSTRAINT "Abstract_is_submitted_at_fkey" FOREIGN KEY (is_submitted_at) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY "Committee"
    ADD CONSTRAINT "Committee_CHILD_DATA_was_a_program_committee_of_fkey" FOREIGN KEY (was_a_program_committee_of) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY "Committee"
    ADD CONSTRAINT "Committee_has_a_committee_chair_fkey" FOREIGN KEY (has_a_committee_chair) REFERENCES "Person"("ID");



ALTER TABLE ONLY "Conference_volume"
    ADD CONSTRAINT "Conference_volume_has_a_program_committee_fkey" FOREIGN KEY (has_a_program_committee) REFERENCES "Committee"("ID");



ALTER TABLE ONLY "Conference_volume"
    ADD CONSTRAINT "Conference_volumehas_a2FK" FOREIGN KEY (has_a_steering_committee) REFERENCES "Steering_committee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Conference_proceedings"
    ADD CONSTRAINT "FKConference_proceedingsh" FOREIGN KEY (has_a_publisher) REFERENCES "Publisher"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Conference_volume"
    ADD CONSTRAINT "FKConference_volumehas_an" FOREIGN KEY (has_an_organizing_committ) REFERENCES "Organizing_committee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Conference_volume"
    ADD CONSTRAINT "FKConference_volumehas_im" FOREIGN KEY (has_important_dates) REFERENCES "Important_dates"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Organizing_committee"
    ADD CONSTRAINT "FKOrganizing_committeeURI" FOREIGN KEY ("ID") REFERENCES "Committee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Organizing_committee"
    ADD CONSTRAINT "FKOrganizing_committeewas" FOREIGN KEY (was_an_organizing_committ) REFERENCES "Conference_volume"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "FKPaperhas_an_abstract" FOREIGN KEY (has_an_abstract) REFERENCES "Abstract"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Poster"
    ADD CONSTRAINT "FKPosterhas_an_abstract" FOREIGN KEY (has_an_abstract) REFERENCES "Abstract"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Review"
    ADD CONSTRAINT "FKReviewURI" FOREIGN KEY ("ID") REFERENCES "Conference_document"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Review_preference"
    ADD CONSTRAINT "FKReview_preferencebelong" FOREIGN KEY (belongs_to_a_review_refer) REFERENCES "Topic"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Steering_committee"
    ADD CONSTRAINT "FKSteering_committeeURI" FOREIGN KEY ("ID") REFERENCES "Committee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Steering_committee"
    ADD CONSTRAINT "FKSteering_committeewas_a" FOREIGN KEY (was_a_steering_committee_) REFERENCES "Conference_volume"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Track"
    ADD CONSTRAINT "FKTrackhas_tracks_Inv" FOREIGN KEY ("has_tracks_Inv") REFERENCES "Conference_volume"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Tutorial"
    ADD CONSTRAINT "FKTutorialhas_tutorials_Inv" FOREIGN KEY ("has_tutorials_Inv") REFERENCES "Conference_volume"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Workshop"
    ADD CONSTRAINT "FKWorkshophas_workshops_Inv" FOREIGN KEY ("has_workshops_Inv") REFERENCES "Conference_volume"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY contributes
    ADD CONSTRAINT "FKcontributesConference_d" FOREIGN KEY ("Conference_document") REFERENCES "Conference_document"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY contributes
    ADD CONSTRAINT "FKcontributesPerson" FOREIGN KEY ("Person") REFERENCES "Person"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "has_a_committee_co-chair"
    ADD CONSTRAINT "FKhas_a_committee_co-chai" FOREIGN KEY ("Committee") REFERENCES "Committee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "has_a_track-workshop-tuto"
    ADD CONSTRAINT "FKhas_a_track-workshop-tu" FOREIGN KEY ("Conference_part") REFERENCES "Tutorial"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY has_an_email
    ADD CONSTRAINT "FKhas_an_emailPerson" FOREIGN KEY ("Person") REFERENCES "Person"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY has_members
    ADD CONSTRAINT "FKhas_membersCommittee" FOREIGN KEY ("Committee") REFERENCES "Committee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Invited_talk"
    ADD CONSTRAINT "Invited_talk_ID_fkey" FOREIGN KEY ("ID") REFERENCES "Conference_document"("ID");



ALTER TABLE ONLY "Invited_talk"
    ADD CONSTRAINT "Invited_talk_has_an_abstract_fkey" FOREIGN KEY (has_an_abstract) REFERENCES "Abstract"("ID");



ALTER TABLE ONLY "Invited_talk"
    ADD CONSTRAINT "Invited_talk_is_given_by_fkey" FOREIGN KEY (is_given_by) REFERENCES "Person"("ID");



ALTER TABLE ONLY "Invited_talk"
    ADD CONSTRAINT "Invited_talk_is_submitted_at_fkey" FOREIGN KEY (is_submitted_at) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "Paper_ID_fkey" FOREIGN KEY ("ID") REFERENCES "Conference_document"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "Paper_is_submitted_at_fkey" FOREIGN KEY (is_submitted_at) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY "Poster"
    ADD CONSTRAINT "Poster_ID_fkey" FOREIGN KEY ("ID") REFERENCES "Conference_document"("ID");



ALTER TABLE ONLY "Poster"
    ADD CONSTRAINT "Poster_is_submitted_at_fkey" FOREIGN KEY (is_submitted_at) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY "Review_expertise"
    ADD CONSTRAINT "Review_expertise_has_a_submitted_contribut_fkey" FOREIGN KEY (has_a_submitted_contribut) REFERENCES "Paper"("ID");



ALTER TABLE ONLY "Review"
    ADD CONSTRAINT "Review_reviews_fkey" FOREIGN KEY (reviews) REFERENCES "Paper"("ID");



ALTER TABLE ONLY "Track"
    ADD CONSTRAINT "Track_has_a_track-workshop-tuto_fkey" FOREIGN KEY ("has_a_track-workshop-tuto") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Track"
    ADD CONSTRAINT "Track_is_part_of_conference_vol_fkey" FOREIGN KEY (is_part_of_conference_vol) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY "Tutorial"
    ADD CONSTRAINT "Tutorial_is_part_of_conference_vol_fkey" FOREIGN KEY (is_part_of_conference_vol) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY "Workshop"
    ADD CONSTRAINT "Workshop_has_a_track-workshop-tuto_fkey" FOREIGN KEY ("has_a_track-workshop-tuto") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Workshop"
    ADD CONSTRAINT "Workshop_is_part_of_conference_vol_fkey" FOREIGN KEY (is_part_of_conference_vol) REFERENCES "Conference_volume"("ID");



ALTER TABLE ONLY belongs_to_reviewers
    ADD CONSTRAINT "belongs_to_reviewers_Reviewer_fkey" FOREIGN KEY ("Reviewer") REFERENCES "Person"("ID");



ALTER TABLE ONLY "has_a_committee_co-chair"
    ADD CONSTRAINT "has_a_committee_co-chair_Co-chair_fkey" FOREIGN KEY ("Co-chair") REFERENCES "Person"("ID");



ALTER TABLE ONLY "has_a_track-workshop-tuto"
    ADD CONSTRAINT "has_a_track-workshop-t2FK" FOREIGN KEY ("Topic") REFERENCES "Topic"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY has_members
    ADD CONSTRAINT "has_members_Committee_member_fkey" FOREIGN KEY ("Committee_member") REFERENCES "Person"("ID");



ALTER TABLE ONLY invited_by
    ADD CONSTRAINT "invited_by_Reviewer1_fkey" FOREIGN KEY ("Reviewer1") REFERENCES "Person"("ID");



ALTER TABLE ONLY invited_by
    ADD CONSTRAINT "invited_by_Reviewer2_fkey" FOREIGN KEY ("Reviewer2") REFERENCES "Person"("ID");
