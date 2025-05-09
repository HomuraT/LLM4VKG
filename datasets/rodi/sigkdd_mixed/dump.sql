

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP SCHEMA IF EXISTS sigkdd_mixed CASCADE;
CREATE SCHEMA sigkdd_mixed;
SET search_path = sigkdd_mixed, pg_catalog;


SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE acm_sigkdd_person (
    aid integer NOT NULL,
    pid integer NOT NULL
);


CREATE TABLE acm_sigkdds (
    id integer NOT NULL
);


CREATE TABLE best_paper_awards_committs (
    id integer NOT NULL,
    award integer,
    committee integer,
    cid integer
);


CREATE TABLE best_research_paper_awards (
    id integer NOT NULL,
    type integer DEFAULT 0
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
    id integer NOT NULL,
    designed integer,
    date date,
    type integer DEFAULT 0
);


CREATE TABLE document_deadline_abstract_submiss (
    document integer NOT NULL,
    deadline integer NOT NULL
);


CREATE TABLE document_person (
    pid integer NOT NULL,
    did integer NOT NULL
);


CREATE TABLE documents (
    id integer NOT NULL,
    title character varying(101),
    type integer DEFAULT 0
);


CREATE TABLE e_mails (
    person integer NOT NULL,
    value character varying(43) NOT NULL
);


CREATE TABLE main_office_person (
    pid integer NOT NULL,
    mid integer NOT NULL
);


CREATE TABLE main_offices (
    id integer NOT NULL,
    lat integer,
    long integer,
    street character varying(199),
    postal_code integer,
    type integer DEFAULT 0
);


CREATE TABLE organizing_committees (
    id integer NOT NULL,
    cid integer,
    committee integer
);


CREATE TABLE person_best_research_paper_award (
    pid integer NOT NULL,
    bid integer NOT NULL
);


CREATE TABLE person_deadline_abstract_submiss (
    pid integer NOT NULL,
    did integer NOT NULL
);


CREATE TABLE persons (
    id integer NOT NULL,
    nation character varying(199),
    name character varying(24),
    name_sponsor character varying(199),
    organizator boolean DEFAULT false,
    program_chair boolean DEFAULT false,
    listener boolean DEFAULT false,
    author_paper_student boolean DEFAULT false,
    program_committee_member boolean DEFAULT false,
    type integer DEFAULT 0
);


CREATE TABLE presentation (
    pid integer NOT NULL,
    did integer NOT NULL
);


CREATE TABLE program_committees (
    id integer NOT NULL,
    label character varying(29),
    committee integer,
    cid integer
);


CREATE TABLE registration_fee_person (
    pid integer NOT NULL,
    rid integer NOT NULL
);


CREATE TABLE registration_fees (
    id integer NOT NULL,
    currency character varying(199),
    price integer,
    type integer DEFAULT 0
);


CREATE TABLE reviews (
    id integer NOT NULL,
    ref integer,
    review integer,
    internal_id integer,
    text character varying(191)
);


CREATE TABLE sponzor_fees (
    id integer NOT NULL,
    currency character varying(199),
    price integer
);


COPY acm_sigkdd_person (aid, pid) FROM stdin;
\.



COPY acm_sigkdds (id) FROM stdin;
\.



COPY best_paper_awards_committs (id, award, committee, cid) FROM stdin;
\.



COPY best_research_paper_awards (id, type) FROM stdin;
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



COPY deadline_abstract_submiss (id, designed, date, type) FROM stdin;
\.



COPY document_deadline_abstract_submiss (document, deadline) FROM stdin;
\.



COPY document_person (pid, did) FROM stdin;
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



COPY documents (id, title, type) FROM stdin;
907	vagus kinkiest xix recollected householder	2
912	maxillary dumpers bering evasiveness	2
915	swifters redigesting ostinato recalculation safest signiory	2
916	skeins equalled sandwiching bewitchment cheaters	2
1775	admiralties bewigged playgoers cheques batting waspishly stilbestrol	2
1779	forbearer anesthetization undermentioned outflanking	2
1784	loftily yabber reprovingly blungers dwarflike	2
1792	mohairs admiralties bewigged playgoers	2
1795	sandwiching bewitchment cheaters riffled kerneling	2
1800	anesthetization undermentioned outflanking funnyman commuted lachrymation	2
1806	grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly	2
1808	slipcases phenylketonuria grunts venturers	2
1811	recelebrating dually plateauing reoccupations embossers	2
1814	objurgate treaties preprocessor despising loftily	2
1820	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	2
1822	loathly cancels debiting parrots paraguayans resonates	2
1824	recalculation safest signiory latchets inflecting trephines hops	2
1827	earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	2
1833	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	2
1837	acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	2
1844	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	2
1847	apnea maxillary dumpers bering evasiveness toto	2
1850	polers oinked apnea maxillary dumpers bering	2
1855	firefanged skeins equalled sandwiching	2
1856	desexes summable heliocentricity excretions recelebrating dually plateauing	2
1860	grunts venturers valiantly unremorsefully extradites	2
1863	tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest	2
1866	oralogy tibetans slavishly hipless prs bluejays	2
1869	goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated	2
1873	floweret arcadian acridities unrealistic substituting surges	2
1874	teratoid coadjutors thuggeries nondestructive	2
1880	dwelling scrapped prat islanded burlily	2
1881	funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges	2
1886	lenity tautological jambing sodality	2
1890	prat islanded burlily thanklessly swiveled polers oinked	2
1892	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	2
1895	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	2
1897	undamped sharpers forbearer anesthetization	2
1901	acridities unrealistic substituting surges preheats loggias	2
1905	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	2
1909	objurgate treaties preprocessor despising loftily yabber reprovingly	2
1910	toto teashop reaccepts gunneries exorcises pirog	2
1914	latchets inflecting trephines hops exec junketeers isolators reducing	2
1915	kerneling napoleons rifer splinting surmisers satisfying undamped	2
1919	rhythmical wastebaskets powderer immigrates inserter	2
1922	conditione loathly cancels debiting parrots paraguayans resonates overbites	2
1928	decentralizing hogfishes gantleted richer succories dwelling	2
1931	nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular	2
1933	exorcises pirog desexes summable	2
1937	sandwiching bewitchment cheaters riffled kerneling	2
1940	pirog desexes summable heliocentricity	2
1942	excretions recelebrating dually plateauing	2
1944	loggias reconciliating photocatalyst lenity tautological jambing	2
1946	burlily thanklessly swiveled polers oinked apnea maxillary	2
1948	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	2
1949	gloves mohairs admiralties bewigged playgoers cheques batting waspishly	2
1951	immediately canzona interrelated cooked	2
1952	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	2
1956	blungers dwarflike effulgences coreless	2
1959	reducing nethermost nonfiction retrogressions eliminates	2
1967	toto teashop reaccepts gunneries exorcises	2
1970	funnyman commuted lachrymation floweret arcadian acridities unrealistic	2
1972	reoccupations embossers cerebrum gloves mohairs admiralties	2
1979	desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	2
1982	cheaters riffled kerneling napoleons	2
1987	photocatalyst lenity tautological jambing sodality	2
1990	fobbed transcribed swifters redigesting ostinato recalculation	2
1994	desexes summable heliocentricity excretions recelebrating dually plateauing	2
2001	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria	2
2008	heliocentricity excretions recelebrating dually plateauing reoccupations embossers	2
2011	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	2
2015	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	2
2017	batting waspishly stilbestrol villainousness miscalling	2
426	\N	3
428	\N	3
2020	lachrymation floweret arcadian acridities unrealistic substituting	2
678	sharpers forbearer anesthetization undermentioned	2
696	surges preheats loggias reconciliating photocatalyst	2
700	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	2
705	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	2
331	\N	3
337	\N	3
706	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	2
718	maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises	2
727	rifer splinting surmisers satisfying undamped sharpers forbearer	2
732	grunts venturers valiantly unremorsefully	2
733	cancels debiting parrots paraguayans resonates overbites terminals giros	2
741	brill neologic intermuscular fobbed transcribed	2
747	malines cliffhanger entailments reindexed bedstraws thoughtless	2
763	neurosurgeon innervated hunts barrens emanative blowpipe varies	2
764	rifer splinting surmisers satisfying undamped	2
780	floweret arcadian acridities unrealistic substituting surges	2
789	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	2
801	playgoers cheques batting waspishly stilbestrol villainousness	2
808	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	2
813	exorcises pirog desexes summable heliocentricity	2
822	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly	2
826	mohairs admiralties bewigged playgoers cheques batting	2
827	effulgences coreless tuberculoses environs	2
837	peeped daydreams permuting immediately canzona interrelated cooked	2
842	nonfiction retrogressions eliminates unknowns mongoloids	2
844	anesthetization undermentioned outflanking funnyman	2
852	manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds	2
855	giros podgy vagus kinkiest xix	2
862	richer succories dwelling scrapped prat islanded burlily thanklessly swiveled	2
875	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	2
883	recelebrating dually plateauing reoccupations embossers cerebrum gloves	2
890	evasiveness toto teashop reaccepts gunneries exorcises	2
892	rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization	2
899	plateauing reoccupations embossers cerebrum gloves mohairs admiralties	2
924	bounden occulters blubberer amenities desecrated tetrachlorides loutish	2
925	venturers valiantly unremorsefully extradites stollens ponderers	2
929	unmuzzling measles decentralizing hogfishes	2
930	tibetans slavishly hipless prs bluejays cuppier nonsurgical	2
962	miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	2
966	gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	2
968	unrealistic substituting surges preheats	2
975	dwelling scrapped prat islanded burlily	2
984	plateauing reoccupations embossers cerebrum gloves mohairs	2
988	nigglings midmonths labium peeped daydreams permuting immediately canzona	2
990	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	2
992	treaties preprocessor despising loftily yabber reprovingly blungers dwarflike	2
589	sandwiching bewitchment cheaters riffled kerneling	1
151	evasiveness toto teashop reaccepts	1
531	latchets inflecting trephines hops exec junketeers isolators reducing	1
676	disjoined nigglings midmonths labium peeped daydreams	1
266	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	1
277	perspicuously disjoined nigglings midmonths labium peeped daydreams permuting	1
418	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	1
669	plateauing reoccupations embossers cerebrum gloves mohairs admiralties	1
1245	arcadian acridities unrealistic substituting surges preheats loggias	1
1389	mohairs admiralties bewigged playgoers	1
433	\N	3
437	\N	3
270	admiralties bewigged playgoers cheques batting	1
183	forbearer anesthetization undermentioned outflanking funnyman	1
16	recelebrating dually plateauing reoccupations embossers	1
476	anesthetization undermentioned outflanking funnyman commuted lachrymation	1
246	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	1
623	firefanged skeins equalled sandwiching	1
571	bewitchment cheaters riffled kerneling napoleons rifer	1
438	giros podgy vagus kinkiest xix recollected householder	1
563	vagus kinkiest xix recollected householder	1
612	attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	1
60	miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	1
677	mongoloids danker raunchiness perspicuously disjoined nigglings midmonths	1
101	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	1
374	rifer splinting surmisers satisfying undamped	1
240	measles decentralizing hogfishes gantleted richer	1
497	skeins equalled sandwiching bewitchment cheaters	1
909	apnea maxillary dumpers bering evasiveness toto	1
95	transcribed swifters redigesting ostinato recalculation safest	1
901	immediately canzona interrelated cooked	1
105	bewigged playgoers cheques batting waspishly stilbestrol	1
297	lachrymation floweret arcadian acridities unrealistic	1
1247	surges preheats loggias reconciliating photocatalyst lenity tautological	1
881	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	1
554	toto teashop reaccepts gunneries exorcises pirog desexes	1
464	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters	1
219	jambing sodality outcrop slipcases	1
1580	summable heliocentricity excretions recelebrating	1
68	islanded burlily thanklessly swiveled polers oinked apnea maxillary	1
339	\N	3
1051	isolators reducing nethermost nonfiction	1
427	loathly cancels debiting parrots paraguayans resonates	1
758	slipcases phenylketonuria grunts venturers	1
255	undermentioned outflanking funnyman commuted lachrymation floweret arcadian	1
37	oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts	1
157	exorcises pirog desexes summable heliocentricity	1
85	oinked apnea maxillary dumpers	1
737	cooked reformers goodwife technicolor plenishes	1
749	loathly cancels debiting parrots paraguayans resonates overbites	1
574	vagus kinkiest xix recollected householder overeducated objurgate treaties	1
45	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	1
287	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	1
1487	grunts venturers valiantly unremorsefully extradites stollens ponderers conditione loathly	1
194	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	1
295	tibetans slavishly hipless prs bluejays cuppier nonsurgical skimpiest	1
841	unrealistic substituting surges preheats loggias reconciliating photocatalyst	1
179	dissociated heartier petitionee brill	1
505	giros podgy vagus kinkiest xix recollected householder overeducated	1
941	cheaters riffled kerneling napoleons	1
567	dumpers bering evasiveness toto	1
131	forbearer anesthetization undermentioned outflanking funnyman	1
190	gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol	1
787	exorcises pirog desexes summable	1
502	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	1
1139	bedstraws thoughtless elation swampland earings circumscribed paralyzingly	1
419	maxillary dumpers bering evasiveness	1
745	loggias reconciliating photocatalyst lenity tautological jambing	1
629	phenylketonuria grunts venturers valiantly	1
452	jambing sodality outcrop slipcases phenylketonuria grunts	1
725	exec junketeers isolators reducing	1
576	mohairs admiralties bewigged playgoers cheques batting	1
1229	acridities unrealistic substituting surges preheats loggias	1
846	despising loftily yabber reprovingly blungers dwarflike effulgences coreless	1
608	photocatalyst lenity tautological jambing sodality	1
861	extradites stollens ponderers conditione loathly cancels debiting	1
1048	burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering	1
360	effulgences coreless tuberculoses environs	1
313	forbearer anesthetization undermentioned outflanking	1
680	loggias reconciliating photocatalyst lenity tautological jambing sodality	1
209	ponderers conditione loathly cancels debiting parrots	1
107	emanative blowpipe varies thickest machinability orbiters tormentor owner	1
569	cerebrum gloves mohairs admiralties	1
391	ponderers conditione loathly cancels debiting parrots paraguayans	1
839	gloves mohairs admiralties bewigged playgoers cheques batting	1
647	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	1
364	excretions recelebrating dually plateauing	1
55	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons	1
850	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	1
597	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	1
238	paraguayans resonates overbites terminals giros	1
1079	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	1
511	polers oinked apnea maxillary dumpers bering	1
1181	recalculation safest signiory latchets inflecting trephines hops	1
141	swiveled polers oinked apnea maxillary dumpers bering evasiveness	1
323	extradites stollens ponderers conditione loathly	1
1060	mongoloids danker raunchiness perspicuously disjoined	1
341	brill neologic intermuscular fobbed transcribed	1
752	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	1
314	bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	1
562	bounden occulters blubberer amenities	1
214	dually plateauing reoccupations embossers cerebrum gloves	1
1212	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	1
545	gloves mohairs admiralties bewigged	1
594	acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	1
148	dwelling scrapped prat islanded burlily	1
738	zanier corkscrewed promiscuousness clewed	1
386	floweret arcadian acridities unrealistic substituting surges	1
39	blungers dwarflike effulgences coreless	1
454	unmuzzling measles decentralizing hogfishes	1
66	pirog desexes summable heliocentricity	1
275	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	1
336	oinked apnea maxillary dumpers bering evasiveness toto	1
1087	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity	1
492	grunts venturers valiantly unremorsefully extradites	1
1290	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	1
665	reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	1
373	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological	1
866	reaccepts gunneries exorcises pirog desexes summable heliocentricity	1
18	preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	1
343	\N	3
1639	toto teashop reaccepts gunneries exorcises	1
186	tautological jambing sodality outcrop slipcases phenylketonuria	1
819	cheaters riffled kerneling napoleons rifer splinting	1
109	valiantly unremorsefully extradites stollens ponderers conditione	1
385	preheats loggias reconciliating photocatalyst lenity tautological	1
487	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	1
646	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	1
750	objurgate treaties preprocessor despising loftily	1
902	lachrymation floweret arcadian acridities unrealistic	1
513	canzona interrelated cooked reformers goodwife technicolor plenishes nippy	1
477	manifestly decaffeinates scalepan folklorists attractive yeller cognizably reminds	1
642	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	1
523	technicolor plenishes nippy bounden occulters blubberer	1
1500	petitionee brill neologic intermuscular	1
430	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers valiantly	1
259	rifer splinting surmisers satisfying undamped sharpers forbearer	1
118	loftily yabber reprovingly blungers dwarflike	1
691	conditione loathly cancels debiting parrots paraguayans resonates overbites	1
308	floweret arcadian acridities unrealistic substituting surges	1
87	dually plateauing reoccupations embossers	1
330	cancels debiting parrots paraguayans resonates overbites terminals giros	1
171	extradites stollens ponderers conditione loathly cancels debiting	1
262	hogfishes gantleted richer succories dwelling scrapped prat	1
127	environs hulled preexamination oralogy tibetans slavishly hipless	1
817	desexes summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	1
167	fobbed transcribed swifters redigesting ostinato recalculation	1
754	grunts venturers valiantly unremorsefully extradites	1
757	lachrymation floweret arcadian acridities unrealistic substituting	1
849	batting waspishly stilbestrol villainousness miscalling	1
769	debiting parrots paraguayans resonates overbites terminals giros podgy vagus	1
775	admiralties bewigged playgoers cheques batting waspishly stilbestrol	1
282	funnyman commuted lachrymation floweret arcadian	1
0	undermentioned outflanking funnyman commuted lachrymation floweret	1
450	skeins equalled sandwiching bewitchment	1
942	kerneling napoleons rifer splinting surmisers satisfying undamped	1
136	bounden occulters blubberer amenities desecrated tetrachlorides loutish	1
41	raunchiness perspicuously disjoined nigglings midmonths labium peeped	1
104	gunneries exorcises pirog desexes	1
1036	debiting parrots paraguayans resonates overbites terminals giros podgy	1
429	swiveled polers oinked apnea maxillary	1
1013	villainousness miscalling firefanged skeins	1
510	excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	1
885	gloves mohairs admiralties bewigged playgoers cheques batting waspishly	1
311	surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	1
981	outpoured dissociated heartier petitionee	1
397	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	1
753	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	1
99	funnyman commuted lachrymation floweret arcadian	1
221	ponderers conditione loathly cancels debiting parrots paraguayans resonates	1
142	heliocentricity excretions recelebrating dually plateauing reoccupations	1
527	recelebrating dually plateauing reoccupations embossers cerebrum gloves	1
90	treaties preprocessor despising loftily yabber reprovingly blungers dwarflike	1
31	alkalin succulently marquise underlaid neurosurgeon innervated	1
249	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	1
467	nonfiction retrogressions eliminates unknowns mongoloids	1
579	swifters redigesting ostinato recalculation safest signiory	1
695	inserter plights corollaries gaudiness irades inadvisability	1
365	neurosurgeon innervated hunts barrens emanative blowpipe varies	1
651	objurgate treaties preprocessor despising	1
519	commuted lachrymation floweret arcadian	1
231	waspishly stilbestrol villainousness miscalling	1
1038	reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination	1
299	unrealistic substituting surges preheats	1
871	outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic	1
33	embossers cerebrum gloves mohairs admiralties bewigged playgoers	1
20	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	1
685	nigglings midmonths labium peeped daydreams permuting immediately canzona	1
934	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	1
404	environs hulled preexamination oralogy tibetans	1
652	gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	1
152	scrapped prat islanded burlily thanklessly swiveled	1
137	riffled kerneling napoleons rifer splinting surmisers satisfying undamped	1
460	peeped daydreams permuting immediately canzona interrelated cooked	1
27	prat islanded burlily thanklessly swiveled polers	1
495	napoleons rifer splinting surmisers	1
1025	apnea maxillary dumpers bering evasiveness toto teashop reaccepts	1
170	funnyman commuted lachrymation floweret arcadian	1
3	plateauing reoccupations embossers cerebrum gloves	1
621	objurgate treaties preprocessor despising loftily yabber reprovingly	1
21	villainousness miscalling firefanged skeins equalled sandwiching	1
10	heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	1
129	admiralties bewigged playgoers cheques batting waspishly stilbestrol	1
79	hulled preexamination oralogy tibetans slavishly hipless	1
228	islanded burlily thanklessly swiveled	1
549	recollected householder overeducated objurgate treaties preprocessor	1
163	sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers	1
473	anesthetization undermentioned outflanking funnyman	1
248	junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	1
188	debiting parrots paraguayans resonates	1
116	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria	1
633	sandwiching bewitchment cheaters riffled kerneling	1
823	arcadian acridities unrealistic substituting surges preheats	1
699	lenity tautological jambing sodality	1
1393	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	1
243	teratoid coadjutors thuggeries nondestructive	1
144	exorcises pirog desexes summable heliocentricity excretions recelebrating dually	1
349	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	1
526	hipless prs bluejays cuppier nonsurgical skimpiest outpoured	1
920	excretions recelebrating dually plateauing	1
292	sandwiching bewitchment cheaters riffled kerneling napoleons rifer	1
1242	goodwife technicolor plenishes nippy bounden occulters blubberer amenities desecrated	1
52	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	1
459	funnyman commuted lachrymation floweret arcadian acridities unrealistic substituting surges	1
933	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	1
355	inflecting trephines hops exec junketeers isolators reducing nethermost	1
14	swiveled polers oinked apnea maxillary	1
338	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	1
9	oralogy tibetans slavishly hipless prs bluejays	1
271	surges preheats loggias reconciliating photocatalyst	1
298	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	1
187	terminals giros podgy vagus	1
544	toto teashop reaccepts gunneries exorcises pirog	1
434	equalled sandwiching bewitchment cheaters	1
224	nonfiction retrogressions eliminates unknowns	1
517	undamped sharpers forbearer anesthetization	1
533	recalculation safest signiory latchets inflecting trephines hops	1
667	bewitchment cheaters riffled kerneling napoleons rifer	1
401	cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	1
592	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	1
267	venturers valiantly unremorsefully extradites stollens ponderers	1
43	machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	1
159	dwarflike effulgences coreless tuberculoses environs hulled	1
1074	preprocessor despising loftily yabber reprovingly blungers	1
84	teashop reaccepts gunneries exorcises pirog desexes	1
230	summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	1
619	desexes summable heliocentricity excretions recelebrating	1
326	grunts venturers valiantly unremorsefully extradites	1
393	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	1
445	\N	3
453	\N	3
1230	funnyman commuted lachrymation floweret arcadian acridities unrealistic	1
1114	gloves mohairs admiralties bewigged playgoers	1
1090	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	1
937	decentralizing hogfishes gantleted richer succories dwelling	1
773	bering evasiveness toto teashop reaccepts	1
721	admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	1
70	reaccepts gunneries exorcises pirog desexes summable	1
536	rifer splinting surmisers satisfying undamped sharpers forbearer anesthetization	1
693	burlily thanklessly swiveled polers oinked apnea maxillary	1
609	loathly cancels debiting parrots paraguayans resonates overbites terminals giros	1
570	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	1
1119	intermuscular fobbed transcribed swifters redigesting	1
490	tautological jambing sodality outcrop slipcases	1
806	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	1
370	desecrated tetrachlorides loutish polygony malines	1
547	slipcases phenylketonuria grunts venturers valiantly	1
408	playgoers cheques batting waspishly stilbestrol villainousness	1
58	midmonths labium peeped daydreams permuting immediately canzona interrelated cooked	1
955	reducing nethermost nonfiction retrogressions eliminates	1
794	heliocentricity excretions recelebrating dually	1
319	grunts venturers valiantly unremorsefully	1
62	heliocentricity excretions recelebrating dually plateauing reoccupations embossers	1
684	rhythmical wastebaskets powderer immigrates inserter	1
425	extradites stollens ponderers conditione loathly	1
318	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	1
269	reaccepts gunneries exorcises pirog desexes summable heliocentricity	1
344	\N	3
346	\N	3
253	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	1
1387	photocatalyst lenity tautological jambing sodality outcrop slipcases	1
644	cerebrum gloves mohairs admiralties bewigged playgoers	1
443	coreless tuberculoses environs hulled preexamination	1
631	householder overeducated objurgate treaties preprocessor despising loftily	1
774	desexes summable heliocentricity excretions recelebrating dually plateauing	1
215	firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	1
717	admiralties bewigged playgoers cheques	1
1020	admiralties bewigged playgoers cheques batting	1
482	giros podgy vagus kinkiest xix	1
449	riffled kerneling napoleons rifer splinting surmisers	1
980	bering evasiveness toto teashop reaccepts gunneries exorcises	1
709	inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction	1
1129	richer succories dwelling scrapped prat islanded burlily thanklessly swiveled	1
708	batting waspishly stilbestrol villainousness miscalling firefanged skeins	1
457	unremorsefully extradites stollens ponderers conditione loathly	1
515	stilbestrol villainousness miscalling firefanged skeins equalled	1
776	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	1
1095	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	1
286	paraguayans resonates overbites terminals giros podgy vagus kinkiest xix	1
1614	pasturage thurifer teazle fringier	1
181	undermentioned outflanking funnyman commuted	1
1146	redigesting ostinato recalculation safest signiory latchets inflecting	1
1167	bering evasiveness toto teashop reaccepts	1
281	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	1
307	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers	1
516	outflanking funnyman commuted lachrymation	1
1061	resonates overbites terminals giros	1
857	cheaters riffled kerneling napoleons rifer splinting surmisers	1
657	playgoers cheques batting waspishly	1
1575	nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular	1
898	lachrymation floweret arcadian acridities unrealistic substituting surges preheats	1
91	surges preheats loggias reconciliating photocatalyst lenity tautological	1
795	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment	1
236	splinting surmisers satisfying undamped sharpers forbearer	1
201	cheques batting waspishly stilbestrol villainousness miscalling firefanged skeins	1
300	rifer splinting surmisers satisfying undamped sharpers	1
673	pirog desexes summable heliocentricity excretions recelebrating	1
122	playgoers cheques batting waspishly stilbestrol villainousness miscalling	1
689	reoccupations embossers cerebrum gloves mohairs admiralties	1
832	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	1
402	evasiveness toto teashop reaccepts gunneries exorcises	1
217	sandwiching bewitchment cheaters riffled kerneling	1
583	batting waspishly stilbestrol villainousness miscalling	1
1543	embossers cerebrum gloves mohairs admiralties bewigged playgoers	1
177	maladjustments subpartnership cordilleras recirculations alkalin	1
83	succories dwelling scrapped prat	1
584	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers	1
356	malines cliffhanger entailments reindexed bedstraws thoughtless	1
378	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	1
347	householder overeducated objurgate treaties	1
834	desexes summable heliocentricity excretions recelebrating	1
111	summable heliocentricity excretions recelebrating dually plateauing	1
961	reoccupations embossers cerebrum gloves mohairs admiralties	1
48	brill neologic intermuscular fobbed transcribed	1
448	plateauing reoccupations embossers cerebrum gloves mohairs	1
639	kerneling napoleons rifer splinting surmisers satisfying undamped	1
1171	safest signiory latchets inflecting trephines hops exec junketeers	1
765	dwelling scrapped prat islanded burlily	1
1283	miscalling firefanged skeins equalled sandwiching bewitchment	1
499	outcrop slipcases phenylketonuria grunts	1
67	bering evasiveness toto teashop reaccepts	1
1201	unknowns mongoloids danker raunchiness perspicuously disjoined	1
74	stilbestrol villainousness miscalling firefanged skeins	1
399	arcadian acridities unrealistic substituting surges preheats loggias	1
81	kerneling napoleons rifer splinting surmisers	1
97	loggias reconciliating photocatalyst lenity	1
162	recelebrating dually plateauing reoccupations embossers	1
436	substituting surges preheats loggias	1
121	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier	1
1199	surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	1
540	thanklessly swiveled polers oinked	1
133	plateauing reoccupations embossers cerebrum gloves	1
986	richer succories dwelling scrapped	1
573	valiantly unremorsefully extradites stollens	1
1111	recelebrating dually plateauing reoccupations embossers	1
196	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs	1
352	desexes summable heliocentricity excretions recelebrating dually plateauing	1
420	plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged	1
637	prat islanded burlily thanklessly swiveled polers oinked	1
350	\N	3
340	bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	1
506	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	1
614	tibetans slavishly hipless prs bluejays cuppier nonsurgical	1
383	earings circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	1
76	retrogressions eliminates unknowns mongoloids danker raunchiness	1
1331	surges preheats loggias reconciliating photocatalyst	1
197	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers	1
335	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	1
150	gantleted richer succories dwelling scrapped prat islanded burlily	1
302	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	1
25	overbites terminals giros podgy vagus kinkiest	1
421	maxillary dumpers bering evasiveness toto teashop reaccepts gunneries exorcises	1
205	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	1
212	paraguayans resonates overbites terminals giros podgy vagus	1
329	kinkiest xix recollected householder overeducated objurgate	1
234	sharpers forbearer anesthetization undermentioned	1
458	\N	3
462	\N	3
463	\N	3
470	\N	3
471	\N	3
472	\N	3
475	\N	3
480	\N	3
483	\N	3
486	\N	3
489	\N	3
491	\N	3
501	\N	3
524	\N	3
525	\N	3
532	\N	3
541	\N	3
550	\N	3
551	\N	3
552	\N	3
553	\N	3
556	\N	3
288	\N	3
566	\N	3
580	\N	3
591	\N	3
593	\N	3
595	\N	3
599	\N	3
605	\N	3
611	\N	3
618	\N	3
620	\N	3
625	\N	3
627	\N	3
628	\N	3
405	\N	3
636	\N	3
638	\N	3
641	\N	3
648	\N	3
649	\N	3
654	\N	3
662	\N	3
663	\N	3
664	\N	3
666	\N	3
412	\N	3
672	\N	3
679	\N	3
690	\N	3
692	\N	3
694	\N	3
698	\N	3
701	\N	3
707	\N	3
710	\N	3
715	\N	3
720	\N	3
723	\N	3
724	\N	3
735	\N	3
736	\N	3
742	\N	3
744	\N	3
746	\N	3
759	\N	3
760	\N	3
767	\N	3
771	\N	3
784	\N	3
785	\N	3
786	\N	3
788	\N	3
790	\N	3
791	\N	3
792	\N	3
615	\N	3
800	\N	3
809	\N	3
811	\N	3
814	\N	3
818	\N	3
820	\N	3
830	\N	3
831	\N	3
833	\N	3
585	\N	3
835	\N	3
851	\N	3
854	\N	3
858	\N	3
860	\N	3
28	\N	3
867	\N	3
876	\N	3
878	\N	3
879	\N	3
880	\N	3
884	\N	3
886	\N	3
888	\N	3
891	\N	3
895	\N	3
897	\N	3
900	\N	3
905	\N	3
918	\N	3
919	\N	3
139	\N	3
931	\N	3
932	\N	3
145	\N	3
944	\N	3
949	\N	3
950	\N	3
13	\N	3
15	\N	3
17	\N	3
19	\N	3
22	\N	3
23	\N	3
24	\N	3
36	\N	3
38	\N	3
42	\N	3
54	\N	3
57	\N	3
59	\N	3
61	\N	3
75	\N	3
80	\N	3
86	\N	3
96	\N	3
98	\N	3
100	\N	3
108	\N	3
112	\N	3
115	\N	3
126	\N	3
128	\N	3
130	\N	3
132	\N	3
138	\N	3
147	\N	3
161	\N	3
166	\N	3
168	\N	3
180	\N	3
182	\N	3
189	\N	3
193	\N	3
195	\N	3
203	\N	3
208	\N	3
211	\N	3
216	\N	3
220	\N	3
227	\N	3
237	\N	3
239	\N	3
245	\N	3
247	\N	3
254	\N	3
258	\N	3
260	\N	3
264	\N	3
274	\N	3
276	\N	3
280	\N	3
285	\N	3
291	\N	3
310	\N	3
312	\N	3
315	\N	3
317	\N	3
325	\N	3
363	\N	3
367	\N	3
369	\N	3
371	\N	3
372	\N	3
377	\N	3
382	\N	3
384	\N	3
396	\N	3
403	\N	3
411	\N	3
424	\N	3
810	\N	3
1368	\N	3
1374	\N	3
1376	\N	3
1381	\N	3
93	\N	3
1124	\N	3
1386	\N	3
762	\N	3
766	\N	3
1405	\N	3
1409	\N	3
1413	\N	3
50	\N	3
740	\N	3
34	\N	3
1424	\N	3
1255	\N	3
1431	\N	3
1433	\N	3
1434	\N	3
1435	\N	3
1436	\N	3
728	\N	3
1440	\N	3
1446	\N	3
11	\N	3
207	\N	3
859	\N	3
1260	\N	3
1455	\N	3
1461	\N	3
702	\N	3
868	\N	3
1470	\N	3
836	\N	3
164	\N	3
1267	\N	3
1475	\N	3
1479	\N	3
124	\N	3
1481	\N	3
1483	\N	3
1485	\N	3
824	\N	3
1490	\N	3
172	\N	3
1494	\N	3
1495	\N	3
1497	\N	3
1498	\N	3
936	\N	3
1506	\N	3
1508	\N	3
1511	\N	3
153	\N	3
1514	\N	3
797	\N	3
273	\N	3
904	\N	3
1519	\N	3
71	\N	3
283	\N	3
1318	\N	3
1534	\N	3
1538	\N	3
251	\N	3
1541	\N	3
910	\N	3
1295	\N	3
1547	\N	3
755	\N	3
972	\N	3
1549	\N	3
938	\N	3
1006	\N	3
1553	\N	3
225	\N	3
1555	\N	3
872	\N	3
1557	\N	3
1560	\N	3
1344	\N	3
1561	\N	3
395	\N	3
977	\N	3
1573	\N	3
198	\N	3
1582	\N	3
376	\N	3
959	\N	3
1586	\N	3
423	\N	3
1589	\N	3
1591	\N	3
982	\N	3
1352	\N	3
1594	\N	3
1600	\N	3
1601	\N	3
1602	\N	3
1603	\N	3
1116	\N	3
357	\N	3
947	\N	3
1323	\N	3
1407	\N	3
529	\N	3
1040	\N	3
1617	\N	3
1623	\N	3
320	\N	3
1097	\N	3
1627	\N	3
926	\N	3
469	\N	3
1629	\N	3
1377	\N	3
558	\N	3
1633	\N	3
1634	\N	3
1456	\N	3
1420	\N	3
1641	\N	3
1447	\N	3
1644	\N	3
1645	\N	3
1646	\N	3
432	\N	3
1063	\N	3
478	\N	3
1008	\N	3
1382	\N	3
1098	\N	3
1657	\N	3
1658	\N	3
1121	\N	3
1662	\N	3
409	\N	3
1664	\N	3
1671	\N	3
1674	\N	3
601	\N	3
1026	\N	3
671	\N	3
1683	\N	3
387	\N	3
1684	\N	3
1402	\N	3
565	\N	3
1688	\N	3
1693	\N	3
113	\N	3
956	\N	3
957	\N	3
965	\N	3
967	\N	3
970	\N	3
973	\N	3
974	\N	3
978	\N	3
92	\N	3
761	\N	3
987	\N	3
261	\N	3
993	\N	3
1000	inflecting trephines hops exec junketeers isolators reducing nethermost nonfiction	2
1007	admiralties bewigged playgoers cheques	2
1016	zanier corkscrewed promiscuousness clewed	2
1021	forbearer anesthetization undermentioned outflanking funnyman	2
1024	dually plateauing reoccupations embossers	2
1034	stilbestrol villainousness miscalling firefanged skeins	2
1037	reaccepts gunneries exorcises pirog desexes summable heliocentricity	2
1050	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons	2
1058	surges preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	2
1065	dissociated heartier petitionee brill	2
1066	swiveled polers oinked apnea maxillary	2
1067	paraguayans resonates overbites terminals giros	2
1071	bering evasiveness toto teashop reaccepts	2
1082	arcadian acridities unrealistic substituting surges preheats	2
1088	environs hulled preexamination oralogy tibetans slavishly hipless	2
1092	desexes summable heliocentricity excretions recelebrating	2
1099	bewigged playgoers cheques batting waspishly stilbestrol	2
1112	cheaters riffled kerneling napoleons rifer splinting surmisers	2
1127	outflanking funnyman commuted lachrymation floweret arcadian acridities unrealistic	2
1132	undermentioned outflanking funnyman commuted	2
1140	extradites stollens ponderers conditione loathly	2
1141	valiantly unremorsefully extradites stollens ponderers conditione	2
1148	gloves mohairs admiralties bewigged playgoers cheques batting	2
1149	excretions recelebrating dually plateauing	2
1154	sandwiching bewitchment cheaters riffled kerneling napoleons rifer	2
1155	lachrymation floweret arcadian acridities unrealistic	2
1156	giros podgy vagus kinkiest xix recollected householder overeducated	2
1164	junketeers isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	2
1174	firefanged skeins equalled sandwiching bewitchment cheaters riffled kerneling	2
1184	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	2
1191	substituting surges preheats loggias	2
1202	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity	2
1204	vagus kinkiest xix recollected householder overeducated objurgate treaties	2
1207	apnea maxillary dumpers bering evasiveness toto teashop reaccepts	2
1211	riffled kerneling napoleons rifer splinting surmisers	2
1215	ponderers conditione loathly cancels debiting parrots paraguayans	2
1216	outpoured dissociated heartier petitionee	2
1226	desecrated tetrachlorides loutish polygony malines	2
1237	alkalin succulently marquise underlaid neurosurgeon innervated	2
1248	lachrymation floweret arcadian acridities unrealistic	2
1253	jambing sodality outcrop slipcases phenylketonuria grunts	2
1259	burlily thanklessly swiveled polers oinked apnea maxillary dumpers bering	2
1261	admiralties bewigged playgoers cheques batting	2
1269	gunneries exorcises pirog desexes	2
1272	reconciliating photocatalyst lenity tautological jambing sodality outcrop slipcases	2
1275	gloves mohairs admiralties bewigged playgoers	2
1278	reprovingly blungers dwarflike effulgences coreless tuberculoses environs hulled preexamination	2
1280	disjoined nigglings midmonths labium peeped daydreams	2
1281	isolators reducing nethermost nonfiction	2
1285	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation	2
1288	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	2
1293	resonates overbites terminals giros	2
1299	gantleted richer succories dwelling scrapped prat islanded burlily	2
1306	loggias reconciliating photocatalyst lenity tautological jambing sodality	2
1309	heliocentricity excretions recelebrating dually plateauing reoccupations	2
1314	bering evasiveness toto teashop reaccepts	2
1316	kerneling napoleons rifer splinting surmisers satisfying undamped	2
1321	dually plateauing reoccupations embossers cerebrum gloves	2
1325	tautological jambing sodality outcrop slipcases phenylketonuria grunts venturers	2
1328	terminals giros podgy vagus	2
1333	oinked apnea maxillary dumpers bering evasiveness toto teashop reaccepts	2
1335	intermuscular fobbed transcribed swifters redigesting	2
1337	villainousness miscalling firefanged skeins	2
1339	playgoers cheques batting waspishly	2
1342	technicolor plenishes nippy bounden occulters blubberer	2
1343	slipcases phenylketonuria grunts venturers valiantly	2
1349	hulled preexamination oralogy tibetans slavishly hipless	2
1358	mongoloids danker raunchiness perspicuously disjoined nigglings midmonths	2
2057	dumpers bering evasiveness toto	2
1367	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment	2
1370	reaccepts gunneries exorcises pirog desexes summable heliocentricity	2
1375	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	2
1379	cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	2
1380	richer succories dwelling scrapped	2
1394	recelebrating dually plateauing reoccupations embossers	2
1398	raunchiness perspicuously disjoined nigglings midmonths labium peeped	2
1400	rifer splinting surmisers satisfying undamped sharpers	2
1406	householder overeducated objurgate treaties preprocessor despising loftily	2
1414	safest signiory latchets inflecting trephines hops exec junketeers	2
1423	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	2
1432	machinability orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	2
1437	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	2
1445	waspishly stilbestrol villainousness miscalling	2
1453	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	2
1460	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity	2
1464	islanded burlily thanklessly swiveled	2
1465	debiting parrots paraguayans resonates	2
1471	oinked apnea maxillary dumpers	2
1474	funnyman commuted lachrymation floweret arcadian	2
1478	dwarflike effulgences coreless tuberculoses environs hulled	2
1489	admiralties bewigged playgoers cheques batting	2
1496	bewitchment cheaters riffled kerneling napoleons rifer	2
1505	undermentioned outflanking funnyman commuted lachrymation floweret arcadian	2
1507	forbearer anesthetization undermentioned outflanking funnyman commuted lachrymation floweret arcadian	2
1516	valiantly unremorsefully extradites stollens	2
1518	grunts venturers valiantly unremorsefully extradites	2
1523	reoccupations embossers cerebrum gloves mohairs admiralties	2
1524	preprocessor despising loftily yabber reprovingly blungers	2
1530	miscalling firefanged skeins equalled sandwiching bewitchment	2
1531	outflanking funnyman commuted lachrymation	2
1535	paraguayans resonates overbites terminals giros podgy vagus	2
1540	inflecting trephines hops exec junketeers isolators reducing nethermost	2
1546	surrejoinders chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	2
1548	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	2
1551	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	2
1556	unrealistic substituting surges preheats loggias reconciliating photocatalyst lenity tautological	2
1562	phenylketonuria grunts venturers valiantly	2
1563	bering evasiveness toto teashop reaccepts gunneries exorcises	2
1565	giros podgy vagus kinkiest xix recollected householder	2
1569	oinked apnea maxillary dumpers bering evasiveness toto	2
1571	sandwiching bewitchment cheaters riffled kerneling	2
1572	summable heliocentricity excretions recelebrating dually plateauing reoccupations embossers	2
1576	unremorsefully extradites stollens ponderers conditione loathly	2
1584	bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	2
1585	hipless prs bluejays cuppier nonsurgical skimpiest outpoured	2
1587	bounden occulters blubberer amenities	2
1593	unrealistic substituting surges preheats loggias reconciliating photocatalyst	2
1597	maladjustments subpartnership cordilleras recirculations alkalin	2
1605	scrapped prat islanded burlily thanklessly swiveled	2
1606	commuted lachrymation floweret arcadian	2
1607	tautological jambing sodality outcrop slipcases	2
1608	islanded burlily thanklessly swiveled polers oinked apnea maxillary	2
1611	gloves mohairs admiralties bewigged	2
1616	reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions recelebrating	2
1622	surges preheats loggias reconciliating photocatalyst lenity tautological	2
1626	cerebrum gloves mohairs admiralties	2
1628	despising loftily yabber reprovingly blungers dwarflike effulgences coreless	2
1630	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	2
1631	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned	2
1635	inserter plights corollaries gaudiness irades inadvisability	2
1640	debiting parrots paraguayans resonates overbites terminals giros podgy vagus	2
1647	hogfishes gantleted richer succories dwelling scrapped prat	2
1656	desexes summable heliocentricity excretions recelebrating	2
1663	cheaters riffled kerneling napoleons rifer splinting	2
1666	recelebrating dually plateauing reoccupations embossers	2
1669	photocatalyst lenity tautological jambing sodality outcrop slipcases	2
1675	swiveled polers oinked apnea maxillary dumpers bering evasiveness	2
1677	petitionee brill neologic intermuscular	2
1680	admiralties bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	2
1681	cooked reformers goodwife technicolor plenishes	2
1682	jambing sodality outcrop slipcases	2
1686	coreless tuberculoses environs hulled preexamination	2
1692	retrogressions eliminates unknowns mongoloids danker raunchiness	2
1700	batting waspishly stilbestrol villainousness miscalling firefanged skeins	2
1704	teashop reaccepts gunneries exorcises pirog desexes	2
1707	lachrymation floweret arcadian acridities unrealistic substituting surges preheats	2
1709	embossers cerebrum gloves mohairs admiralties bewigged playgoers	2
996	\N	3
997	\N	3
1710	admiralties bewigged playgoers cheques batting waspishly stilbestrol	2
1716	heliocentricity excretions recelebrating dually	2
1720	unknowns mongoloids danker raunchiness perspicuously disjoined	2
1722	kerneling napoleons rifer splinting surmisers	2
1725	kinkiest xix recollected householder overeducated objurgate	2
1728	tautological jambing sodality outcrop slipcases phenylketonuria	2
1731	redigesting ostinato recalculation safest signiory latchets inflecting	2
1734	recelebrating dually plateauing reoccupations embossers cerebrum gloves mohairs	2
1737	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	2
1741	emanative blowpipe varies thickest machinability orbiters tormentor owner	2
1748	excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	2
1753	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	2
1757	napoleons rifer splinting surmisers	2
1760	stilbestrol villainousness miscalling firefanged skeins equalled	2
1765	arcadian acridities unrealistic substituting surges preheats loggias	2
1768	debiting parrots paraguayans resonates overbites terminals giros podgy	2
1770	loathly cancels debiting parrots paraguayans resonates overbites terminals giros	2
1774	midmonths labium peeped daydreams permuting immediately canzona interrelated cooked	2
6	bedstraws thoughtless elation swampland earings circumscribed paralyzingly	2
26	splinting surmisers satisfying undamped sharpers forbearer	2
32	arcadian acridities unrealistic substituting surges preheats loggias	2
44	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	2
53	swiveled polers oinked apnea maxillary	2
69	stilbestrol villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters	2
77	pirog desexes summable heliocentricity excretions recelebrating	2
88	outcrop slipcases phenylketonuria grunts	2
102	environs hulled preexamination oralogy tibetans	2
114	canzona interrelated cooked reformers goodwife technicolor plenishes nippy	2
119	funnyman commuted lachrymation floweret arcadian	2
125	attractive yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	2
143	succories dwelling scrapped prat	2
160	photocatalyst lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	2
174	plateauing reoccupations embossers cerebrum gloves mohairs admiralties bewigged	2
184	toto teashop reaccepts gunneries exorcises pirog desexes	2
192	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	2
202	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers	2
204	recollected householder overeducated objurgate treaties preprocessor	2
210	bering evasiveness toto teashop reaccepts	2
222	recalculation safest signiory latchets inflecting trephines hops	2
223	bewitchment cheaters riffled kerneling napoleons rifer	2
232	pasturage thurifer teazle fringier	2
241	extradites stollens ponderers conditione loathly cancels debiting	2
256	measles decentralizing hogfishes gantleted richer	2
257	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated heartier	2
279	grunts venturers valiantly unremorsefully extradites	2
290	skeins equalled sandwiching bewitchment	2
303	exorcises pirog desexes summable heliocentricity excretions recelebrating dually plateauing	2
304	heliocentricity excretions recelebrating dually plateauing reoccupations embossers cerebrum gloves	2
309	surges preheats loggias reconciliating photocatalyst	2
327	prat islanded burlily thanklessly swiveled polers	2
333	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	2
345	embossers cerebrum gloves mohairs admiralties bewigged playgoers	2
353	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	2
361	preheats loggias reconciliating photocatalyst lenity tautological jambing sodality	2
362	undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	2
368	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	2
381	exec junketeers isolators reducing	2
392	batting waspishly stilbestrol villainousness miscalling	2
407	evasiveness toto teashop reaccepts	2
414	undermentioned outflanking funnyman commuted lachrymation floweret	2
416	plateauing reoccupations embossers cerebrum gloves	2
439	villainousness miscalling firefanged skeins equalled sandwiching	2
441	exorcises pirog desexes summable heliocentricity excretions recelebrating dually	2
465	sandwiching bewitchment cheaters riffled kerneling napoleons rifer splinting surmisers	2
481	loggias reconciliating photocatalyst lenity	2
488	brill neologic intermuscular fobbed transcribed	2
493	overbites terminals giros podgy vagus kinkiest	2
500	reaccepts gunneries exorcises pirog desexes summable	2
520	surges preheats loggias reconciliating photocatalyst lenity tautological	2
539	summable heliocentricity excretions recelebrating dually plateauing	2
555	playgoers cheques batting waspishly stilbestrol villainousness miscalling	2
575	riffled kerneling napoleons rifer splinting surmisers satisfying undamped	2
598	funnyman commuted lachrymation floweret arcadian	2
610	ponderers conditione loathly cancels debiting parrots	2
613	extradites stollens ponderers conditione loathly cancels debiting	2
624	bewigged playgoers cheques batting waspishly stilbestrol villainousness miscalling	2
626	plateauing reoccupations embossers cerebrum gloves	2
634	kerneling napoleons rifer splinting surmisers satisfying undamped sharpers	2
640	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	2
655	nonfiction retrogressions eliminates unknowns	2
668	skeins equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	2
799	thanklessly swiveled polers oinked	2
2022	loathly cancels debiting parrots paraguayans resonates overbites	2
2023	ponderers conditione loathly cancels debiting parrots paraguayans resonates	2
2026	perspicuously disjoined nigglings midmonths labium peeped daydreams permuting	2
2028	batting waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	2
2030	cerebrum gloves mohairs admiralties bewigged playgoers	2
2033	surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	2
2035	objurgate treaties preprocessor despising	2
2040	mongoloids danker raunchiness perspicuously disjoined	2
2041	gloves mohairs admiralties bewigged playgoers cheques batting waspishly stilbestrol	2
2042	equalled sandwiching bewitchment cheaters	2
2046	forbearer anesthetization undermentioned outflanking funnyman	2
2050	preheats loggias reconciliating photocatalyst lenity tautological	2
2051	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	2
2052	sodality outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites	2
2054	summable heliocentricity excretions recelebrating	2
2055	householder overeducated objurgate treaties	2
2059	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman	2
2065	extradites stollens ponderers conditione loathly	2
2067	paraguayans resonates overbites terminals giros podgy vagus kinkiest xix	2
2074	transcribed swifters redigesting ostinato recalculation safest	2
1001	\N	3
1002	\N	3
49	\N	3
1004	\N	3
739	\N	3
1010	\N	3
1014	\N	3
1015	\N	3
1018	\N	3
1019	\N	3
1022	\N	3
1029	\N	3
1030	\N	3
1031	\N	3
1033	\N	3
1035	\N	3
206	\N	3
1042	\N	3
1043	\N	3
316	\N	3
1054	\N	3
674	\N	3
1056	\N	3
1059	\N	3
1068	\N	3
1070	\N	3
332	\N	3
1085	\N	3
1086	\N	3
1089	\N	3
123	\N	3
1094	\N	3
1096	\N	3
1101	\N	3
1104	\N	3
289	\N	3
1108	\N	3
1109	\N	3
1110	\N	3
1115	\N	3
1117	\N	3
935	\N	3
1128	\N	3
1130	\N	3
1137	\N	3
272	\N	3
903	\N	3
446	\N	3
406	\N	3
1157	\N	3
1159	\N	3
1160	\N	3
1161	\N	3
542	\N	3
250	\N	3
1163	\N	3
1169	\N	3
1172	\N	3
413	\N	3
971	\N	3
1179	\N	3
1180	\N	3
1055	\N	3
1005	\N	3
1185	\N	3
1186	\N	3
1188	\N	3
1190	\N	3
1192	\N	3
1195	\N	3
1197	\N	3
1198	\N	3
484	\N	3
394	\N	3
976	\N	3
1205	\N	3
1208	\N	3
581	\N	3
1219	\N	3
1222	\N	3
375	\N	3
958	\N	3
1227	\N	3
422	\N	3
1046	\N	3
1235	\N	3
1238	\N	3
1241	\N	3
1244	\N	3
1246	\N	3
1251	\N	3
1254	\N	3
1257	\N	3
1258	\N	3
616	\N	3
528	\N	3
1039	\N	3
1270	\N	3
1271	\N	3
1277	\N	3
468	\N	3
1279	\N	3
586	\N	3
1100	\N	3
557	\N	3
1286	\N	3
1289	\N	3
1298	\N	3
29	\N	3
1300	\N	3
1301	\N	3
431	\N	3
1062	\N	3
1308	\N	3
1310	\N	3
1311	\N	3
711	\N	3
1312	\N	3
1120	\N	3
1315	\N	3
1317	\N	3
1320	\N	3
1322	\N	3
1168	\N	3
1330	\N	3
600	\N	3
1336	\N	3
670	\N	3
1346	\N	3
1347	\N	3
1350	\N	3
1351	\N	3
146	\N	3
1355	\N	3
564	\N	3
1356	\N	3
1359	\N	3
1142	\N	3
1150	\N	3
1364	\N	3
1365	\N	3
1694	\N	3
1143	\N	3
1133	\N	3
1084	\N	3
1450	\N	3
1696	\N	3
1701	\N	3
1702	\N	3
1187	\N	3
537	\N	3
1708	\N	3
1052	\N	3
1125	\N	3
1717	\N	3
1102	\N	3
1718	\N	3
1724	\N	3
507	\N	3
577	\N	3
1462	\N	3
35	\N	3
1206	\N	3
1735	\N	3
1539	\N	3
1501	\N	3
1193	\N	3
1738	\N	3
1740	\N	3
1743	\N	3
1744	\N	3
1747	\N	3
729	\N	3
1173	\N	3
1749	\N	3
659	\N	3
1135	\N	3
12	\N	3
1175	\N	3
1761	\N	3
1378	\N	3
1917	\N	3
1354	\N	3
1421	\N	3
1705	\N	3
1923	\N	3
1448	\N	3
1305	\N	3
917	\N	3
1925	\N	3
305	\N	3
479	\N	3
1009	\N	3
1383	\N	3
1697	\N	3
1934	\N	3
896	\N	3
1935	\N	3
410	\N	3
1027	\N	3
415	\N	3
1391	\N	3
1687	\N	3
1138	\N	3
1515	\N	3
1953	\N	3
263	\N	3
388	\N	3
1751	\N	3
1403	\N	3
989	\N	3
1361	\N	3
1668	\N	3
1726	\N	3
1451	\N	3
366	\N	3
1961	\N	3
1966	\N	3
1482	\N	3
1969	\N	3
538	\N	3
1053	\N	3
1974	\N	3
1103	\N	3
342	\N	3
1732	\N	3
1754	\N	3
474	\N	3
1984	\N	3
1986	\N	3
508	\N	3
578	\N	3
1463	\N	3
1057	\N	3
1427	\N	3
1711	\N	3
1995	\N	3
1649	\N	3
1158	\N	3
1502	\N	3
1194	\N	3
1017	\N	3
2004	\N	3
1395	\N	3
2006	\N	3
660	\N	3
1136	\N	3
1438	\N	3
2012	\N	3
1176	\N	3
461	\N	3
2019	\N	3
1796	\N	3
604	\N	3
1107	\N	3
682	\N	3
1520	\N	3
2024	\N	3
1477	\N	3
1756	\N	3
2032	\N	3
1554	\N	3
1152	\N	3
1787	\N	3
1454	\N	3
1093	\N	3
5	\N	3
1492	\N	3
1578	\N	3
770	\N	3
1240	\N	3
1075	\N	3
1766	\N	3
782	\N	3
1568	\N	3
1823	\N	3
1536	\N	3
2056	\N	3
1798	\N	3
1558	\N	3
653	\N	3
1327	\N	3
2	\N	3
687	\N	3
47	\N	3
1214	\N	3
1545	\N	3
1510	\N	3
1166	\N	3
1763	\N	3
703	\N	3
869	\N	3
1106	\N	3
681	\N	3
1773	\N	3
165	\N	3
1268	\N	3
1778	\N	3
1151	\N	3
4	\N	3
1789	\N	3
825	\N	3
1236	\N	3
173	\N	3
1577	\N	3
1239	\N	3
1801	\N	3
1803	\N	3
1804	\N	3
798	\N	3
154	\N	3
781	\N	3
1810	\N	3
1567	\N	3
1816	\N	3
72	\N	3
284	\N	3
1319	\N	3
1	\N	3
686	\N	3
46	\N	3
1213	\N	3
1544	\N	3
1825	\N	3
911	\N	3
1296	\N	3
1610	\N	3
893	\N	3
1831	\N	3
56	\N	3
939	\N	3
1834	\N	3
226	\N	3
873	\N	3
1838	\N	3
1843	\N	3
877	\N	3
1615	\N	3
1852	\N	3
199	\N	3
1861	\N	3
175	\N	3
1274	\N	3
1595	\N	3
882	\N	3
1870	\N	3
1872	\N	3
983	\N	3
1353	\N	3
828	\N	3
1876	\N	3
1877	\N	3
191	\N	3
874	\N	3
358	\N	3
948	\N	3
1324	\N	3
1891	\N	3
952	\N	3
1893	\N	3
321	\N	3
927	\N	3
293	\N	3
1329	\N	3
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



COPY main_office_person (pid, mid) FROM stdin;
\.



COPY main_offices (id, lat, long, street, postal_code, type) FROM stdin;
\.



COPY organizing_committees (id, cid, committee) FROM stdin;
\.



COPY person_best_research_paper_award (pid, bid) FROM stdin;
\.



COPY person_deadline_abstract_submiss (pid, did) FROM stdin;
\.



COPY persons (id, nation, name, name_sponsor, organizator, program_chair, listener, author_paper_student, program_committee_member, type) FROM stdin;
1729	\N	\N	\N	t	f	f	f	t	0
455	\N	\N	\N	t	f	f	f	t	0
1836	\N	\N	\N	t	f	f	f	t	0
1449	\N	\N	\N	t	f	f	f	t	0
1715	\N	\N	\N	t	f	f	f	t	0
704	\N	\N	\N	t	f	f	f	t	0
923	\N	\N	\N	t	f	f	f	t	0
1147	\N	\N	\N	t	f	f	f	t	0
734	\N	\N	\N	t	f	f	f	t	0
922	\N	\N	\N	t	f	f	f	t	0
1178	\N	\N	\N	t	f	f	f	t	0
7	\N	\N	\N	t	f	f	f	t	0
503	\N	\N	\N	t	f	f	f	t	0
726	\N	\N	\N	t	f	f	f	t	0
2036	\N	\N	\N	t	t	f	f	t	0
1080	\N	Iha Em	\N	f	f	f	f	f	2
40	\N	Mirra Tygart	\N	f	f	f	f	f	2
89	\N	Marna Crookshanks	\N	f	f	f	f	f	2
135	\N	Lili Atoe	\N	f	f	f	f	f	2
149	\N	Sharise Heagy	\N	f	f	f	f	f	2
155	\N	Shahaama Berum	\N	f	f	f	f	f	2
156	\N	Cathy Phebus	\N	f	f	f	f	f	2
178	\N	Everardo Yidiaris	\N	f	f	f	f	f	2
235	\N	Kim Colombe	\N	f	f	f	f	f	2
294	\N	Tera Vigen	\N	f	f	f	f	f	2
354	\N	Dewayne Buttermore	\N	f	f	f	f	f	2
380	\N	Vladlena Tlumacki	\N	f	f	f	f	f	2
417	\N	Ieshige Kosinski	\N	f	f	f	f	f	2
442	\N	Fovro Chung	\N	f	f	f	f	f	2
444	\N	Tydeus Dyckman	\N	f	f	f	f	f	2
498	\N	Sam Mattheis	\N	f	f	f	f	f	2
530	\N	Torokanova Kosloski	\N	f	f	f	f	f	2
535	\N	Immanuel Bugos	\N	f	f	f	f	f	2
546	\N	Vasyklo Netz	\N	f	f	f	f	f	2
560	\N	Evgnios Feasel	\N	f	f	f	f	f	2
590	\N	Gerakna Ryneer	\N	f	f	f	f	f	2
602	\N	Che Kess	\N	f	f	f	f	f	2
606	\N	Momus Rivadeneira	\N	f	f	f	f	f	2
622	\N	Miles Manero	\N	f	f	f	f	f	2
632	\N	Einian Frascella	\N	f	f	f	f	f	2
661	\N	Eshita Whitby	\N	f	f	f	f	f	2
683	\N	Dele Galla	\N	f	f	f	f	f	2
688	\N	Erminia Damrell	\N	f	f	f	f	f	2
719	\N	Helene Nik	\N	f	f	f	f	f	2
778	\N	Rebeca Aday	\N	f	f	f	f	f	2
796	\N	Brenda Varley	\N	f	f	f	f	f	2
802	\N	Feli Trainham	\N	f	f	f	f	f	2
805	\N	Octave Diana	\N	f	f	f	f	f	2
821	\N	Liebetraud Kiddy	\N	f	f	f	f	f	2
845	\N	Stacie Ciesielski	\N	f	f	f	f	f	2
856	\N	Graziana Callabrass	\N	f	f	f	f	f	2
863	\N	Aseel Waddups	\N	f	f	f	f	f	2
928	\N	Avniel Debiase	\N	f	f	f	f	f	2
945	\N	Brys Robak	\N	f	f	f	f	f	2
1044	\N	Barsha Murrain	\N	f	f	f	f	f	2
1049	\N	Caryn Grudzinski	\N	f	f	f	f	f	2
1069	\N	Dayu Vient	\N	f	f	f	f	f	2
1122	\N	Jake Bober	\N	f	f	f	f	f	2
1145	\N	Yves Hunsucker	\N	f	f	f	f	f	2
1162	\N	Maysak Anetsberger	\N	f	f	f	f	f	2
1170	\N	Rosalinde Leinbach	\N	f	f	f	f	f	2
1177	\N	Liska Lambourne	\N	f	f	f	f	f	2
1189	\N	Odysseus Dilthey	\N	f	f	f	f	f	2
1218	\N	Gabriele Darsey	\N	f	f	f	f	f	2
1231	\N	Blanca Ursery	\N	f	f	f	f	f	2
1233	\N	Maeko Kontogiannis	\N	f	f	f	f	f	2
1250	\N	Rosamar Wish	\N	f	f	f	f	f	2
1252	\N	Mora Christofferse	\N	f	f	f	f	f	2
1263	\N	Reiko Castile	\N	f	f	f	f	f	2
1264	\N	Guiseppa Thurstonson	\N	f	f	f	f	f	2
1287	\N	Liselotte Groleau	\N	f	f	f	f	f	2
1294	\N	Madaleno Bercier	\N	f	f	f	f	f	2
1334	\N	Misty Holladay	\N	f	f	f	f	f	2
1345	\N	Tatsukichi Gerstenberger	\N	f	f	f	f	f	2
1357	\N	Latoya Lovato	\N	f	f	f	f	f	2
1362	\N	Marisa Roufs	\N	f	f	f	f	f	2
1366	\N	Maela Chamley	\N	f	f	f	f	f	2
1373	\N	Frangiskos Truly	\N	f	f	f	f	f	2
1384	\N	Muni Mccuiston	\N	f	f	f	f	f	2
1388	\N	Taliyah Jafari	\N	f	f	f	f	f	2
1390	\N	Christelle Garced	\N	f	f	f	f	f	2
1404	\N	Kellie Frenner	\N	f	f	f	f	f	2
1415	\N	Calida Starace	\N	f	f	f	f	f	2
1422	\N	Adamanta Schlitt	\N	f	f	f	f	f	2
1426	\N	Gavriella Sasson	\N	f	f	f	f	f	2
1429	\N	Gerharde Heidtbrink	\N	f	f	f	f	f	2
1442	\N	Yoriko Boot	\N	f	f	f	f	f	2
1444	\N	Imelde Ballin	\N	f	f	f	f	f	2
1468	\N	Favio Mutherspaw	\N	f	f	f	f	f	2
1472	\N	Nessa Thomison	\N	f	f	f	f	f	2
1503	\N	Janah Moryl	\N	f	f	f	f	f	2
1504	\N	Takako Nordine	\N	f	f	f	f	f	2
1528	\N	Faqueza Correll	\N	f	f	f	f	f	2
1559	\N	Clariee Martucci	\N	f	f	f	f	f	2
1570	\N	Kyledyr Constantino	\N	f	f	f	f	f	2
1276	\N	Pilib Seu	\N	f	f	f	t	f	2
1581	\N	Herberta Fullenwider	\N	f	f	f	f	f	2
1588	\N	Hidemichi Tropp	\N	f	f	f	f	f	2
1592	\N	Socorro Mcsorley	\N	f	f	f	f	f	2
1599	\N	Yae Timblin	\N	f	f	f	f	f	2
1613	\N	Plakida Gothe	\N	f	f	f	f	f	2
1618	\N	Giselher Nibler	\N	f	f	f	f	f	2
1625	\N	Lucile Homola	\N	f	f	f	f	f	2
1670	\N	Krosa Kuney	\N	f	f	f	f	f	2
1672	\N	Iulia Morra	\N	f	f	f	f	f	2
1685	\N	Taaliba Debrita	\N	f	f	f	f	f	2
1691	\N	Kobe Guttirez	\N	f	f	f	f	f	2
1699	\N	Luitfriede Westmark	\N	f	f	f	f	f	2
1712	\N	Cherry Dolence	\N	f	f	f	f	f	2
1764	\N	Miloushka Pezez	\N	f	f	f	f	f	2
1777	\N	Janny Mccaine	\N	f	f	f	f	f	2
1781	\N	Datja Carner	\N	f	f	f	f	f	2
1782	\N	Sander Garriss	\N	f	f	f	f	f	2
1783	\N	Zeanes Hinsley	\N	f	f	f	f	f	2
1785	\N	Krystal Farria	\N	f	f	f	f	f	2
1790	\N	Loris Elder	\N	f	f	f	f	f	2
1794	\N	Juriaan Schremp	\N	f	f	f	f	f	2
1802	\N	Graud Shuker	\N	f	f	f	f	f	2
1845	\N	Hagibis Kihn	\N	f	f	f	f	f	2
1849	\N	Silvester Yelvington	\N	f	f	f	f	f	2
1858	\N	Ayla Moncrief	\N	f	f	f	f	f	2
1859	\N	Aristomnis Dauber	\N	f	f	f	f	f	2
1882	\N	Vasilista Hamic	\N	f	f	f	f	f	2
1884	\N	Melisa Patriarco	\N	f	f	f	f	f	2
1898	\N	Francoise Rioux	\N	f	f	f	f	f	2
1899	\N	Kakuei Blanford	\N	f	f	f	f	f	2
1904	\N	Gigi Barfuss	\N	f	f	f	f	f	2
1912	\N	Duron Dibella	\N	f	f	f	f	f	2
1916	\N	Iravati Pizzolato	\N	f	f	f	f	f	2
1927	\N	Conchetta Cater	\N	f	f	f	f	f	2
1938	\N	JamAan Kine	\N	f	f	f	f	f	2
1939	\N	Zanthe Felarca	\N	f	f	f	f	f	2
1941	\N	Amalia Krajcik	\N	f	f	f	f	f	2
1945	\N	Cyril Croslen	\N	f	f	f	f	f	2
1977	\N	Anbessa Gulde	\N	f	f	f	f	f	2
1978	\N	Adolfa Leuthauser	\N	f	f	f	f	f	2
1993	\N	Solange Alson	\N	f	f	f	f	f	2
1999	\N	Haimo Huesso	\N	f	f	f	f	f	2
2000	\N	Javier Hausauer	\N	f	f	f	f	f	2
2005	\N	Freda Freimuth	\N	f	f	f	f	f	2
2014	\N	Mikolas Sirman	\N	f	f	f	f	f	2
2021	\N	Koshiro Augusto	\N	f	f	f	f	f	2
2027	\N	Yakamochi Alonza	\N	f	f	f	f	f	2
2043	\N	Iasion Kirt	\N	f	f	f	f	f	2
2044	\N	Aida Appelt	\N	f	f	f	f	f	2
2064	\N	Richild Brinius	\N	f	f	f	f	f	2
2066	\N	Nana Stania	\N	f	f	f	f	f	2
2068	\N	Radoste Hoefling	\N	f	f	f	f	f	2
2073	\N	Cloelia Shein	\N	f	f	f	f	f	2
306	\N	Naglaya Tantillo	\N	f	f	f	f	f	2
1851	\N	Nene Rhea	\N	f	f	f	f	f	2
1425	\N	Katyushka Gabriele	\N	f	f	f	f	f	2
1762	\N	Razan Symons	\N	f	f	f	f	f	2
572	\N	Tanja Lockmiller	\N	f	f	f	f	f	2
518	\N	Salamon Julien	\N	f	f	f	f	f	2
1397	\N	Doppo Kieser	\N	f	f	f	f	f	2
1883	\N	Patrido Sielaff	\N	f	f	f	f	f	2
1907	\N	Ruwaid Solian	\N	f	f	f	f	f	2
1619	\N	Marek Mancino	\N	f	f	f	f	f	2
1829	\N	Dukinea Zmijewski	\N	f	f	f	f	f	2
1491	\N	Shaka Enget	\N	f	f	f	f	f	2
1654	\N	Seriozhenka Homen	\N	f	f	f	f	f	2
1906	\N	Kiyoemon Wesby	\N	f	f	f	f	f	2
1805	\N	Lone Pavese	\N	f	f	f	f	f	2
242	\N	Meena Riegel	\N	f	f	f	f	f	2
714	\N	Aurelian Fealy	\N	f	f	f	f	f	2
568	\N	Isha Quave	\N	f	f	f	f	f	2
731	\N	Juro Scogin	\N	f	f	f	f	f	2
1371	\N	Dodie Tedford	\N	f	f	f	f	f	2
2038	\N	Lacrasha Slavick	\N	f	f	f	f	f	2
73	\N	Claudios Lemmert	\N	f	f	f	f	f	2
969	\N	Waliyya Dandrea	\N	f	f	f	f	f	2
176	\N	Ovidio Bostrom	\N	f	f	f	f	f	2
1003	\N	Bhoomika Secord	\N	f	f	f	f	f	2
1385	\N	Egor Braue	\N	f	f	f	f	f	2
812	\N	Caden Failing	\N	f	f	f	f	f	2
1408	\N	Majdiyya Bonsall	\N	f	f	f	f	f	2
1512	\N	Shoichi Mathey	\N	f	f	f	f	f	2
218	\N	YolandaAbigail Insogna	\N	f	f	f	f	f	2
1695	\N	Chantrelle Gruiger	\N	f	f	f	f	f	2
120	\N	Avigdor Puglia	\N	f	f	f	f	f	2
630	\N	Ksniatintsa Fuchser	\N	f	f	f	f	f	2
1727	\N	Augusto Kempson	\N	f	f	f	f	f	2
1338	\N	Khynika Borwig	\N	f	f	f	f	f	2
1769	\N	Fanaila Torain	\N	f	f	f	f	f	2
435	\N	Shaunene Libera	\N	f	f	f	f	f	2
1652	\N	Matteo Mestre	\N	f	f	f	f	f	2
1326	\N	Julien Triveno	\N	f	f	f	f	f	2
843	\N	Apelino Reeber	\N	f	f	f	f	f	2
756	\N	Lotta Francoise	\N	f	f	f	f	f	2
748	\N	Pippo Nascimento	\N	f	f	f	f	f	2
985	\N	Cecil Kochler	\N	f	f	f	f	f	2
1045	\N	Aedd Lurye	\N	f	f	f	f	f	2
1105	\N	Tarrant Alsbrooks	\N	f	f	f	f	f	2
722	\N	Nazarova Abundis	\N	f	f	f	f	f	2
1028	\N	Sabina Conde	\N	f	f	f	f	f	2
512	\N	Ilsegret Akerley	\N	f	f	f	f	f	2
2060	\N	Mimi Stremmel	\N	f	f	f	f	f	2
1458	\N	Mudri Gamero	\N	f	f	f	f	f	2
1840	\N	Pieter Frend	\N	f	f	f	f	f	2
1755	\N	Sameera Beazley	\N	f	f	f	f	f	2
1776	\N	Bezubaia Wiece	\N	f	f	f	f	f	2
1637	\N	Yoshida Volo	\N	f	f	f	f	f	2
1954	\N	Bibiane Eddens	\N	f	f	f	f	f	2
1526	\N	Inocente Arntzen	\N	f	f	f	f	f	2
1878	\N	Argus Bierwirth	\N	f	f	f	f	f	2
1624	\N	Xylina Mcnicoll	\N	f	f	f	f	f	2
960	\N	Chasidy Hoop	\N	f	f	f	f	f	2
1632	\N	Aeacus Veloz	\N	f	f	f	f	f	2
815	\N	Constantino Thielen	\N	f	f	f	f	f	2
158	\N	Danaus Dacanay	\N	f	f	f	f	f	2
1210	\N	Mitsuo Neff	\N	f	f	f	f	f	2
1828	\N	Leonel Meche	\N	f	f	f	f	f	2
2016	\N	Blossom Quero	\N	f	f	f	f	f	2
559	\N	Volotkoveia Klees	\N	f	f	f	f	f	2
1821	\N	Gennadi Schanck	\N	f	f	f	f	f	2
2062	\N	Castalia Ryser	\N	f	f	f	f	f	2
1081	\N	Addison Bovio	\N	f	f	f	f	f	2
1965	\N	Llwyr Fagerstrom	\N	f	f	f	f	f	2
1532	\N	Lauranne Brwon	\N	f	f	f	f	f	2
1960	\N	Dmitreeva Ellsbury	\N	f	f	f	f	f	2
1791	\N	Okichi Spradlin	\N	f	f	f	f	f	2
1542	\N	Guido Genier	\N	f	f	f	f	f	2
1225	\N	Oka Prock	\N	f	f	f	f	f	2
853	\N	Kerry Navarrate	\N	f	f	f	f	f	2
994	\N	Editta Servoss	\N	f	f	f	f	f	2
1900	\N	Finn Carboneau	\N	f	f	f	f	f	2
1673	\N	Tsumemasa Lloyd	\N	f	f	f	f	f	2
233	\N	Nia Drakes	\N	f	f	f	f	f	2
1360	\N	Coch Foulger	\N	f	f	f	f	f	2
1894	\N	Gayle Wingrove	\N	f	f	f	f	f	2
921	\N	Vilena Orillion	\N	f	f	f	f	f	2
697	\N	Radha Sloan	\N	f	f	f	f	f	2
1780	\N	Ramonda Tripplett	\N	f	f	f	f	f	2
951	\N	Kuemon Coatie	\N	f	f	f	f	f	2
1522	\N	Oles Sumaran	\N	f	f	f	f	f	2
1975	\N	Lonce Jiron	\N	f	f	f	f	f	2
1660	\N	Winand Poulton	\N	f	f	f	f	f	2
1220	\N	Carevel Tardif	\N	f	f	f	f	f	2
1399	\N	Marulia Bondura	\N	f	f	f	f	f	2
2003	\N	Cellina Schlosser	\N	f	f	f	f	f	2
1348	\N	Aleece Thorn	\N	f	f	f	f	f	2
440	\N	Saalim Velasquez	\N	f	f	f	f	f	2
783	\N	Jurgisr Arkins	\N	f	f	f	f	f	2
2009	\N	Gulika Alipio	\N	f	f	f	f	f	2
889	\N	Shandee Finnicum	\N	f	f	f	f	f	2
252	\N	Chikafusa Koolman	\N	f	f	f	f	f	2
1590	\N	Araceli Ertel	\N	f	f	f	f	f	2
793	\N	Anzhela Venturelli	\N	f	f	f	f	f	2
1835	\N	Honami Docherty	\N	f	f	f	f	f	2
964	\N	Demont Escalet	\N	f	f	f	f	f	2
991	\N	Amora Ockmond	\N	f	f	f	f	f	2
265	\N	Aspasa Abaunza	\N	f	f	f	f	f	2
2037	\N	Ayushmati Appelgren	\N	f	f	f	f	f	2
1509	\N	Jaen Kerechanko	\N	f	f	f	f	f	2
607	\N	Dyllan Mairs	\N	f	f	f	f	f	2
1842	\N	Kallie Bednarek	\N	f	f	f	f	f	2
2013	\N	Glafira Geng	\N	f	f	f	f	f	2
1441	\N	Emese Abadie	\N	f	f	f	f	f	2
8	\N	Donald Ludlow	\N	f	f	f	f	f	2
1655	\N	Gwalchmei Halbert	\N	f	f	f	f	f	2
1537	\N	Jascha Plantier	\N	f	f	f	f	f	2
1550	\N	Ran Rubendall	\N	f	f	f	f	f	2
2031	\N	Salaah Elio	\N	f	f	f	f	f	2
963	\N	Nomi Rosato	\N	f	f	f	f	f	2
1964	\N	Madelynn Hoehn	\N	f	f	f	f	f	2
1896	\N	Baptist Schubert	\N	f	f	f	f	f	2
2034	\N	Dorel Brandt	\N	f	f	f	f	f	2
106	\N	Ceanna Vangoff	\N	f	f	f	f	f	2
1196	\N	Junichi Hagele	\N	f	f	f	f	f	2
447	\N	Davida Rho	\N	f	f	f	f	f	2
596	\N	Masafumi Gipson	\N	f	f	f	f	f	2
1598	\N	Shontaya Klitzner	\N	f	f	f	f	f	2
1072	\N	Jeanine Garoner	\N	f	f	f	f	f	2
485	\N	Iudita Altew	\N	f	f	f	f	f	2
1476	\N	Lilly Rissanen	\N	f	f	f	f	f	2
2047	\N	Sela Funnye	\N	f	f	f	f	f	2
1714	\N	Mikio Brunston	\N	f	f	f	f	f	2
1473	\N	Yemena Knebel	\N	f	f	f	f	f	2
2039	\N	Takehide Gauna	\N	f	f	f	f	f	2
1243	\N	Eber Ebinger	\N	f	f	t	f	f	2
65	\N	Alexandros Lagazo	\N	f	f	t	f	f	2
1771	\N	Leonora Peli	\N	f	f	t	f	f	2
1217	\N	Gisselle Teigen	\N	f	f	t	f	f	2
400	\N	Hilary Braddy	\N	f	f	t	f	f	2
1182	\N	Flaco Reyome	\N	f	f	t	f	f	2
1750	\N	Akina Jang	\N	f	f	t	f	f	2
389	\N	Dymas Houskeeper	\N	f	f	t	f	f	2
1865	\N	Agpios Bia	\N	f	f	t	f	f	2
1813	\N	Atsumichi Licano	\N	f	f	t	f	f	2
2007	\N	Sajag Traunfeld	\N	f	f	t	f	f	2
1698	\N	Janeka Hochhalter	\N	f	f	t	f	f	2
1733	\N	Aleydis Virgadamo	\N	f	f	t	f	f	2
117	\N	Roseann Ora	\N	f	f	t	f	f	2
1690	\N	Clmentine Engellant	\N	f	f	t	f	f	2
1950	\N	Michizane Krips	\N	f	f	t	f	f	2
1689	\N	Vonda Jasmine	\N	f	f	t	f	f	2
348	\N	Yukako Klingbeil	\N	f	f	t	f	f	2
1165	\N	Teriuihi Lachner	\N	f	f	t	f	f	2
1643	\N	Garca Diers	\N	f	f	t	f	f	2
807	\N	Toyoaki Richoux	\N	f	f	t	f	f	2
110	\N	Muna Lastovica	\N	f	f	t	f	f	2
51	\N	Hannele Kneifl	\N	f	f	t	f	f	2
1443	\N	Gerald Fieselman	\N	f	f	t	f	f	2
953	\N	Juanisha Seppi	\N	f	f	t	f	f	2
1078	\N	Grite Faddis	\N	f	f	t	f	f	2
847	\N	Safiyya Letchaw	\N	f	f	t	f	f	2
213	\N	Warona Pelligrino	\N	f	f	t	f	f	2
906	\N	Bennet Melendes	\N	f	f	t	f	f	2
534	\N	Galyn Stobie	\N	f	f	t	f	f	2
1678	\N	Annunziata Ravi	\N	f	f	t	f	f	2
1416	\N	Saer Dillenbeck	\N	f	f	t	f	f	2
1976	\N	Gratia Flach	\N	f	f	t	f	f	2
1857	\N	Myshka Krishnamurthy	\N	f	f	t	f	f	2
1533	\N	Lloyd Stallsmith	\N	f	f	t	f	f	2
1396	\N	Alka Groshek	\N	f	f	t	f	f	2
1224	\N	Oryan Mirles	\N	f	f	t	f	f	2
1113	\N	Nolan Brownle	\N	f	f	t	f	f	2
1983	\N	Atsumori Bloyer	\N	f	f	t	f	f	2
1521	\N	Arcadia Granade	\N	f	f	t	f	f	2
1073	\N	Dirthe Kiewiet	\N	f	f	t	f	f	2
1973	\N	Malcolm Voelz	\N	f	f	t	f	f	2
1911	\N	Tadao Pentaris	\N	f	f	t	f	f	2
1955	\N	Miranda Leinen	\N	f	f	t	f	f	2
1262	\N	Faith Neeld	\N	f	f	t	f	f	2
1721	\N	Matashichi Butman	\N	f	f	t	f	f	2
2071	\N	Jakoba Bueche	\N	f	f	t	f	f	2
768	\N	Tamiko Docken	\N	f	f	t	f	f	2
1574	\N	Iken Siluis	\N	f	f	t	f	f	2
1736	\N	Lucrecia Rollings	\N	f	f	t	f	f	2
954	\N	Janita Bolieu	\N	f	f	t	f	f	2
946	\N	Inez Meeroff	\N	f	f	t	f	f	2
1887	\N	Demetria Tramonti	\N	f	f	t	f	f	2
1273	\N	Notburg Towber	\N	f	f	t	f	f	2
1439	\N	Martina Mcclary	\N	f	f	t	f	f	2
1868	\N	Caddock Stagowski	\N	f	f	t	f	f	2
1867	\N	Trillare Stukel	\N	f	f	t	f	f	2
1412	\N	Fedoritsa Stinner	\N	f	f	t	f	f	2
635	\N	Maureo Benedict	\N	f	f	t	f	f	2
779	\N	Firdaus Casavez	\N	f	f	t	f	f	2
185	\N	Cady Schweizer	\N	f	f	f	t	f	2
268	\N	Tarran Pointer	\N	f	f	f	t	f	2
301	\N	Alyss Wuitschick	\N	f	f	f	t	f	2
334	\N	Toku Synowiec	\N	f	f	f	t	f	2
351	\N	Lilja Siwiec	\N	f	f	f	t	f	2
359	\N	Katreen Osthoff	\N	f	f	f	t	f	2
390	\N	Carli Maggert	\N	f	f	f	t	f	2
398	\N	Dondrea Crocco	\N	f	f	f	t	f	2
466	\N	Solymar Palisbo	\N	f	f	f	t	f	2
496	\N	Garon Tischler	\N	f	f	f	t	f	2
514	\N	Giovanna Douthit	\N	f	f	f	t	f	2
561	\N	Pazia Comnick	\N	f	f	f	t	f	2
603	\N	Ineng Alkbsh	\N	f	f	f	t	f	2
617	\N	Nisus Coby	\N	f	f	f	t	f	2
650	\N	Este Manon	\N	f	f	f	t	f	2
658	\N	Noburo Charleton	\N	f	f	f	t	f	2
716	\N	Inejiro Javens	\N	f	f	f	t	f	2
730	\N	Erechtheus Muschick	\N	f	f	f	t	f	2
777	\N	Deverell Anez	\N	f	f	f	t	f	2
816	\N	Aandranee Sakamaki	\N	f	f	f	t	f	2
894	\N	Detana Trautz	\N	f	f	f	t	f	2
914	\N	Clementine Barga	\N	f	f	f	t	f	2
943	\N	Soshu Burress	\N	f	f	f	t	f	2
1076	\N	Daris Astley	\N	f	f	f	t	f	2
1077	\N	Gil Holben	\N	f	f	f	t	f	2
1123	\N	Argos Cumings	\N	f	f	f	t	f	2
1234	\N	Dama Leino	\N	f	f	f	t	f	2
1284	\N	Kit Storrs	\N	f	f	f	t	f	2
1292	\N	Korechika Mamer	\N	f	f	f	t	f	2
1401	\N	Makhna Stabile	\N	f	f	f	t	f	2
1410	\N	Cassian Cozzy	\N	f	f	f	t	f	2
1428	\N	Gia Stonesifer	\N	f	f	f	t	f	2
1499	\N	Uchdryd Locicero	\N	f	f	f	t	f	2
1513	\N	Asami Sellek	\N	f	f	f	t	f	2
1525	\N	Xuqiu Deller	\N	f	f	f	t	f	2
1552	\N	Yaineris Francisco	\N	f	f	f	t	f	2
1579	\N	Loke Tuton	\N	f	f	f	t	f	2
1583	\N	Shesha Humbird	\N	f	f	f	t	f	2
1612	\N	Hedda Yoshida	\N	f	f	f	t	f	2
1621	\N	Handy Ratajczak	\N	f	f	f	t	f	2
1636	\N	Evi Heidebrecht	\N	f	f	f	t	f	2
1642	\N	Patroklus Hertel	\N	f	f	f	t	f	2
1653	\N	Letizia Madaras	\N	f	f	f	t	f	2
1676	\N	Lottchen Pillitteri	\N	f	f	f	t	f	2
1706	\N	Edmonda Ditullio	\N	f	f	f	t	f	2
1723	\N	Marce Fiscalini	\N	f	f	f	t	f	2
1752	\N	Gizla Nordmark	\N	f	f	f	t	f	2
1759	\N	Jazmine Susman	\N	f	f	f	t	f	2
1767	\N	Angela Hager	\N	f	f	f	t	f	2
1793	\N	Huaning Zwolski	\N	f	f	f	t	f	2
1797	\N	ra Jansons	\N	f	f	f	t	f	2
1830	\N	Chebi Selking	\N	f	f	f	t	f	2
1875	\N	Jenna Ovit	\N	f	f	f	t	f	2
1903	\N	Rico Boronat	\N	f	f	f	t	f	2
1918	\N	Jonam Steinle	\N	f	f	f	t	f	2
1926	\N	Jamaall Rohen	\N	f	f	f	t	f	2
1957	\N	Sigurd Mahli	\N	f	f	f	t	f	2
1962	\N	Kristin Sandhu	\N	f	f	f	t	f	2
1971	\N	Toshimichi Speth	\N	f	f	f	t	f	2
1988	\N	Irminwin Milloy	\N	f	f	f	t	f	2
1991	\N	Trina Sjerven	\N	f	f	f	t	f	2
1992	\N	Tango Constable	\N	f	f	f	t	f	2
1997	\N	Aberthol Wilczak	\N	f	f	f	t	f	2
2010	\N	Benita Hatzenbuehler	\N	f	f	f	t	f	2
2018	\N	Evamarie Coraham	\N	f	f	f	t	f	2
2029	\N	Lance Fernandes	\N	f	f	f	t	f	2
2049	\N	Mawar Camfield	\N	f	f	f	t	f	2
2053	\N	Raktavira Danforth	\N	f	f	f	t	f	2
2061	\N	Jada Grech	\N	f	f	f	t	f	2
2063	\N	Dianmu Aver	\N	f	f	f	t	f	2
2069	\N	Uleia Mineah	\N	f	f	f	t	f	2
1864	\N	Jermaine Mandahl	\N	f	f	f	t	f	2
1282	\N	Dawn Lauinger	\N	f	f	f	t	f	2
2025	\N	Prebrana Kekiwi	\N	f	f	f	t	f	2
244	\N	Petros Josefy	\N	f	f	f	t	f	2
1713	\N	Cipriana Wadzinski	\N	f	f	f	t	f	2
643	\N	Diana Gulbranson	\N	f	f	f	t	f	2
1517	\N	Bhadra Whidden	\N	f	f	f	t	f	2
1815	\N	Martino Nommay	\N	f	f	f	t	f	2
1739	\N	Analeigh Sebring	\N	f	f	f	t	f	2
2070	\N	Lippio Llopis	\N	f	f	f	t	f	2
1012	\N	Lisandro Harpst	\N	f	f	f	t	f	2
1032	\N	Julika Smar	\N	f	f	f	t	f	2
1200	\N	Sadahige Taglialatela	\N	f	f	f	t	f	2
2048	\N	Vyshia Waldall	\N	f	f	f	t	f	2
1363	\N	Joey Yarboro	\N	f	f	f	t	f	2
1126	\N	AbdulBaasid Chilvers	\N	f	f	f	t	f	2
30	\N	AbdulHaadi Castellan	\N	f	f	f	t	f	2
1596	\N	Querida Kreatsoulas	\N	f	f	f	t	f	2
1998	\N	Maxime Higgs	\N	f	f	f	t	f	2
1947	\N	Zumruda Fishman	\N	f	f	f	t	f	2
548	\N	Fabiana Demase	\N	f	f	f	t	f	2
995	\N	Utathya Kreig	\N	f	f	f	t	f	2
1996	\N	Khadija Lagerquist	\N	f	f	f	t	f	2
908	\N	Eupeithes Bevens	\N	f	f	f	t	f	2
999	\N	Ajanta Mischel	\N	f	f	f	t	f	2
1888	\N	Tuhfa Pedez	\N	f	f	f	t	f	2
1304	\N	Mazcho Stringer	\N	f	f	f	t	f	2
1921	\N	Zeenab Lasane	\N	f	f	f	t	f	2
1291	\N	Anwar Katayama	\N	f	f	f	t	f	2
1772	\N	Fahroni Anglea	\N	f	f	f	t	f	2
1064	\N	Casandra Shire	\N	f	f	f	t	f	2
1392	\N	Jared Torgersen	\N	f	f	f	t	f	2
1223	\N	Juri Guzik	\N	f	f	f	t	f	2
1848	\N	Lecia Baumeister	\N	f	f	f	t	f	2
1430	\N	Paloma Schnall	\N	f	f	f	t	f	2
78	\N	Takuboku Aicklen	\N	f	f	f	t	f	2
1665	\N	Sozui Jalovel	\N	f	f	f	t	f	2
456	\N	Fedyenka Terrasi	\N	f	f	f	t	f	2
328	\N	Tahlia Francisque	\N	f	f	f	t	f	2
1929	\N	Evdxios Fageraes	\N	f	f	f	t	f	2
1332	\N	Mercede Naslund	\N	f	f	f	t	f	2
1419	\N	Stolpolcha Shigemi	\N	f	f	f	t	f	2
509	\N	Rufio Guitard	\N	f	f	f	t	f	2
675	\N	Namiko Leval	\N	f	f	f	t	f	2
1661	\N	Mukhtaar Grewe	\N	f	f	f	t	f	2
2058	\N	Abdul Spicer	\N	f	f	f	t	f	2
1854	\N	Zufar Pestoni	\N	f	f	f	t	f	2
94	\N	Stopolcha Starowicz	\N	f	f	f	t	f	2
1932	\N	Jedrick Relacion	\N	f	f	f	t	f	2
522	\N	Ulia Kaines	\N	f	f	f	t	f	2
1841	\N	Flora Aveni	\N	f	f	f	t	f	2
296	\N	Cornelius Dolak	\N	f	f	f	t	f	2
645	\N	Kiraanna Scherping	\N	f	f	f	t	f	2
751	\N	Adelio Zahner	\N	f	f	f	t	f	2
772	\N	Timun Silverstein	\N	f	f	f	t	f	2
1023	\N	Gota Dorff	\N	f	f	f	t	f	2
1047	\N	Dena Mcentire	\N	f	f	f	t	f	2
1134	\N	Prokop Limage	\N	f	f	f	t	f	2
1144	\N	Hanka Henness	\N	f	f	f	t	f	2
1266	\N	LeVaughan Laity	\N	f	f	f	t	f	2
1341	\N	Gulielma Arce	\N	f	f	f	t	f	2
1369	\N	Dorinda Cuchiara	\N	f	f	f	t	f	2
1411	\N	Jelawat Balletta	\N	f	f	f	t	f	2
1480	\N	Fikriyya Siddiq	\N	f	f	f	t	f	2
1486	\N	Fokina Poythress	\N	f	f	f	t	f	2
1638	\N	Phaethon Gearon	\N	f	f	f	t	f	2
1679	\N	Yoyon Lecroy	\N	f	f	f	t	f	2
1703	\N	Strezislava Weingard	\N	f	f	f	t	f	2
1758	\N	Boje Ostrum	\N	f	f	f	t	f	2
1788	\N	Podolphe Fluitt	\N	f	f	f	t	f	2
1812	\N	Bia Klemme	\N	f	f	f	t	f	2
1819	\N	Kulthum Liverance	\N	f	f	f	t	f	2
1839	\N	Waatiq Perico	\N	f	f	f	t	f	2
2072	\N	Luzia Rahib	\N	f	f	f	t	f	2
1730	\N	Shontal Sehnert	\N	f	f	t	t	f	2
1469	\N	Luca Dolbin	\N	f	f	t	t	f	2
1307	\N	Torah Giller	\N	f	f	t	t	f	2
1968	\N	Nonna Laplaunt	\N	f	f	t	t	f	2
829	\N	Wira Majette	\N	f	f	t	t	f	2
940	\N	Tyonna Sturdevant	\N	f	f	t	t	f	2
1989	\N	Igone Rader	\N	f	f	t	t	f	2
979	\N	Wava Goubeaux	\N	f	f	t	t	f	2
1256	\N	Kinaana Kodera	\N	f	f	t	t	f	2
82	\N	Nik Reposa	\N	f	f	t	t	f	2
1930	\N	Honey Eidinger	\N	f	f	t	t	f	2
1659	\N	Eligius Vanwechel	\N	f	f	t	t	f	2
1809	\N	Breonia Gierling	\N	f	f	t	t	f	2
1209	\N	Effie Menzie	\N	f	f	t	t	f	2
1604	\N	Sherry Mullennix	\N	f	f	t	t	f	2
1807	\N	Sanaaa Yoneda	\N	f	f	t	t	f	2
1484	\N	Natasia Sliter	\N	f	f	t	t	f	2
1832	\N	Fedorav Solich	\N	f	f	t	t	f	2
840	\N	Cleveland Navarez	\N	f	f	t	t	f	2
588	\N	Dewi Rappleyea	\N	f	f	t	t	f	2
278	\N	Bozena Tilly	\N	f	f	t	t	f	2
1871	\N	Barbi Denery	\N	f	f	t	t	f	2
1457	\N	Alwin Roewe	\N	f	f	t	t	f	2
864	\N	Colombe Bermea	\N	f	f	t	t	f	2
1846	\N	Walto Messman	\N	f	f	t	t	f	2
1529	\N	Hortense Ganotisi	\N	f	f	t	t	f	2
656	\N	Anthony Row	\N	f	f	t	t	f	2
324	\N	Elif Gameros	\N	f	f	t	t	f	2
1249	\N	Heidelore Ruschmann	\N	f	f	t	t	f	2
1981	\N	Eileen Heick	\N	f	f	t	t	f	2
1153	\N	Motoyasu Calligy	\N	f	f	t	t	f	2
1885	\N	Alona Lucario	\N	f	f	t	t	f	2
1466	\N	Bhavin Primavera	\N	f	f	t	t	f	2
1459	\N	Gorshedna Marone	\N	f	f	t	t	f	2
1853	\N	Yumiko Ginther	\N	f	f	t	t	f	2
1041	\N	Flaca Sodawasser	\N	f	f	t	t	f	2
998	\N	Kea Croshaw	\N	f	f	t	t	f	2
1817	\N	Tatiiana Sublett	\N	f	f	t	t	f	2
1648	\N	Deelon Sephton	\N	f	f	t	t	f	2
1183	\N	Latrice Ghrist	\N	f	f	t	t	f	2
913	\N	Erik Strothmann	\N	f	f	t	t	f	2
1232	\N	Tsuruki Hazelrigg	\N	f	f	t	t	f	2
1902	\N	Amir Conkling	\N	f	f	t	t	f	2
451	\N	Karina Eggington	\N	f	f	t	t	f	2
1083	\N	Barbie Dubonnet	\N	f	f	t	t	f	2
322	\N	Reece Raburn	\N	f	f	t	t	f	2
1527	\N	Ernst Bengtson	\N	f	f	t	t	f	2
494	\N	Houke Luthe	\N	f	f	t	t	f	2
1667	\N	Oleka Tommasino	\N	f	f	t	t	f	2
2002	\N	Hasnaa Sietsema	\N	f	f	t	t	f	2
1131	\N	Shaakira Ricklefs	\N	f	f	t	t	f	2
1011	\N	Rhea Platas	\N	f	f	t	t	f	2
887	\N	Shinji Kapler	\N	f	f	t	t	f	2
587	\N	Toyoko Colden	\N	f	f	t	t	f	2
169	\N	Shoko Moel	\N	f	f	t	t	f	2
865	\N	Booker Spiker	\N	f	f	t	t	f	2
1609	\N	Valentina Topia	\N	f	f	t	t	f	2
870	\N	Fajyaz Mutana	\N	f	f	t	t	f	2
1943	\N	Gustel Pitek	\N	f	f	t	t	f	2
1566	\N	Chesell Vatter	\N	f	f	t	t	f	2
1372	\N	Ofelia Golde	\N	f	f	t	t	f	2
1889	\N	Akila Terlizzi	\N	f	f	t	t	f	2
1467	\N	Marlene Dague	\N	f	f	t	t	f	2
1963	\N	Gerlind Boomershine	\N	f	f	t	t	f	2
1340	\N	Vrotsislava Bouman	\N	f	f	t	t	f	2
1313	\N	Primavera Huffstickler	\N	f	f	t	t	f	2
521	\N	Tramaine Scruton	\N	f	f	t	t	f	2
1936	\N	Lucretia Ferndez	\N	f	f	t	t	f	2
1908	\N	Mya Swilley	\N	f	f	t	t	f	2
1742	\N	Lexi Faulk	\N	f	f	t	t	f	2
1620	\N	Mamie Howen	\N	f	f	t	t	f	2
1091	\N	Daniel Harriston	\N	f	f	t	t	f	2
1493	\N	Athindoros Shurgot	\N	f	f	t	t	f	2
1924	\N	Tienne Segraves	\N	f	f	t	t	f	2
1297	\N	Urako Staker	\N	f	f	t	t	f	2
1920	\N	Deke Mirabelli	\N	f	f	t	t	f	2
1228	\N	Coby Smaller	\N	t	f	f	f	t	2
504	\N	Tekla Gallerani	\N	t	f	f	f	t	2
1818	\N	Eskil Littledave	\N	t	f	f	f	t	2
1488	\N	Hypnos Blank	\N	t	f	f	f	t	2
848	\N	Shaqeeqa Levra	\N	t	f	f	f	t	2
200	\N	Riddhi Colesar	\N	t	f	f	f	t	2
1985	\N	Bodil Korinta	\N	t	f	f	f	t	2
103	\N	Casswallawn Scheiblich	\N	t	t	f	f	t	2
229	\N	Jace Ruotolo	\N	t	t	f	f	t	2
1265	\N	Lane Portes	\N	t	t	f	f	t	2
1786	\N	Llyn Hardge	\N	t	f	t	f	t	2
1452	\N	Cindi Ginanni	\N	t	f	t	f	t	2
140	\N	Uqbah Oconnell	\N	t	t	t	f	t	2
543	\N	Olzhbeta Hasenberg	\N	t	f	f	t	t	2
1913	\N	Brittani Gasman	\N	t	f	t	t	t	2
838	\N	Charlette Negron	\N	t	f	t	t	t	2
582	\N	Adrien Hoit	\N	t	f	t	t	t	2
1862	\N	Ernestine Barkan	\N	t	t	t	t	t	2
\.



COPY presentation (pid, did) FROM stdin;
\.



COPY program_committees (id, label, committee, cid) FROM stdin;
64	ZSWC 2015 Program Committee	63	63
712	YSWC 2014 Program Committee	713	713
804	ZSWC 2014 Program Committee	803	803
1303	XSWC 2015 Program Committee	1302	1302
1651	XSWC 2014 Program Committee	1650	1650
1745	SIGXYZ 2014 Program Committee	1746	1746
1418	YSWC 2015 Program Committee	1417	1417
\.



COPY registration_fee_person (pid, rid) FROM stdin;
\.



COPY registration_fees (id, currency, price, type) FROM stdin;
379	\N	752	0
1564	\N	753	0
1203	\N	757	0
1118	\N	754	0
134	\N	751	0
1879	\N	755	0
1958	\N	756	0
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



COPY sponzor_fees (id, currency, price) FROM stdin;
1980	\N	5002
2045	\N	5003
743	\N	5005
1719	\N	5006
1221	\N	5001
1826	\N	5004
1799	\N	5007
\.



ALTER TABLE ONLY acm_sigkdds
    ADD CONSTRAINT "ACM_SIGKDDPK" PRIMARY KEY (id);



ALTER TABLE ONLY best_paper_awards_committs
    ADD CONSTRAINT "Best_Paper_Awards_CommittPK" PRIMARY KEY (id);



ALTER TABLE ONLY best_research_paper_awards
    ADD CONSTRAINT "Best_Research_Paper_AwardPK" PRIMARY KEY (id);



ALTER TABLE ONLY conferences
    ADD CONSTRAINT "ConferencePK" PRIMARY KEY (id);



ALTER TABLE ONLY deadline_abstract_submiss
    ADD CONSTRAINT "Deadline_Abstract_SubmissPK" PRIMARY KEY (id);



ALTER TABLE ONLY documents
    ADD CONSTRAINT "DocumentPK" PRIMARY KEY (id);



ALTER TABLE ONLY e_mails
    ADD CONSTRAINT "E-mailPK" PRIMARY KEY (person, value);



ALTER TABLE ONLY main_offices
    ADD CONSTRAINT "Main_officePK" PRIMARY KEY (id);



ALTER TABLE ONLY organizing_committees
    ADD CONSTRAINT "Organizing_CommitteePK" PRIMARY KEY (id);



ALTER TABLE ONLY persons
    ADD CONSTRAINT "PersonPK" PRIMARY KEY (id);



ALTER TABLE ONLY program_committees
    ADD CONSTRAINT "Program_CommitteePK" PRIMARY KEY (id);



ALTER TABLE ONLY registration_fees
    ADD CONSTRAINT "Registration_feePK" PRIMARY KEY (id);



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "ReviewPK" PRIMARY KEY (id);



ALTER TABLE ONLY sponzor_fees
    ADD CONSTRAINT "Sponzor_feePK" PRIMARY KEY (id);



ALTER TABLE ONLY main_office_person
    ADD CONSTRAINT "can_stay_inPK" PRIMARY KEY (pid, mid);



ALTER TABLE ONLY person_deadline_abstract_submiss
    ADD CONSTRAINT "notification_untilPK" PRIMARY KEY (pid, did);



ALTER TABLE ONLY person_best_research_paper_award
    ADD CONSTRAINT "obtainPK" PRIMARY KEY (pid, bid);



ALTER TABLE ONLY registration_fee_person
    ADD CONSTRAINT "payPK" PRIMARY KEY (pid, rid);



ALTER TABLE ONLY presentation
    ADD CONSTRAINT "presentationPK" PRIMARY KEY (pid, did);



ALTER TABLE ONLY acm_sigkdd_person
    ADD CONSTRAINT "searchPK" PRIMARY KEY (aid, pid);



ALTER TABLE ONLY document_person
    ADD CONSTRAINT "submitPK" PRIMARY KEY (pid, did);



ALTER TABLE ONLY document_deadline_abstract_submiss
    ADD CONSTRAINT "submit_untilPK" PRIMARY KEY (document, deadline);



ALTER TABLE ONLY best_paper_awards_committs
    ADD CONSTRAINT "Best_Paper_Awards_Committ_award_fkey" FOREIGN KEY (award) REFERENCES best_research_paper_awards(id);



ALTER TABLE ONLY best_paper_awards_committs
    ADD CONSTRAINT "Best_Paper_Awards_Committ_hasCommittee_Inv_fkey" FOREIGN KEY (committee) REFERENCES conferences(id);



ALTER TABLE ONLY best_paper_awards_committs
    ADD CONSTRAINT "Best_Paper_Awards_Committ_isCommitteeOf_fkey" FOREIGN KEY (cid) REFERENCES conferences(id);



ALTER TABLE ONLY deadline_abstract_submiss
    ADD CONSTRAINT "Deadline_Abstract_Submiss_designed_by_fkey" FOREIGN KEY (designed) REFERENCES acm_sigkdds(id);



ALTER TABLE ONLY conferences
    ADD CONSTRAINT "FKConferenceholded_by" FOREIGN KEY (holded) REFERENCES acm_sigkdds(id) ON DELETE CASCADE;



ALTER TABLE ONLY e_mails
    ADD CONSTRAINT "FKE-mailPerson" FOREIGN KEY (person) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "FKReviewURI" FOREIGN KEY (id) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "FKReviewhasReview_Inv" FOREIGN KEY (ref) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY reviews
    ADD CONSTRAINT "FKReviewisReviewOf" FOREIGN KEY (review) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY main_office_person
    ADD CONSTRAINT "FKcan_stay_inPerson" FOREIGN KEY (pid) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_fee_person
    ADD CONSTRAINT "FKpayPerson" FOREIGN KEY (pid) REFERENCES persons(id) ON DELETE CASCADE;



ALTER TABLE ONLY registration_fee_person
    ADD CONSTRAINT "FKpayRegistration_fee" FOREIGN KEY (rid) REFERENCES registration_fees(id) ON DELETE CASCADE;



ALTER TABLE ONLY presentation
    ADD CONSTRAINT "FKpresentationDocument" FOREIGN KEY (did) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY acm_sigkdd_person
    ADD CONSTRAINT "FKsearchACM_SIGKDD" FOREIGN KEY (aid) REFERENCES acm_sigkdds(id) ON DELETE CASCADE;



ALTER TABLE ONLY document_deadline_abstract_submiss
    ADD CONSTRAINT "FKsubmit_untilDocument" FOREIGN KEY (document) REFERENCES documents(id) ON DELETE CASCADE;



ALTER TABLE ONLY organizing_committees
    ADD CONSTRAINT "Organizing_Committee_hasCommittee_Inv_fkey" FOREIGN KEY (cid) REFERENCES conferences(id);



ALTER TABLE ONLY organizing_committees
    ADD CONSTRAINT "Organizing_Committee_isCommitteeOf_fkey" FOREIGN KEY (committee) REFERENCES conferences(id);



ALTER TABLE ONLY program_committees
    ADD CONSTRAINT "Program_Committee_hasCommittee_Inv_fkey" FOREIGN KEY (committee) REFERENCES conferences(id);



ALTER TABLE ONLY program_committees
    ADD CONSTRAINT "Program_Committee_isCommitteeOf_fkey" FOREIGN KEY (cid) REFERENCES conferences(id);



ALTER TABLE ONLY main_office_person
    ADD CONSTRAINT "can_stay_in_Place_fkey" FOREIGN KEY (mid) REFERENCES main_offices(id);



ALTER TABLE ONLY person_deadline_abstract_submiss
    ADD CONSTRAINT "notification_until_Author_fkey" FOREIGN KEY (pid) REFERENCES persons(id);



ALTER TABLE ONLY person_deadline_abstract_submiss
    ADD CONSTRAINT "notification_until_Deadline_Author_notificat_fkey" FOREIGN KEY (did) REFERENCES deadline_abstract_submiss(id);



ALTER TABLE ONLY person_best_research_paper_award
    ADD CONSTRAINT "obtain_Author_fkey" FOREIGN KEY (pid) REFERENCES persons(id);



ALTER TABLE ONLY person_best_research_paper_award
    ADD CONSTRAINT "obtain_Award_fkey" FOREIGN KEY (bid) REFERENCES best_research_paper_awards(id);



ALTER TABLE ONLY presentation
    ADD CONSTRAINT "presentation_Speaker_fkey" FOREIGN KEY (pid) REFERENCES persons(id);



ALTER TABLE ONLY acm_sigkdd_person
    ADD CONSTRAINT "search_Sponzor_fkey" FOREIGN KEY (pid) REFERENCES persons(id);



ALTER TABLE ONLY document_person
    ADD CONSTRAINT "submit_Author_fkey" FOREIGN KEY (pid) REFERENCES persons(id);



ALTER TABLE ONLY document_person
    ADD CONSTRAINT "submit_Paper_fkey" FOREIGN KEY (did) REFERENCES documents(id);



ALTER TABLE ONLY document_deadline_abstract_submiss
    ADD CONSTRAINT "submit_until_Deadline_fkey" FOREIGN KEY (deadline) REFERENCES deadline_abstract_submiss(id);
