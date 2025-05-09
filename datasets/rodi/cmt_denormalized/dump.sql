

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP SCHEMA IF EXISTS cmt_denormalized CASCADE;
CREATE SCHEMA cmt_denormalized;
SET search_path = cmt_denormalized, pg_catalog;


SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE "Author" (
    "ID" integer NOT NULL,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Bid" (
    "ID" integer NOT NULL,
    "adjustedBy" integer,
    "hasBid_Inv" integer
);


CREATE TABLE "Conference" (
    "ID" integer NOT NULL,
    "siteURL" integer,
    "acceptsHardcopySubmissions" integer,
    "logoURL" integer,
    date date,
    name character varying(6),
    "reviewsPerPaper" integer
);


CREATE TABLE "Document" (
    "ID" integer NOT NULL,
    "writtenBy" integer,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Paper" (
    "ID" integer NOT NULL,
    "paperID" integer,
    "rejectedBy" integer,
    "readByMeta-Reviewer" integer,
    "hasAuthor" integer,
    title character varying(113),
    "hasDecision" integer,
    "acceptedBy" integer,
    "TYPE" integer DEFAULT 0,
    "Reviewer" integer NOT NULL
);


CREATE TABLE "Person" (
    "ID" integer NOT NULL,
    name character varying(22),
    email character varying(41),
    "assignedByReviewer" integer,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "Preference" (
    "ID" integer NOT NULL
);


CREATE TABLE "ProgramCommittee" (
    "ID" integer NOT NULL
);


CREATE TABLE "ProgramCommitteeChair" (
    "ID" integer NOT NULL
);


CREATE TABLE "ProgramCommitteeMember" (
    "ID" integer NOT NULL,
    "maxPapers" integer,
    "addedBy" integer
);


CREATE TABLE "Rejection" (
    "ID" integer NOT NULL
);


CREATE TABLE "SubjectArea" (
    "ID" integer NOT NULL
);


CREATE TABLE "User" (
    "ID" integer NOT NULL,
    "acceptPaper" integer,
    "TYPE" integer DEFAULT 0
);


CREATE TABLE "assignReviewer" (
    "Administrator" integer NOT NULL,
    "Reviewer" integer NOT NULL
);


CREATE TABLE "co-writePaper" (
    "Co-author" integer NOT NULL,
    "Paper" integer NOT NULL
);


CREATE TABLE "detailsEnteredBy" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "enableVirtualMeeting" (
    "Administrator" integer NOT NULL,
    "Conference" integer NOT NULL
);


CREATE TABLE "endReview" (
    "ProgramCommitteeChair" integer NOT NULL,
    "Review" integer NOT NULL
);


CREATE TABLE "enterReviewCriteria" (
    "Administrator" integer NOT NULL,
    "Conference" integer NOT NULL
);


CREATE TABLE "finalizePaperAssignment" (
    "Administrator" integer NOT NULL,
    "Conference" integer NOT NULL
);


CREATE TABLE "hardcopyMailingManifestsP" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "hasConferenceMember" (
    "Conference" integer NOT NULL,
    "ConferenceMember" integer NOT NULL
);


CREATE TABLE "hasConflictOfInterest" (
    "Person" integer NOT NULL,
    "Document" integer NOT NULL
);


CREATE TABLE "hasProgramCommitteeMember" (
    "ProgramCommittee" integer NOT NULL,
    "ProgramCommitteeMember" integer NOT NULL
);


CREATE TABLE "hasSubjectArea" (
    "Paper" integer NOT NULL,
    "SubjectArea" integer NOT NULL
);


CREATE TABLE "markConflictOfInterest" (
    "ConferenceMember" integer NOT NULL,
    "Paper" integer NOT NULL
);


CREATE TABLE "paperAssignmentToolsRunBy" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "reviewerBiddingStartedBy" (
    "Conference" integer NOT NULL,
    "Administrator" integer NOT NULL
);


CREATE TABLE "setMaxPapers" (
    "Administrator" integer NOT NULL,
    "ProgramCommitteeMember" integer NOT NULL
);


CREATE TABLE "submitPaper" (
    "Author" integer NOT NULL,
    "Paper" integer NOT NULL
);


COPY "Author" ("ID", "TYPE") FROM stdin;
0	0
21	0
23	0
28	0
36	0
48	0
53	0
66	0
82	0
91	0
104	0
111	0
116	0
123	0
130	0
146	0
155	0
179	0
182	0
184	0
189	0
215	0
226	0
238	0
259	0
272	0
273	0
290	0
303	0
308	0
316	0
317	0
319	0
323	0
327	0
329	0
330	0
331	0
335	0
336	0
337	0
339	0
340	0
341	0
343	0
345	0
346	0
348	0
349	0
353	0
358	0
384	0
403	0
407	0
433	0
457	0
470	0
488	0
504	0
524	0
535	0
558	0
587	0
628	0
663	0
674	0
676	0
706	0
712	0
733	0
749	0
767	0
775	0
782	0
785	0
787	0
800	0
802	0
810	0
816	0
838	0
882	0
895	0
902	0
907	0
917	0
943	0
956	0
1013	0
1015	0
1020	0
1070	0
1071	0
1114	0
1123	0
1129	0
1166	0
1198	0
1204	0
1214	0
1217	0
1228	0
1255	0
1302	0
1325	0
1332	0
1357	0
1359	0
1394	0
1397	0
1458	0
1468	0
1476	0
1496	0
1502	0
1518	0
1526	0
1542	0
1562	0
1581	0
1582	0
1583	0
1591	0
1594	0
1596	0
1624	0
1637	0
1662	0
1664	0
1678	0
1683	0
1709	0
1727	0
1730	0
1750	0
1781	0
1787	0
1790	0
1793	0
1815	0
1821	0
1839	0
1868	0
1891	0
1946	0
1980	0
2017	0
2027	0
2054	0
2056	0
2070	0
2072	0
2094	0
2125	0
2147	0
2173	0
2178	0
2189	0
2198	0
2235	0
2241	0
2315	0
2323	0
2339	0
2385	0
2426	0
2428	0
2490	0
2500	0
2528	0
2533	0
2586	0
2623	0
2624	0
2721	0
2731	0
2756	0
2783	0
2886	0
2910	0
2954	0
2973	0
13	2
19	2
30	2
35	2
38	2
46	2
47	2
51	2
54	2
64	2
67	2
71	2
83	2
86	2
93	2
99	2
107	2
112	2
118	2
126	2
129	2
131	2
135	2
139	2
143	2
144	2
147	2
154	2
161	2
174	2
176	2
180	2
195	2
196	2
197	2
199	2
201	2
209	2
213	2
217	2
227	2
228	2
257	2
270	2
275	2
279	2
288	2
291	2
301	2
305	2
352	2
357	2
359	2
372	2
382	2
385	2
396	2
401	2
405	2
412	2
432	2
443	2
445	2
458	2
459	2
460	2
466	2
497	2
516	2
520	2
544	2
549	2
551	2
560	2
561	2
566	2
567	2
572	2
581	2
592	2
605	2
606	2
615	2
620	2
622	2
623	2
627	2
629	2
641	2
644	2
661	2
673	2
686	2
691	2
693	2
701	2
710	2
713	2
720	2
721	2
725	2
734	2
735	2
738	2
747	2
753	2
755	2
756	2
766	2
770	2
777	2
794	2
801	2
808	2
809	2
819	2
821	2
822	2
828	2
833	2
836	2
843	2
844	2
856	2
858	2
859	2
877	2
884	2
887	2
896	2
911	2
915	2
921	2
923	2
927	2
928	2
935	2
936	2
941	2
961	2
964	2
971	2
972	2
983	2
992	2
998	2
1004	2
1018	2
1021	2
1050	2
1051	2
1058	2
1064	2
1069	2
1076	2
1087	2
1092	2
1098	2
1102	2
1106	2
1158	2
1179	2
1180	2
1191	2
1192	2
1193	2
1194	2
1218	2
1220	2
1225	2
1227	2
1245	2
1257	2
1260	2
1262	2
1267	2
1275	2
1276	2
1279	2
1301	2
1307	2
1310	2
1312	2
1319	2
1323	2
1329	2
1350	2
1352	2
1366	2
1369	2
1378	2
1402	2
1403	2
1436	2
1438	2
1439	2
1459	2
1462	2
1465	2
1473	2
1493	2
1495	2
1505	2
1507	2
1519	2
1522	2
1524	2
1528	2
1529	2
1541	2
1565	2
1568	2
1580	2
1590	2
1602	2
1603	2
1611	2
1615	2
1620	2
1642	2
1648	2
1677	2
1688	2
1690	2
1711	2
1720	2
1734	2
1745	2
1748	2
1758	2
1759	2
1761	2
1765	2
1775	2
1797	2
1801	2
1803	2
1807	2
1819	2
1829	2
1835	2
1843	2
1852	2
1854	2
1862	2
1869	2
1873	2
1877	2
1879	2
1882	2
1888	2
1900	2
1911	2
1914	2
1933	2
1948	2
1959	2
1971	2
1987	2
1991	2
1996	2
2003	2
2006	2
2009	2
2012	2
2016	2
2026	2
2043	2
2050	2
2064	2
2065	2
2104	2
2107	2
2119	2
2127	2
2135	2
2144	2
2152	2
2161	2
2164	2
2174	2
2181	2
2188	2
2200	2
2202	2
2212	2
2219	2
2242	2
2247	2
2256	2
2264	2
2270	2
2272	2
2286	2
2321	2
2328	2
2349	2
2350	2
2366	2
2377	2
2399	2
2416	2
2418	2
2469	2
2473	2
2476	2
2483	2
2491	2
2495	2
2504	2
2513	2
2520	2
2525	2
2531	2
2552	2
2556	2
2562	2
2566	2
2571	2
2589	2
2592	2
2595	2
2603	2
2607	2
2617	2
2619	2
2661	2
2689	2
2692	2
2699	2
2706	2
2729	2
2735	2
2737	2
2739	2
2750	2
2763	2
2782	2
2846	2
2871	2
2921	2
2927	2
2960	2
2998	2
3007	2
3012	2
3043	2
\.



COPY "Bid" ("ID", "adjustedBy", "hasBid_Inv") FROM stdin;
\.



COPY "Conference" ("ID", "siteURL", "acceptsHardcopySubmissions", "logoURL", date, name, "reviewsPerPaper") FROM stdin;
208	318	\N	\N	2014-05-05	SIGXYZ	\N
79	1062	\N	\N	2014-05-06	XSWC	\N
7	1408	\N	\N	2014-05-08	ZSWC	\N
230	2062	\N	\N	2014-05-03	YSWC	\N
254	2157	\N	\N	2015-05-09	SIGXYZ	\N
219	2798	\N	\N	2015-05-02	XSWC	\N
395	2861	\N	\N	2015-05-07	YSWC	\N
163	2887	\N	\N	2015-05-04	ZSWC	\N
\.



COPY "Document" ("ID", "writtenBy", "TYPE") FROM stdin;
1	\N	0
4	\N	0
8	\N	0
9	\N	0
12	\N	0
14	\N	0
15	\N	0
16	\N	0
24	\N	0
25	\N	0
33	\N	0
34	\N	0
40	\N	0
43	\N	0
49	\N	0
55	\N	0
56	\N	0
59	\N	0
60	\N	0
61	\N	0
62	\N	0
70	\N	0
72	\N	0
76	\N	0
77	\N	0
78	\N	0
80	\N	0
81	\N	0
89	\N	0
97	\N	0
100	\N	0
103	\N	0
105	\N	0
108	\N	0
114	\N	0
122	\N	0
124	\N	0
127	\N	0
133	\N	0
142	\N	0
150	\N	0
151	\N	0
160	\N	0
164	\N	0
165	\N	0
167	\N	0
170	\N	0
173	\N	0
175	\N	0
183	\N	0
185	\N	0
188	\N	0
190	\N	0
191	\N	0
194	\N	0
204	\N	0
207	\N	0
210	\N	0
211	\N	0
220	\N	0
221	\N	0
223	\N	0
229	\N	0
231	\N	0
232	\N	0
239	\N	0
240	\N	0
241	\N	0
242	\N	0
244	\N	0
247	\N	0
249	\N	0
250	\N	0
252	\N	0
256	\N	0
265	\N	0
266	\N	0
267	\N	0
268	\N	0
282	\N	0
284	\N	0
287	\N	0
298	\N	0
299	\N	0
302	\N	0
309	\N	0
310	\N	0
313	\N	0
350	\N	0
354	\N	0
360	\N	0
362	\N	0
368	\N	0
373	\N	0
374	\N	0
376	\N	0
378	\N	0
383	\N	0
392	\N	0
393	\N	0
394	\N	0
398	\N	0
399	\N	0
400	\N	0
404	\N	0
408	\N	0
411	\N	0
413	\N	0
414	\N	0
417	\N	0
418	\N	0
419	\N	0
420	\N	0
421	\N	0
422	\N	0
430	\N	0
437	\N	0
444	\N	0
446	\N	0
452	\N	0
455	\N	0
473	\N	0
474	\N	0
479	\N	0
480	\N	0
483	\N	0
485	\N	0
486	\N	0
487	\N	0
489	\N	0
490	\N	0
491	\N	0
492	\N	0
496	\N	0
499	\N	0
500	\N	0
502	\N	0
503	\N	0
505	\N	0
506	\N	0
507	\N	0
508	\N	0
509	\N	0
510	\N	0
512	\N	0
521	\N	0
526	\N	0
527	\N	0
530	\N	0
533	\N	0
536	\N	0
539	\N	0
542	\N	0
547	\N	0
556	\N	0
562	\N	0
568	\N	0
569	\N	0
570	\N	0
575	\N	0
578	\N	0
579	\N	0
582	\N	0
591	\N	0
594	\N	0
595	\N	0
598	\N	0
601	\N	0
602	\N	0
607	\N	0
608	\N	0
609	\N	0
611	\N	0
617	\N	0
618	\N	0
619	\N	0
624	\N	0
625	\N	0
635	\N	0
637	\N	0
639	\N	0
640	\N	0
646	\N	0
650	\N	0
651	\N	0
654	\N	0
655	\N	0
656	\N	0
659	\N	0
667	\N	0
669	\N	0
671	\N	0
678	\N	0
679	\N	0
684	\N	0
685	\N	0
696	\N	0
699	\N	0
700	\N	0
704	\N	0
705	\N	0
707	\N	0
708	\N	0
716	\N	0
717	\N	0
730	\N	0
736	\N	0
739	\N	0
740	\N	0
742	\N	0
745	\N	0
750	\N	0
751	\N	0
754	\N	0
760	\N	0
763	\N	0
764	\N	0
771	\N	0
772	\N	0
773	\N	0
774	\N	0
780	\N	0
781	\N	0
786	\N	0
788	\N	0
789	\N	0
790	\N	0
793	\N	0
795	\N	0
798	\N	0
803	\N	0
805	\N	0
806	\N	0
811	\N	0
815	\N	0
820	\N	0
824	\N	0
827	\N	0
834	\N	0
840	\N	0
847	\N	0
848	\N	0
849	\N	0
850	\N	0
851	\N	0
853	\N	0
854	\N	0
855	\N	0
860	\N	0
864	\N	0
867	\N	0
868	\N	0
870	\N	0
871	\N	0
878	\N	0
879	\N	0
888	\N	0
889	\N	0
901	\N	0
904	\N	0
905	\N	0
906	\N	0
913	\N	0
914	\N	0
922	\N	0
924	\N	0
925	\N	0
931	\N	0
933	\N	0
938	\N	0
939	\N	0
949	\N	0
952	\N	0
954	\N	0
960	\N	0
962	\N	0
965	\N	0
969	\N	0
973	\N	0
974	\N	0
978	\N	0
979	\N	0
982	\N	0
984	\N	0
985	\N	0
991	\N	0
994	\N	0
995	\N	0
996	\N	0
1005	\N	0
1006	\N	0
1014	\N	0
1017	\N	0
1019	\N	0
1028	\N	0
1031	\N	0
1033	\N	0
1034	\N	0
1035	\N	0
1038	\N	0
1042	\N	0
1043	\N	0
1065	\N	0
1066	\N	0
1081	\N	0
1082	\N	0
1085	\N	0
1086	\N	0
1090	\N	0
1093	\N	0
1094	\N	0
1103	\N	0
1104	\N	0
1115	\N	0
1117	\N	0
1120	\N	0
1121	\N	0
1122	\N	0
1130	\N	0
1132	\N	0
1134	\N	0
1138	\N	0
1140	\N	0
1147	\N	0
1148	\N	0
1152	\N	0
1153	\N	0
1155	\N	0
1162	\N	0
1164	\N	0
1165	\N	0
1168	\N	0
1169	\N	0
1176	\N	0
1177	\N	0
1181	\N	0
1182	\N	0
1189	\N	0
1190	\N	0
1199	\N	0
1200	\N	0
1202	\N	0
1207	\N	0
1211	\N	0
1216	\N	0
1231	\N	0
1232	\N	0
1233	\N	0
1238	\N	0
1240	\N	0
1241	\N	0
1248	\N	0
1251	\N	0
1252	\N	0
1256	\N	0
1264	\N	0
1265	\N	0
1271	\N	0
1273	\N	0
1281	\N	0
1288	\N	0
1289	\N	0
1295	\N	0
1296	\N	0
1297	\N	0
1298	\N	0
1303	\N	0
1308	\N	0
1311	\N	0
1313	\N	0
1320	\N	0
1326	\N	0
1331	\N	0
1337	\N	0
1341	\N	0
1346	\N	0
1353	\N	0
1362	\N	0
1365	\N	0
1372	\N	0
1383	\N	0
1387	\N	0
1388	\N	0
1389	\N	0
1392	\N	0
1395	\N	0
1396	\N	0
1401	\N	0
1407	\N	0
1421	\N	0
1422	\N	0
1431	\N	0
1434	\N	0
1441	\N	0
1443	\N	0
1444	\N	0
1450	\N	0
1451	\N	0
1452	\N	0
1453	\N	0
1455	\N	0
1464	\N	0
1477	\N	0
1478	\N	0
1479	\N	0
1480	\N	0
1482	\N	0
1483	\N	0
1486	\N	0
1487	\N	0
1488	\N	0
1494	\N	0
1498	\N	0
1501	\N	0
1506	\N	0
1512	\N	0
1515	\N	0
1527	\N	0
1534	\N	0
1535	\N	0
1536	\N	0
1539	\N	0
1545	\N	0
1548	\N	0
1566	\N	0
1573	\N	0
1577	\N	0
1578	\N	0
1587	\N	0
1588	\N	0
1595	\N	0
1599	\N	0
1600	\N	0
1604	\N	0
1605	\N	0
1608	\N	0
1612	\N	0
1616	\N	0
1619	\N	0
1625	\N	0
1630	\N	0
1636	\N	0
1639	\N	0
1640	\N	0
1643	\N	0
1645	\N	0
1647	\N	0
1649	\N	0
1651	\N	0
1656	\N	0
1659	\N	0
1663	\N	0
1668	\N	0
1669	\N	0
1670	\N	0
1675	\N	0
1680	\N	0
1686	\N	0
1698	\N	0
1700	\N	0
1706	\N	0
1707	\N	0
1712	\N	0
1716	\N	0
1722	\N	0
1725	\N	0
1729	\N	0
1732	\N	0
1733	\N	0
1738	\N	0
1742	\N	0
1747	\N	0
1752	\N	0
1760	\N	0
1763	\N	0
1764	\N	0
1770	\N	0
1777	\N	0
1778	\N	0
1785	\N	0
1788	\N	0
1789	\N	0
1791	\N	0
1794	\N	0
1795	\N	0
1798	\N	0
1799	\N	0
1800	\N	0
1804	\N	0
1805	\N	0
1809	\N	0
1810	\N	0
1811	\N	0
1817	\N	0
1818	\N	0
1823	\N	0
1827	\N	0
1828	\N	0
1831	\N	0
1836	\N	0
1842	\N	0
1848	\N	0
1850	\N	0
1853	\N	0
1859	\N	0
1864	\N	0
1865	\N	0
1870	\N	0
1871	\N	0
1875	\N	0
1884	\N	0
1897	\N	0
1907	\N	0
1908	\N	0
1910	\N	0
1913	\N	0
1916	\N	0
1917	\N	0
1920	\N	0
1921	\N	0
1922	\N	0
1925	\N	0
1930	\N	0
1932	\N	0
1934	\N	0
1936	\N	0
1941	\N	0
1944	\N	0
1954	\N	0
1955	\N	0
1960	\N	0
1964	\N	0
1969	\N	0
1973	\N	0
1977	\N	0
1979	\N	0
1981	\N	0
1982	\N	0
1983	\N	0
1986	\N	0
1988	\N	0
1989	\N	0
1990	\N	0
1997	\N	0
1998	\N	0
1999	\N	0
2000	\N	0
2002	\N	0
2007	\N	0
2011	\N	0
2019	\N	0
2023	\N	0
2034	\N	0
2035	\N	0
2038	\N	0
2041	\N	0
2044	\N	0
2045	\N	0
2046	\N	0
2048	\N	0
2049	\N	0
2059	\N	0
2068	\N	0
2077	\N	0
2080	\N	0
2087	\N	0
2088	\N	0
2089	\N	0
2090	\N	0
2095	\N	0
2098	\N	0
2101	\N	0
2102	\N	0
2105	\N	0
2108	\N	0
2110	\N	0
2112	\N	0
2113	\N	0
2115	\N	0
2121	\N	0
2122	\N	0
2128	\N	0
2133	\N	0
2134	\N	0
2139	\N	0
2141	\N	0
2150	\N	0
2155	\N	0
2169	\N	0
2170	\N	0
2171	\N	0
2179	\N	0
2183	\N	0
2191	\N	0
2197	\N	0
2213	\N	0
2215	\N	0
2217	\N	0
2220	\N	0
2223	\N	0
2231	\N	0
2246	\N	0
2248	\N	0
2249	\N	0
2252	\N	0
2253	\N	0
2255	\N	0
2257	\N	0
2260	\N	0
2262	\N	0
2263	\N	0
2266	\N	0
2269	\N	0
2273	\N	0
2276	\N	0
2281	\N	0
2285	\N	0
2289	\N	0
2291	\N	0
2295	\N	0
2298	\N	0
2306	\N	0
2309	\N	0
2310	\N	0
2313	\N	0
2319	\N	0
2320	\N	0
2326	\N	0
2327	\N	0
2331	\N	0
2333	\N	0
2336	\N	0
2338	\N	0
2343	\N	0
2352	\N	0
2355	\N	0
2356	\N	0
2358	\N	0
2361	\N	0
2364	\N	0
2369	\N	0
2370	\N	0
2371	\N	0
2376	\N	0
2380	\N	0
2383	\N	0
2388	\N	0
2395	\N	0
2402	\N	0
2406	\N	0
2424	\N	0
2433	\N	0
2434	\N	0
2436	\N	0
2443	\N	0
2447	\N	0
2451	\N	0
2452	\N	0
2457	\N	0
2458	\N	0
2460	\N	0
2466	\N	0
2468	\N	0
2471	\N	0
2474	\N	0
2477	\N	0
2479	\N	0
2484	\N	0
2486	\N	0
2494	\N	0
2497	\N	0
2503	\N	0
2508	\N	0
2509	\N	0
2510	\N	0
2511	\N	0
2512	\N	0
2515	\N	0
2517	\N	0
2521	\N	0
2527	\N	0
2535	\N	0
2538	\N	0
2541	\N	0
2544	\N	0
2547	\N	0
2549	\N	0
2550	\N	0
2554	\N	0
2557	\N	0
2558	\N	0
2560	\N	0
2567	\N	0
2568	\N	0
2572	\N	0
2579	\N	0
2583	\N	0
2585	\N	0
2593	\N	0
2600	\N	0
2618	\N	0
2626	\N	0
2636	\N	0
2641	\N	0
2644	\N	0
2648	\N	0
2650	\N	0
2651	\N	0
2654	\N	0
2657	\N	0
2659	\N	0
2665	\N	0
2670	\N	0
2674	\N	0
2677	\N	0
2678	\N	0
2682	\N	0
2685	\N	0
2687	\N	0
2691	\N	0
2697	\N	0
2704	\N	0
2709	\N	0
2711	\N	0
2714	\N	0
2717	\N	0
2722	\N	0
2723	\N	0
2726	\N	0
2728	\N	0
2732	\N	0
2733	\N	0
2738	\N	0
2741	\N	0
2743	\N	0
2749	\N	0
2754	\N	0
2759	\N	0
2762	\N	0
2765	\N	0
2769	\N	0
2772	\N	0
2776	\N	0
2788	\N	0
2799	\N	0
2800	\N	0
2804	\N	0
2805	\N	0
2806	\N	0
2809	\N	0
2812	\N	0
2816	\N	0
2817	\N	0
2818	\N	0
2820	\N	0
2821	\N	0
2823	\N	0
2824	\N	0
2828	\N	0
2832	\N	0
2834	\N	0
2840	\N	0
2844	\N	0
2847	\N	0
2850	\N	0
2851	\N	0
2853	\N	0
2854	\N	0
2855	\N	0
2858	\N	0
2859	\N	0
2862	\N	0
2867	\N	0
2868	\N	0
2875	\N	0
2878	\N	0
2880	\N	0
2881	\N	0
2884	\N	0
2888	\N	0
2889	\N	0
2891	\N	0
2895	\N	0
2903	\N	0
2909	\N	0
2924	\N	0
2929	\N	0
2930	\N	0
2931	\N	0
2934	\N	0
2935	\N	0
2938	\N	0
2940	\N	0
2941	\N	0
2942	\N	0
2945	\N	0
2946	\N	0
2948	\N	0
2951	\N	0
2952	\N	0
2961	\N	0
2962	\N	0
2966	\N	0
2971	\N	0
2974	\N	0
2976	\N	0
2978	\N	0
2979	\N	0
2981	\N	0
2985	\N	0
2987	\N	0
2988	\N	0
2990	\N	0
2994	\N	0
2997	\N	0
3002	\N	0
3004	\N	0
3005	\N	0
3009	\N	0
3010	\N	0
3013	\N	0
3016	\N	0
3017	\N	0
3020	\N	0
3024	\N	0
3029	\N	0
3032	\N	0
3040	\N	0
3042	\N	0
3045	\N	0
3046	\N	0
3047	\N	0
3048	\N	0
3049	\N	0
3050	\N	0
3051	\N	0
3052	\N	0
3053	\N	0
3054	\N	0
3056	\N	0
3057	\N	0
3059	\N	0
3061	\N	0
3062	\N	0
3065	\N	0
3067	\N	0
3068	\N	0
3069	\N	0
3072	\N	0
3075	\N	0
3077	\N	0
3081	\N	0
3	2	1
6	5	1
10	5	1
11	5	1
22	23	1
32	31	1
41	42	1
58	57	1
68	69	1
73	71	1
74	71	1
75	71	1
87	88	1
95	96	1
98	99	1
102	101	1
106	107	1
120	121	1
125	126	1
134	135	1
136	137	1
138	139	1
140	141	1
148	149	1
156	157	1
159	158	1
162	161	1
166	161	1
168	169	1
172	171	1
181	182	1
187	186	1
192	193	1
206	205	1
218	217	1
222	217	1
233	228	1
234	228	1
235	228	1
236	237	1
243	238	1
246	245	1
251	248	1
253	248	1
255	248	1
263	262	1
264	262	1
274	275	1
276	277	1
278	279	1
280	281	1
283	197	1
285	286	1
293	294	1
296	295	1
297	295	1
300	301	1
312	311	1
314	315	1
361	88	1
364	365	1
367	366	1
369	340	1
370	371	1
375	372	1
377	372	1
379	380	1
381	382	1
389	388	1
390	388	1
391	388	1
397	396	1
402	403	1
410	409	1
415	412	1
416	412	1
423	35	1
424	35	1
425	35	1
426	427	1
428	429	1
436	435	1
438	288	1
439	440	1
441	442	1
447	328	1
453	454	1
461	462	1
463	464	1
465	466	1
467	468	1
469	470	1
472	471	1
475	476	1
478	477	1
481	482	1
484	66	1
493	329	1
494	495	1
498	497	1
501	497	1
511	157	1
513	514	1
515	516	1
517	442	1
518	519	1
522	520	1
523	520	1
525	524	1
528	529	1
531	177	1
532	177	1
534	177	1
538	537	1
540	541	1
543	544	1
546	545	1
548	279	1
553	30	1
554	555	1
563	50	1
564	261	1
565	566	1
574	387	1
576	577	1
580	581	1
583	88	1
588	589	1
590	325	1
593	592	1
596	597	1
599	600	1
610	99	1
612	99	1
613	143	1
614	345	1
616	615	1
631	632	1
634	633	1
636	633	1
638	633	1
648	647	1
649	647	1
653	652	1
657	652	1
658	652	1
665	666	1
668	514	1
670	514	1
677	676	1
680	681	1
683	682	1
690	691	1
692	693	1
695	694	1
698	697	1
714	715	1
722	723	1
724	725	1
726	727	1
728	729	1
737	335	1
741	214	1
744	743	1
752	753	1
762	761	1
769	322	1
779	115	1
792	791	1
796	797	1
804	110	1
812	813	1
814	688	1
825	826	1
831	830	1
832	833	1
841	17	1
842	843	1
845	844	1
846	844	1
852	317	1
861	584	1
862	863	1
865	866	1
869	544	1
872	544	1
885	886	1
890	891	1
892	893	1
897	898	1
899	339	1
900	176	1
903	902	1
912	557	1
918	919	1
930	929	1
932	584	1
945	946	1
948	947	1
950	951	1
953	86	1
959	958	1
966	626	1
968	967	1
970	971	1
975	972	1
976	972	1
977	972	1
981	980	1
988	642	1
989	937	1
990	937	1
993	992	1
997	998	1
999	1000	1
1001	777	1
1002	1003	1
1007	348	1
1008	571	1
1010	1009	1
1012	1011	1
1016	1015	1
1023	876	1
1024	1025	1
1027	1026	1
1030	1029	1
1032	271	1
1036	691	1
1037	691	1
1040	1039	1
1041	1039	1
1072	1073	1
1074	464	1
1077	128	1
1079	1078	1
1080	1078	1
1083	1084	1
1088	1089	1
1091	1092	1
1095	875	1
1096	875	1
1097	1098	1
1099	759	1
1100	1101	1
1105	1106	1
1107	320	1
1109	1108	1
1110	281	1
1111	605	1
1113	1112	1
1116	1057	1
1118	135	1
1119	135	1
1124	1125	1
1127	1126	1
1128	909	1
1131	1129	1
1133	324	1
1135	719	1
1137	1136	1
1139	1060	1
1141	1142	1
1144	1143	1
1146	1145	1
1149	38	1
1150	38	1
1151	38	1
1154	516	1
1161	1160	1
1163	107	1
1167	1166	1
1170	1171	1
1172	1173	1
1175	1174	1
1178	1179	1
1183	126	1
1184	1044	1
1185	1186	1
1187	1188	1
1197	1196	1
1201	116	1
1205	946	1
1206	460	1
1208	1209	1
1210	45	1
1212	1213	1
1215	1214	1
1222	1223	1
1224	1225	1
1230	1055	1
1234	1235	1
1236	199	1
1237	199	1
1239	199	1
1246	1245	1
1247	1245	1
1250	1249	1
1259	1260	1
1261	1262	1
1263	719	1
1270	1269	1
1272	1219	1
1278	1279	1
1283	1282	1
1284	1282	1
1285	482	1
1286	1287	1
1291	279	1
1292	1061	1
1294	1293	1
1309	1310	1
1316	1317	1
1318	1319	1
1327	927	1
1328	1329	1
1330	64	1
1336	1335	1
1338	1192	1
1340	1339	1
1342	371	1
1345	1257	1
1347	1348	1
1354	1355	1
1361	1360	1
1363	1364	1
1373	1071	1
1374	1321	1
1375	1376	1
1379	1380	1
1381	1382	1
1384	143	1
1385	139	1
1386	139	1
1391	1390	1
1400	946	1
1406	1405	1
1423	597	1
1424	1425	1
1428	1429	1
1430	876	1
1432	876	1
1433	464	1
1440	96	1
1442	338	1
1445	1446	1
1447	462	1
1449	1448	1
1454	319	1
1456	1418	1
1460	908	1
1461	1462	1
1463	817	1
1470	27	1
1471	1472	1
1481	1476	1
1484	1485	1
1489	1242	1
1490	1242	1
1491	1242	1
1500	1073	1
1508	1507	1
1509	1507	1
1510	1507	1
1511	458	1
1513	458	1
1514	458	1
1521	1520	1
1523	817	1
1525	1056	1
1532	1413	1
1533	1046	1
1537	1046	1
1538	1046	1
1544	1543	1
1546	1056	1
1547	1056	1
1549	1550	1
1551	316	1
1552	1553	1
1555	1106	1
1556	1557	1
1558	944	1
1559	688	1
1560	180	1
1564	597	1
1569	1570	1
1571	304	1
1572	304	1
1574	1315	1
1575	1315	1
1576	1568	1
1584	881	1
1585	1304	1
1586	153	1
1592	1593	1
1597	784	1
1598	1226	1
1601	1602	1
1606	1059	1
1607	725	1
1609	971	1
1610	725	1
1613	710	1
1614	1156	1
1617	1618	1
1621	1620	1
1622	1620	1
1623	1620	1
1626	753	1
1627	1047	1
1628	1629	1
1631	1632	1
1633	1351	1
1635	1634	1
1638	64	1
1641	119	1
1644	757	1
1646	1226	1
1650	1000	1
1653	693	1
1654	200	1
1655	1583	1
1657	1658	1
1660	839	1
1661	843	1
1667	729	1
1671	710	1
1673	1672	1
1674	1672	1
1679	1419	1
1682	1681	1
1685	759	1
1689	1690	1
1691	921	1
1692	82	1
1693	1244	1
1695	1696	1
1697	1473	1
1699	137	1
1701	176	1
1703	1702	1
1704	1705	1
1710	1711	1
1714	63	1
1715	63	1
1717	1209	1
1721	39	1
1723	1420	1
1724	645	1
1731	1730	1
1736	1737	1
1740	1739	1
1743	1744	1
1754	1753	1
1755	1753	1
1756	808	1
1771	1658	1
1772	1773	1
1776	731	1
1779	1025	1
1780	1781	1
1782	1220	1
1783	1370	1
1784	645	1
1792	289	1
1808	835	1
1814	1813	1
1822	1101	1
1824	552	1
1825	674	1
1826	286	1
1833	1414	1
1834	809	1
1838	1839	1
1840	176	1
1845	1350	1
1846	660	1
1847	1356	1
1849	1356	1
1851	702	1
1857	1709	1
1858	516	1
1860	581	1
1861	1191	1
1863	1862	1
1874	664	1
1880	1568	1
1883	874	1
1885	1225	1
1886	90	1
1889	1319	1
1890	1891	1
1892	27	1
1893	998	1
1894	1266	1
1896	1895	1
1899	1260	1
1901	1902	1
1903	1904	1
1906	1905	1
1912	1768	1
1915	1397	1
1919	1918	1
1923	1003	1
1924	321	1
1926	64	1
1927	1928	1
1929	1191	1
1931	1191	1
1935	1775	1
1937	1775	1
1938	1939	1
1940	1412	1
1942	144	1
1943	144	1
1945	1696	1
1947	1092	1
1949	1334	1
1950	986	1
1951	1952	1
1953	810	1
1956	675	1
1957	746	1
1958	260	1
1961	782	1
1962	129	1
1963	129	1
1966	1965	1
1970	306	1
1974	434	1
1975	434	1
1976	434	1
1985	828	1
1994	449	1
2001	27	1
2013	349	1
2014	92	1
2018	1767	1
2021	957	1
2022	1329	1
2029	1159	1
2030	1159	1
2031	1159	1
2033	2032	1
2036	1355	1
2040	895	1
2058	1055	1
2067	450	1
2071	306	1
2074	552	1
2075	2076	1
2078	1415	1
2079	113	1
2083	2082	1
2084	2082	1
2085	2082	1
2086	1262	1
2093	107	1
2097	2096	1
2099	2096	1
2100	2096	1
2109	347	1
2116	2117	1
2124	2123	1
2130	2129	1
2131	1305	1
2138	333	1
2140	454	1
2148	2147	1
2149	39	1
2153	1473	1
2154	1473	1
2156	768	1
2166	2167	1
2168	2117	1
2172	128	1
2176	1398	1
2180	382	1
2182	1193	1
2184	1193	1
2185	1427	1
2186	1427	1
2187	1427	1
2190	326	1
2192	822	1
2193	822	1
2195	1054	1
2196	555	1
2203	2204	1
2206	2205	1
2207	343	1
2209	821	1
2210	1370	1
2211	1370	1
2214	942	1
2218	1867	1
2221	2061	1
2222	893	1
2224	1855	1
2225	259	1
2230	1581	1
2232	623	1
2233	1568	1
2234	146	1
2236	1050	1
2237	1819	1
2238	323	1
2239	1300	1
2243	2244	1
2250	2251	1
2254	1409	1
2258	327	1
2259	1678	1
2267	180	1
2268	1142	1
2274	2272	1
2275	2272	1
2278	587	1
2280	2279	1
2290	1466	1
2293	332	1
2294	555	1
2297	1274	1
2301	2302	1
2303	720	1
2304	720	1
2305	720	1
2308	1352	1
2311	2312	1
2314	449	1
2317	131	1
2318	155	1
2322	2323	1
2325	2202	1
2332	604	1
2344	2345	1
2347	1711	1
2348	1602	1
2353	20	1
2357	51	1
2362	289	1
2363	289	1
2368	2066	1
2372	468	1
2373	2374	1
2375	2270	1
2379	1466	1
2381	2382	1
2387	2360	1
2392	451	1
2393	113	1
2394	113	1
2396	1310	1
2400	261	1
2403	2404	1
2407	2408	1
2410	30	1
2411	2118	1
2413	2159	1
2414	813	1
2415	2416	1
2417	1829	1
2421	2420	1
2422	2423	1
2429	1186	1
2432	2431	1
2435	466	1
2437	1053	1
2439	1726	1
2440	702	1
2441	46	1
2442	1968	1
2444	585	1
2445	2026	1
2446	2026	1
2448	2449	1
2450	2425	1
2454	2453	1
2455	1517	1
2456	629	1
2459	1416	1
2461	2043	1
2462	1055	1
2463	1475	1
2464	1417	1
2465	341	1
2467	1179	1
2470	2469	1
2475	1382	1
2478	196	1
2482	727	1
2485	2173	1
2488	342	1
2493	1993	1
2496	451	1
2499	2341	1
2502	2142	1
2506	1472	1
2516	1048	1
2522	51	1
2523	203	1
2526	1343	1
2530	336	1
2537	2178	1
2539	629	1
2540	629	1
2545	1068	1
2559	1156	1
2561	2330	1
2564	821	1
2569	1058	1
2573	225	1
2575	2408	1
2576	1664	1
2577	331	1
2578	344	1
2580	29	1
2582	735	1
2596	330	1
2597	819	1
2599	2350	1
2601	1300	1
2604	2065	1
2605	291	1
2608	2060	1
2610	1192	1
2611	2227	1
2615	337	1
2616	1225	1
2621	883	1
2625	1993	1
2627	303	1
2629	819	1
2630	701	1
2631	701	1
2632	701	1
2633	1690	1
2634	2159	1
2635	1274	1
2637	2638	1
2639	2341	1
2640	196	1
2642	711	1
2643	2300	1
2645	1429	1
2646	2491	1
2647	449	1
2649	1052	1
2652	1666	1
2653	50	1
2656	2655	1
2658	20	1
2664	777	1
2667	51	1
2668	2669	1
2672	1503	1
2673	777	1
2675	1737	1
2676	606	1
2680	2679	1
2681	2008	1
2688	642	1
2694	908	1
2695	908	1
2698	1260	1
2702	2051	1
2703	2491	1
2707	1049	1
2710	809	1
2713	196	1
2718	212	1
2724	1098	1
2727	1813	1
2734	585	1
2744	689	1
2745	1419	1
2748	1410	1
2752	2753	1
2755	20	1
2757	2004	1
2760	1459	1
2767	468	1
2768	2158	1
2771	560	1
2775	2145	1
2778	1475	1
2780	84	1
2784	1561	1
2786	1352	1
2787	1092	1
2790	1301	1
2791	47	1
2792	1759	1
2793	1045	1
2795	2228	1
2796	1759	1
2801	1411	1
2803	334	1
2807	2398	1
2808	2662	1
2810	2145	1
2811	1530	1
2813	1351	1
2814	874	1
2815	459	1
2826	1254	1
2827	1254	1
2830	2831	1
2833	29	1
2837	2137	1
2838	2229	1
2864	454	1
2869	1437	1
2873	584	1
2874	1419	1
2893	821	1
2894	2070	1
2896	2063	1
2898	47	1
2900	355	1
2902	272	1
2907	1322	1
2912	290	1
2914	778	1
2916	459	1
2917	2055	1
2918	2244	1
2919	1025	1
2923	1719	1
2932	642	1
2936	433	1
2939	1098	1
2943	936	1
2944	936	1
2947	1602	1
2950	2160	1
2956	2282	1
2957	1591	1
2958	2091	1
2965	1467	1
2967	21	1
2969	2064	1
2970	2612	1
2983	1106	1
3001	2160	1
3003	2926	1
3015	1467	1
3018	2587	1
3026	808	1
3034	346	1
3035	2160	1
3038	1051	1
\.



COPY "Paper" ("ID", "paperID", "rejectedBy", "readByMeta-Reviewer", "hasAuthor", title, "hasDecision", "acceptedBy", "TYPE", "Reviewer") FROM stdin;
505	1687	\N	\N	504	mohairs admiralties bewigged playgoers	\N	\N	2	1485
505	1687	\N	\N	504	mohairs admiralties bewigged playgoers	\N	\N	2	1507
1	987	\N	\N	0	labium peeped daydreams permuting immediately canzona interrelated cooked	\N	\N	2	290
1	987	\N	\N	0	labium peeped daydreams permuting immediately canzona interrelated cooked	\N	\N	2	986
4	3014	\N	\N	641	timbrel presell woodcraft reupholstered xerosis steamers	\N	\N	2	2
4	3014	\N	\N	641	timbrel presell woodcraft reupholstered xerosis steamers	\N	\N	2	642
8	672	\N	\N	674	isolators reducing nethermost nonfiction	\N	\N	2	5
8	672	\N	\N	674	isolators reducing nethermost nonfiction	\N	\N	2	675
9	2542	\N	\N	674	satisfying undamped sharpers forbearer	\N	\N	2	5
9	2542	\N	\N	674	satisfying undamped sharpers forbearer	\N	\N	2	217
12	920	\N	\N	674	neologic intermuscular fobbed transcribed swifters redigesting	\N	\N	2	5
12	920	\N	\N	674	neologic intermuscular fobbed transcribed swifters redigesting	\N	\N	2	217
14	2492	\N	\N	2339	regainers teardown margarins inconvenience triunities	\N	\N	2	137
14	2492	\N	\N	2339	regainers teardown margarins inconvenience triunities	\N	\N	2	581
15	3036	\N	\N	2339	occulters blubberer amenities desecrated	\N	\N	2	137
15	3036	\N	\N	2339	occulters blubberer amenities desecrated	\N	\N	2	581
16	18	\N	\N	21	effulgences coreless tuberculoses environs	\N	\N	2	17
16	18	\N	\N	21	effulgences coreless tuberculoses environs	\N	\N	2	20
25	26	\N	\N	28	sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	27
25	26	\N	\N	28	sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	29
33	3076	\N	\N	273	bounden occulters blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	31
33	3076	\N	\N	273	bounden occulters blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	998
34	37	\N	\N	36	danker raunchiness perspicuously disjoined	\N	\N	2	35
34	37	\N	\N	36	danker raunchiness perspicuously disjoined	\N	\N	2	39
43	44	\N	\N	48	firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	45
43	44	\N	\N	48	firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	47
49	52	\N	\N	53	dissociated heartier petitionee brill	\N	\N	2	50
49	52	\N	\N	53	dissociated heartier petitionee brill	\N	\N	2	51
59	1746	\N	\N	587	latchets inflecting trephines hops exec junketeers isolators reducing	\N	\N	2	57
59	1746	\N	\N	587	latchets inflecting trephines hops exec junketeers isolators reducing	\N	\N	2	584
62	65	\N	\N	66	evasiveness toto teashop reaccepts gunneries exorcises pirog desexes	\N	\N	2	63
62	65	\N	\N	66	evasiveness toto teashop reaccepts gunneries exorcises pirog desexes	\N	\N	2	64
72	2777	\N	\N	337	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	71
72	2777	\N	\N	337	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	2469
76	1816	\N	\N	749	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	1000
76	1816	\N	\N	749	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	1427
77	1280	\N	\N	337	interrelated cooked reformers goodwife technicolor plenishes nippy	\N	\N	2	71
77	1280	\N	\N	337	interrelated cooked reformers goodwife technicolor plenishes nippy	\N	\N	2	727
78	2430	\N	\N	337	cancels debiting parrots paraguayans resonates overbites	\N	\N	2	71
78	2430	\N	\N	337	cancels debiting parrots paraguayans resonates overbites	\N	\N	2	727
80	2848	\N	\N	749	outflanking funnyman commuted lachrymation floweret arcadian acridities	\N	\N	2	1000
80	2848	\N	\N	749	outflanking funnyman commuted lachrymation floweret arcadian acridities	\N	\N	2	1427
81	85	\N	\N	82	teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	84
81	85	\N	\N	82	teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	86
89	94	\N	\N	91	bigamistic furrows eloquence cobwebbier divorcing incidentally retorts insoles stockman	\N	\N	2	90
89	94	\N	\N	91	bigamistic furrows eloquence cobwebbier divorcing incidentally retorts insoles stockman	\N	\N	2	92
103	2175	\N	\N	1255	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	101
103	2175	\N	\N	1255	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	2173
105	202	\N	\N	104	agric proliferating disintegrator oblongish leapfrogged overabundant legworks	\N	\N	2	200
105	202	\N	\N	104	agric proliferating disintegrator oblongish leapfrogged overabundant legworks	\N	\N	2	203
108	109	\N	\N	111	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	110
108	109	\N	\N	111	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	113
114	117	\N	\N	116	nonliving agric proliferating disintegrator oblongish leapfrogged	\N	\N	2	115
114	117	\N	\N	116	nonliving agric proliferating disintegrator oblongish leapfrogged	\N	\N	2	119
124	2120	\N	\N	123	hearings legation subendorsed hippocampus miscalculates	\N	\N	2	476
124	2120	\N	\N	123	hearings legation subendorsed hippocampus miscalculates	\N	\N	2	2118
127	132	\N	\N	130	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	128
127	132	\N	\N	130	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments	\N	\N	2	129
142	145	\N	\N	146	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	143
142	145	\N	\N	146	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	144
151	152	\N	\N	155	gaudiness irades inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	88
151	152	\N	\N	155	gaudiness irades inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	153
160	2883	\N	\N	2624	majors manifestly decaffeinates scalepan folklorists attractive yeller cognizably	\N	\N	2	158
160	2883	\N	\N	2624	majors manifestly decaffeinates scalepan folklorists attractive yeller cognizably	\N	\N	2	1417
164	2825	\N	\N	346	preheats loggias reconciliating photocatalyst lenity tautological jambing	\N	\N	2	161
164	2825	\N	\N	346	preheats loggias reconciliating photocatalyst lenity tautological jambing	\N	\N	2	180
165	783	\N	\N	782	intermuscular fobbed transcribed swifters redigesting	\N	\N	2	177
165	783	\N	\N	782	intermuscular fobbed transcribed swifters redigesting	\N	\N	2	784
167	1371	\N	\N	346	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	161
167	1371	\N	\N	346	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	180
173	2885	\N	\N	2886	leviathans misadvised tiltyard numberable yawing prosecutrices	\N	\N	2	149
173	2885	\N	\N	2886	leviathans misadvised tiltyard numberable yawing prosecutrices	\N	\N	2	171
175	178	\N	\N	179	oralogy tibetans slavishly hipless prs	\N	\N	2	176
175	178	\N	\N	179	oralogy tibetans slavishly hipless prs	\N	\N	2	177
185	2959	\N	\N	184	succories dwelling scrapped prat islanded burlily thanklessly	\N	\N	2	743
185	2959	\N	\N	184	succories dwelling scrapped prat islanded burlily thanklessly	\N	\N	2	1593
188	2908	\N	\N	2235	unitarians reevaluate rekeys ochroid climatotherapy crocks carpetbag	\N	\N	2	186
188	2908	\N	\N	2235	unitarians reevaluate rekeys ochroid climatotherapy crocks carpetbag	\N	\N	2	1061
190	2666	\N	\N	189	islanded burlily thanklessly swiveled polers oinked apnea maxillary dumpers	\N	\N	2	1108
190	2666	\N	\N	189	islanded burlily thanklessly swiveled polers oinked apnea maxillary dumpers	\N	\N	2	1142
191	2705	\N	\N	189	pirog desexes summable heliocentricity excretions recelebrating	\N	\N	2	1084
191	2705	\N	\N	189	pirog desexes summable heliocentricity excretions recelebrating	\N	\N	2	1142
194	198	\N	\N	195	stollens ponderers conditione loathly cancels debiting	\N	\N	2	196
194	198	\N	\N	195	stollens ponderers conditione loathly cancels debiting	\N	\N	2	197
207	224	\N	\N	226	succulently marquise underlaid neurosurgeon	\N	\N	2	205
207	224	\N	\N	226	succulently marquise underlaid neurosurgeon	\N	\N	2	225
210	3078	\N	\N	1476	napoleons rifer splinting surmisers	\N	\N	2	107
210	3078	\N	\N	1476	napoleons rifer splinting surmisers	\N	\N	2	1739
211	216	\N	\N	215	jigsawed kickstands prated songstresses	\N	\N	2	212
211	216	\N	\N	215	jigsawed kickstands prated songstresses	\N	\N	2	214
220	1075	\N	\N	674	stollens ponderers conditione loathly cancels	\N	\N	2	30
220	1075	\N	\N	674	stollens ponderers conditione loathly cancels	\N	\N	2	777
221	2849	\N	\N	674	daydreams permuting immediately canzona interrelated cooked	\N	\N	2	30
221	2849	\N	\N	674	daydreams permuting immediately canzona interrelated cooked	\N	\N	2	777
229	2037	\N	\N	337	anesthetization undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	228
506	3023	\N	\N	504	terminals giros podgy vagus kinkiest	\N	\N	2	1101
229	2037	\N	\N	337	anesthetization undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	1225
231	2324	\N	\N	337	lenity tautological jambing sodality outcrop slipcases	\N	\N	2	228
231	2324	\N	\N	337	lenity tautological jambing sodality outcrop slipcases	\N	\N	2	1702
232	3019	\N	\N	337	swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	228
232	3019	\N	\N	337	swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	1225
239	2340	\N	\N	238	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	1279
239	2340	\N	\N	238	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	2341
240	2602	\N	\N	816	prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	238
240	2602	\N	\N	816	prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1664
241	2337	\N	\N	238	thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	1602
241	2337	\N	\N	238	thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	1690
242	2524	\N	\N	238	technicolor plenishes nippy bounden occulters blubberer	\N	\N	2	1223
242	2524	\N	\N	238	technicolor plenishes nippy bounden occulters blubberer	\N	\N	2	2341
244	2401	\N	\N	238	yabber reprovingly blungers dwarflike effulgences	\N	\N	2	1602
244	2401	\N	\N	238	yabber reprovingly blungers dwarflike effulgences	\N	\N	2	1690
247	1497	\N	\N	1496	forfends voucherable intercepting jeered immunopathology	\N	\N	2	245
247	1497	\N	\N	1496	forfends voucherable intercepting jeered immunopathology	\N	\N	2	980
249	2146	\N	\N	1071	subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	248
249	2146	\N	\N	1071	subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	2145
250	2378	\N	\N	1070	margarins inconvenience triunities dipped votarists	\N	\N	2	248
250	2378	\N	\N	1070	margarins inconvenience triunities dipped votarists	\N	\N	2	1213
252	2696	\N	\N	1071	dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	248
252	2696	\N	\N	1071	dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	2145
256	258	\N	\N	259	gasogenes obnoxiously dismounting endorser libations harrower claymores	\N	\N	2	260
256	258	\N	\N	259	gasogenes obnoxiously dismounting endorser libations harrower claymores	\N	\N	2	261
265	2240	\N	\N	2241	nonliving agric proliferating disintegrator oblongish leapfrogged overabundant	\N	\N	2	262
265	2240	\N	\N	2241	nonliving agric proliferating disintegrator oblongish leapfrogged overabundant	\N	\N	2	830
266	2335	\N	\N	2241	zinged fridge stained unintentional	\N	\N	2	262
266	2335	\N	\N	2241	zinged fridge stained unintentional	\N	\N	2	1939
268	269	\N	\N	273	outpoured dissociated heartier petitionee brill neologic intermuscular	\N	\N	2	271
268	269	\N	\N	273	outpoured dissociated heartier petitionee brill neologic intermuscular	\N	\N	2	272
284	2865	\N	\N	1594	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	1260
284	2865	\N	\N	1594	miscalling firefanged skeins equalled sandwiching bewitchment cheaters	\N	\N	2	1744
287	292	\N	\N	290	tetrachlorides loutish polygony malines	\N	\N	2	288
287	292	\N	\N	290	tetrachlorides loutish polygony malines	\N	\N	2	289
298	3074	\N	\N	336	nonspecialized vrouw squads tantalums	\N	\N	2	295
298	3074	\N	\N	336	nonspecialized vrouw squads tantalums	\N	\N	2	2158
299	2598	\N	\N	336	embrocation casteless uroliths sashes marrieds fungic	\N	\N	2	295
299	2598	\N	\N	336	embrocation casteless uroliths sashes marrieds fungic	\N	\N	2	863
302	307	\N	\N	303	coadjutors thuggeries nondestructive maladjustments	\N	\N	2	304
302	307	\N	\N	303	coadjutors thuggeries nondestructive maladjustments	\N	\N	2	306
309	2514	\N	\N	308	neurosurgeon innervated hunts barrens emanative blowpipe varies thickest machinability	\N	\N	2	1257
309	2514	\N	\N	308	neurosurgeon innervated hunts barrens emanative blowpipe varies thickest machinability	\N	\N	2	1965
310	894	\N	\N	308	bedstraws thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	42
310	894	\N	\N	308	bedstraws thoughtless elation swampland earings circumscribed paralyzingly	\N	\N	2	895
313	2904	\N	\N	2500	overweight readmits loopholing tattles	\N	\N	2	311
313	2904	\N	\N	2500	overweight readmits loopholing tattles	\N	\N	2	328
350	351	\N	\N	353	overabundant legworks easeful cognize hoatzin toiled nonspecialized vrouw	\N	\N	2	237
350	351	\N	\N	353	overabundant legworks easeful cognize hoatzin toiled nonspecialized vrouw	\N	\N	2	330
354	356	\N	\N	358	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	343
354	356	\N	\N	358	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	355
360	1832	\N	\N	1821	refocus vividness administrated remedying prophetically allayed zinged fridge	\N	\N	2	336
360	1832	\N	\N	1821	refocus vividness administrated remedying prophetically allayed zinged fridge	\N	\N	2	1629
362	363	\N	\N	130	safest signiory latchets inflecting trephines hops exec	\N	\N	2	128
362	363	\N	\N	130	safest signiory latchets inflecting trephines hops exec	\N	\N	2	129
368	2010	\N	\N	2009	overweight readmits loopholing tattles irradiates	\N	\N	2	366
368	2010	\N	\N	2009	overweight readmits loopholing tattles irradiates	\N	\N	2	2008
373	1358	\N	\N	1357	amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1329
373	1358	\N	\N	1357	amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1356
374	2288	\N	\N	348	plights corollaries gaudiness irades inadvisability	\N	\N	2	372
374	2288	\N	\N	348	plights corollaries gaudiness irades inadvisability	\N	\N	2	1711
376	2922	\N	\N	348	dissociated heartier petitionee brill	\N	\N	2	372
376	2922	\N	\N	348	dissociated heartier petitionee brill	\N	\N	2	1711
383	386	\N	\N	384	inserter plights corollaries gaudiness irades	\N	\N	2	333
383	386	\N	\N	384	inserter plights corollaries gaudiness irades	\N	\N	2	387
392	2758	\N	\N	1302	kinkiest xix recollected householder overeducated objurgate treaties	\N	\N	2	388
392	2758	\N	\N	1302	kinkiest xix recollected householder overeducated objurgate treaties	\N	\N	2	1300
393	2671	\N	\N	1730	playgoers cheques batting waspishly stilbestrol	\N	\N	2	388
393	2671	\N	\N	1730	playgoers cheques batting waspishly stilbestrol	\N	\N	2	2229
394	1299	\N	\N	1302	pirog desexes summable heliocentricity excretions	\N	\N	2	388
394	1299	\N	\N	1302	pirog desexes summable heliocentricity excretions	\N	\N	2	1300
398	1694	\N	\N	1217	decaffeinates scalepan folklorists attractive yeller cognizably reminds	\N	\N	2	876
398	1694	\N	\N	1217	decaffeinates scalepan folklorists attractive yeller cognizably reminds	\N	\N	2	1355
399	2316	\N	\N	2315	pasturage thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter	\N	\N	2	396
399	2316	\N	\N	2315	pasturage thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter	\N	\N	2	1553
400	2614	\N	\N	1217	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	876
400	2614	\N	\N	1217	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	1355
404	406	\N	\N	28	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly	\N	\N	2	337
404	406	\N	\N	28	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly	\N	\N	2	380
408	1844	\N	\N	407	blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	345
408	1844	\N	\N	407	blubberer amenities desecrated tetrachlorides loutish	\N	\N	2	676
411	1314	\N	\N	802	preprocessor despising loftily yabber reprovingly	\N	\N	2	409
411	1314	\N	\N	802	preprocessor despising loftily yabber reprovingly	\N	\N	2	1315
413	2802	\N	\N	53	venturers valiantly unremorsefully extradites	\N	\N	2	412
413	2802	\N	\N	53	venturers valiantly unremorsefully extradites	\N	\N	2	1245
414	1368	\N	\N	1369	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	1098
414	1368	\N	\N	1369	splinting surmisers satisfying undamped sharpers forbearer anesthetization undermentioned outflanking	\N	\N	2	1370
417	2774	\N	\N	1369	petitionee brill neologic intermuscular fobbed	\N	\N	2	1098
417	2774	\N	\N	1369	petitionee brill neologic intermuscular fobbed	\N	\N	2	1370
418	2039	\N	\N	53	nigglings midmonths labium peeped daydreams	\N	\N	2	412
418	2039	\N	\N	53	nigglings midmonths labium peeped daydreams	\N	\N	2	1245
419	2546	\N	\N	587	skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular fobbed	\N	\N	2	584
419	2546	\N	\N	587	skimpiest outpoured dissociated heartier petitionee brill neologic intermuscular fobbed	\N	\N	2	585
420	586	\N	\N	587	riffled kerneling napoleons rifer splinting surmisers satisfying	\N	\N	2	584
420	586	\N	\N	587	riffled kerneling napoleons rifer splinting surmisers satisfying	\N	\N	2	585
421	2472	\N	\N	36	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	\N	\N	2	35
421	2472	\N	\N	36	outcrop slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens	\N	\N	2	39
422	2551	\N	\N	36	yabber reprovingly blungers dwarflike	\N	\N	2	35
422	2551	\N	\N	36	yabber reprovingly blungers dwarflike	\N	\N	2	2202
430	431	\N	\N	433	wastebaskets powderer immigrates inserter plights	\N	\N	2	157
430	431	\N	\N	433	wastebaskets powderer immigrates inserter plights	\N	\N	2	434
437	3058	\N	\N	1591	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	\N	\N	2	51
437	3058	\N	\N	1591	arcadian acridities unrealistic substituting surges preheats loggias reconciliating photocatalyst	\N	\N	2	435
444	1967	\N	\N	1369	substituting surges preheats loggias	\N	\N	2	1098
444	1967	\N	\N	1369	substituting surges preheats loggias	\N	\N	2	1968
446	2284	\N	\N	405	nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	1011
446	2284	\N	\N	405	nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	1225
455	456	\N	\N	457	slavishly hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	458
455	456	\N	\N	457	slavishly hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	459
473	2307	\N	\N	2189	transcribed swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	471
473	2307	\N	\N	2189	transcribed swifters redigesting ostinato recalculation safest signiory latchets inflecting	\N	\N	2	1350
479	2766	\N	\N	1458	polygony malines cliffhanger entailments reindexed bedstraws	\N	\N	2	403
479	2766	\N	\N	1458	polygony malines cliffhanger entailments reindexed bedstraws	\N	\N	2	477
483	2391	\N	\N	66	resonates overbites terminals giros	\N	\N	2	63
483	2391	\N	\N	66	resonates overbites terminals giros	\N	\N	2	64
485	2042	\N	\N	66	bewitchment cheaters riffled kerneling napoleons rifer splinting	\N	\N	2	1174
485	2042	\N	\N	66	bewitchment cheaters riffled kerneling napoleons rifer splinting	\N	\N	2	2043
486	1022	\N	\N	1020	undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	66
486	1022	\N	\N	1020	undermentioned outflanking funnyman commuted lachrymation	\N	\N	2	316
489	2686	\N	\N	488	trephines hops exec junketeers isolators reducing	\N	\N	2	1348
489	2686	\N	\N	488	trephines hops exec junketeers isolators reducing	\N	\N	2	2065
490	3080	\N	\N	488	blowpipe varies thickest machinability orbiters tormentor owner	\N	\N	2	96
490	3080	\N	\N	488	blowpipe varies thickest machinability orbiters tormentor owner	\N	\N	2	1055
491	2897	\N	\N	488	circumscribed paralyzingly pouchy surrejoinders chestiest measurage	\N	\N	2	606
491	2897	\N	\N	488	circumscribed paralyzingly pouchy surrejoinders chestiest measurage	\N	\N	2	1055
492	1909	\N	\N	488	nigglings midmonths labium peeped daydreams permuting	\N	\N	2	96
492	1909	\N	\N	488	nigglings midmonths labium peeped daydreams permuting	\N	\N	2	1055
499	2106	\N	\N	1204	safest signiory latchets inflecting trephines hops	\N	\N	2	139
499	2106	\N	\N	1204	safest signiory latchets inflecting trephines hops	\N	\N	2	497
500	2995	\N	\N	2152	mohairs admiralties bewigged playgoers cheques	\N	\N	2	442
500	2995	\N	\N	2152	mohairs admiralties bewigged playgoers cheques	\N	\N	2	2082
502	3066	\N	\N	1204	commuted lachrymation floweret arcadian acridities	\N	\N	2	139
502	3066	\N	\N	1204	commuted lachrymation floweret arcadian acridities	\N	\N	2	497
503	2151	\N	\N	2152	blungers dwarflike effulgences coreless tuberculoses environs hulled	\N	\N	2	442
503	2151	\N	\N	2152	blungers dwarflike effulgences coreless tuberculoses environs hulled	\N	\N	2	2082
506	3023	\N	\N	504	terminals giros podgy vagus kinkiest	\N	\N	2	1507
507	2584	\N	\N	504	phenylketonuria grunts venturers valiantly unremorsefully	\N	\N	2	520
507	2584	\N	\N	504	phenylketonuria grunts venturers valiantly unremorsefully	\N	\N	2	1829
508	2412	\N	\N	504	floweret arcadian acridities unrealistic substituting surges	\N	\N	2	21
508	2412	\N	\N	504	floweret arcadian acridities unrealistic substituting surges	\N	\N	2	1730
509	2047	\N	\N	504	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions	\N	\N	2	1101
509	2047	\N	\N	504	teashop reaccepts gunneries exorcises pirog desexes summable heliocentricity excretions	\N	\N	2	1507
512	3060	\N	\N	433	administrated remedying prophetically allayed zinged fridge	\N	\N	2	157
512	3060	\N	\N	433	administrated remedying prophetically allayed zinged fridge	\N	\N	2	434
521	2852	\N	\N	21	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	520
521	2852	\N	\N	21	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	1301
526	2481	\N	\N	524	demarcators tasselling crocked wharfinger reconverting washboards overdrank recalculations	\N	\N	2	1390
526	2481	\N	\N	524	demarcators tasselling crocked wharfinger reconverting washboards overdrank recalculations	\N	\N	2	1425
527	2920	\N	\N	1123	mendelism kookiest leavening embrocation casteless	\N	\N	2	321
527	2920	\N	\N	1123	mendelism kookiest leavening embrocation casteless	\N	\N	2	524
533	2296	\N	\N	179	villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled	\N	\N	2	176
533	2296	\N	\N	179	villainousness miscalling firefanged skeins equalled sandwiching bewitchment cheaters riffled	\N	\N	2	177
536	2591	\N	\N	535	dissociative apostacy malting footgear abominators trilobate jigsawed kickstands prated	\N	\N	2	1009
536	2591	\N	\N	535	dissociative apostacy malting footgear abominators trilobate jigsawed kickstands prated	\N	\N	2	1045
539	550	\N	\N	549	addends surveiled wagers joysticks nonliving agric	\N	\N	2	537
539	550	\N	\N	549	addends surveiled wagers joysticks nonliving agric	\N	\N	2	552
547	2518	\N	\N	146	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	143
547	2518	\N	\N	146	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	545
556	559	\N	\N	558	thanklessly swiveled polers oinked	\N	\N	2	557
556	559	\N	\N	558	thanklessly swiveled polers oinked	\N	\N	2	560
568	1563	\N	\N	1562	uroliths sashes marrieds fungic gasogenes obnoxiously	\N	\N	2	1143
568	1563	\N	\N	1562	uroliths sashes marrieds fungic gasogenes obnoxiously	\N	\N	2	1561
570	573	\N	\N	195	waspishly stilbestrol villainousness miscalling firefanged skeins	\N	\N	2	199
570	573	\N	\N	195	waspishly stilbestrol villainousness miscalling firefanged skeins	\N	\N	2	571
591	2613	\N	\N	1596	obnoxiously dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	325
591	2613	\N	\N	1596	obnoxiously dismounting endorser libations harrower claymores shiftlessly	\N	\N	2	2612
594	2963	\N	\N	316	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N	\N	2	64
594	2963	\N	\N	316	embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques batting	\N	\N	2	2063
595	1492	\N	\N	48	lenity tautological jambing sodality	\N	\N	2	47
595	1492	\N	\N	48	lenity tautological jambing sodality	\N	\N	2	592
602	603	\N	\N	345	junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	604
602	603	\N	\N	345	junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	605
607	1718	\N	\N	1720	signiory latchets inflecting trephines hops	\N	\N	2	1570
607	1718	\N	\N	1720	signiory latchets inflecting trephines hops	\N	\N	2	1719
608	2532	\N	\N	2533	innervated hunts barrens emanative blowpipe varies	\N	\N	2	99
608	2532	\N	\N	2533	innervated hunts barrens emanative blowpipe varies	\N	\N	2	1472
609	2590	\N	\N	2533	danker raunchiness perspicuously disjoined nigglings	\N	\N	2	99
609	2590	\N	\N	2533	danker raunchiness perspicuously disjoined nigglings	\N	\N	2	1472
611	2143	\N	\N	1839	reindexed bedstraws thoughtless elation swampland	\N	\N	2	99
611	2143	\N	\N	1839	reindexed bedstraws thoughtless elation swampland	\N	\N	2	2142
617	1652	\N	\N	558	waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	301
617	1652	\N	\N	558	waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	615
618	687	\N	\N	686	heliocentricity excretions recelebrating dually plateauing reoccupations embossers	\N	\N	2	688
618	687	\N	\N	686	heliocentricity excretions recelebrating dually plateauing reoccupations embossers	\N	\N	2	689
619	621	\N	\N	622	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	541
619	621	\N	\N	622	irades inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	623
625	630	\N	\N	628	stollens ponderers conditione loathly	\N	\N	2	626
625	630	\N	\N	628	stollens ponderers conditione loathly	\N	\N	2	629
635	2736	\N	\N	917	petitionee brill neologic intermuscular	\N	\N	2	633
635	2736	\N	\N	917	petitionee brill neologic intermuscular	\N	\N	2	2679
637	2715	\N	\N	917	cheques batting waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	633
637	2715	\N	\N	917	cheques batting waspishly stilbestrol villainousness miscalling firefanged	\N	\N	2	1475
639	1474	\N	\N	917	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	633
639	1474	\N	\N	917	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	1475
640	643	\N	\N	641	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting	\N	\N	2	642
640	643	\N	\N	641	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting	\N	\N	2	645
650	2015	\N	\N	272	amenities desecrated tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	647
650	2015	\N	\N	272	amenities desecrated tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	723
651	2712	\N	\N	272	labium peeped daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	647
651	2712	\N	\N	272	labium peeped daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	1773
654	1457	\N	\N	1458	tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	652
654	1457	\N	\N	1458	tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	1059
655	2842	\N	\N	403	corkscrewed promiscuousness clewed reassemble hesitation fainting croupy bacchanalia regainers	\N	\N	2	652
655	2842	\N	\N	403	corkscrewed promiscuousness clewed reassemble hesitation fainting croupy bacchanalia regainers	\N	\N	2	729
656	1063	\N	\N	403	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	652
656	1063	\N	\N	403	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	729
659	662	\N	\N	663	decentralizing hogfishes gantleted richer succories	\N	\N	2	660
659	662	\N	\N	663	decentralizing hogfishes gantleted richer succories	\N	\N	2	664
667	2194	\N	\N	327	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	514
667	2194	\N	\N	327	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	1672
669	1972	\N	\N	327	zinged fridge stained unintentional antiquarians dilutes quantitatively	\N	\N	2	514
669	1972	\N	\N	327	zinged fridge stained unintentional antiquarians dilutes quantitatively	\N	\N	2	1672
671	1856	\N	\N	327	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	514
671	1856	\N	\N	327	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	1855
678	2025	\N	\N	676	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	\N	\N	2	1003
678	2025	\N	\N	676	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble	\N	\N	2	2026
679	2797	\N	\N	676	daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	1003
679	2797	\N	\N	676	daydreams permuting immediately canzona interrelated cooked reformers	\N	\N	2	2026
684	2069	\N	\N	2070	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	\N	\N	2	516
684	2069	\N	\N	2070	peeped daydreams permuting immediately canzona interrelated cooked reformers goodwife	\N	\N	2	682
696	1749	\N	\N	1750	reaccepts gunneries exorcises pirog desexes	\N	\N	2	694
696	1749	\N	\N	1750	reaccepts gunneries exorcises pirog desexes	\N	\N	2	1310
699	1841	\N	\N	1214	crocked wharfinger reconverting washboards overdrank	\N	\N	2	666
699	1841	\N	\N	1214	crocked wharfinger reconverting washboards overdrank	\N	\N	2	697
700	703	\N	\N	146	wastebaskets powderer immigrates inserter	\N	\N	2	701
700	703	\N	\N	146	wastebaskets powderer immigrates inserter	\N	\N	2	702
707	2594	\N	\N	706	maladjustments subpartnership cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	1015
707	2594	\N	\N	706	maladjustments subpartnership cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	2312
708	709	\N	\N	712	daydreams permuting immediately canzona	\N	\N	2	710
708	709	\N	\N	712	daydreams permuting immediately canzona	\N	\N	2	711
717	718	\N	\N	346	waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	\N	\N	2	719
717	718	\N	\N	346	waspishly stilbestrol villainousness miscalling firefanged skeins equalled sandwiching	\N	\N	2	720
730	732	\N	\N	733	inconvenience triunities dipped votarists kilogram	\N	\N	2	731
730	732	\N	\N	733	inconvenience triunities dipped votarists kilogram	\N	\N	2	735
739	2489	\N	\N	2490	cartons acquirable refocus vividness administrated	\N	\N	2	482
739	2489	\N	\N	2490	cartons acquirable refocus vividness administrated	\N	\N	2	2491
740	2628	\N	\N	2490	thurifer teazle fringier rhythmical	\N	\N	2	482
740	2628	\N	\N	2490	thurifer teazle fringier rhythmical	\N	\N	2	2491
745	748	\N	\N	290	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	291
745	748	\N	\N	290	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	746
750	1426	\N	\N	749	unknowns mongoloids danker raunchiness perspicuously disjoined	\N	\N	2	1196
750	1426	\N	\N	749	unknowns mongoloids danker raunchiness perspicuously disjoined	\N	\N	2	1427
754	758	\N	\N	755	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	757
754	758	\N	\N	755	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	759
763	1802	\N	\N	182	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	761
763	1802	\N	\N	182	outpoured dissociated heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	1620
764	765	\N	\N	767	disinclines antonyms anesthetize chanticleer administrants preengaging	\N	\N	2	315
764	765	\N	\N	767	disinclines antonyms anesthetize chanticleer administrants preengaging	\N	\N	2	768
771	1349	\N	\N	770	succulently marquise underlaid neurosurgeon innervated	\N	\N	2	1351
771	1349	\N	\N	770	succulently marquise underlaid neurosurgeon innervated	\N	\N	2	1352
772	2409	\N	\N	2189	canzona interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	1397
772	2409	\N	\N	2189	canzona interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	1839
773	1499	\N	\N	770	retrogressions eliminates unknowns mongoloids	\N	\N	2	1351
773	1499	\N	\N	770	retrogressions eliminates unknowns mongoloids	\N	\N	2	1352
774	776	\N	\N	775	loggias reconciliating photocatalyst lenity tautological	\N	\N	2	27
774	776	\N	\N	775	loggias reconciliating photocatalyst lenity tautological	\N	\N	2	778
786	2857	\N	\N	785	cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	429
786	2857	\N	\N	785	cordilleras recirculations alkalin succulently marquise underlaid neurosurgeon	\N	\N	2	1416
788	2989	\N	\N	787	evasiveness toto teashop reaccepts	\N	\N	2	1550
788	2989	\N	\N	787	evasiveness toto teashop reaccepts	\N	\N	2	1737
789	2283	\N	\N	787	gantleted richer succories dwelling scrapped prat	\N	\N	2	1737
789	2283	\N	\N	787	gantleted richer succories dwelling scrapped prat	\N	\N	2	2282
793	1229	\N	\N	1228	rebroadcasting grousing overdrinking frow demarcators tasselling crocked	\N	\N	2	791
793	1229	\N	\N	1228	rebroadcasting grousing overdrinking frow demarcators tasselling crocked	\N	\N	2	1226
795	3037	\N	\N	1468	hesitation fainting croupy bacchanalia regainers teardown margarins inconvenience	\N	\N	2	339
795	3037	\N	\N	1468	hesitation fainting croupy bacchanalia regainers teardown margarins inconvenience	\N	\N	2	2374
798	799	\N	\N	800	refocus vividness administrated remedying prophetically allayed zinged fridge stained	\N	\N	2	121
798	799	\N	\N	800	refocus vividness administrated remedying prophetically allayed zinged fridge stained	\N	\N	2	552
803	2892	\N	\N	802	redigesting ostinato recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	146
803	2892	\N	\N	802	redigesting ostinato recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	1891
806	807	\N	\N	810	cliffhanger entailments reindexed bedstraws thoughtless	\N	\N	2	808
806	807	\N	\N	810	cliffhanger entailments reindexed bedstraws thoughtless	\N	\N	2	809
815	818	\N	\N	816	unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	817
815	818	\N	\N	816	unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	819
820	823	\N	\N	23	latchets inflecting trephines hops exec	\N	\N	2	464
820	823	\N	\N	23	latchets inflecting trephines hops exec	\N	\N	2	821
827	829	\N	\N	146	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	701
827	829	\N	\N	146	danker raunchiness perspicuously disjoined nigglings midmonths	\N	\N	2	828
834	837	\N	\N	838	orbiters tormentor owner zanier corkscrewed promiscuousness	\N	\N	2	835
834	837	\N	\N	838	orbiters tormentor owner zanier corkscrewed promiscuousness	\N	\N	2	839
847	2751	\N	\N	349	nethermost nonfiction retrogressions eliminates unknowns	\N	\N	2	275
847	2751	\N	\N	349	nethermost nonfiction retrogressions eliminates unknowns	\N	\N	2	458
848	2292	\N	\N	349	immediately canzona interrelated cooked reformers	\N	\N	2	462
848	2292	\N	\N	349	immediately canzona interrelated cooked reformers	\N	\N	2	844
849	2860	\N	\N	349	overeducated objurgate treaties preprocessor	\N	\N	2	844
849	2860	\N	\N	349	overeducated objurgate treaties preprocessor	\N	\N	2	2753
850	1157	\N	\N	226	vitric mendelism kookiest leavening embrocation casteless uroliths sashes marrieds	\N	\N	2	1156
850	1157	\N	\N	226	vitric mendelism kookiest leavening embrocation casteless uroliths sashes marrieds	\N	\N	2	1159
851	1554	\N	\N	226	decaffeinates scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	1156
851	1554	\N	\N	226	decaffeinates scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	1159
853	2271	\N	\N	317	loathly cancels debiting parrots paraguayans	\N	\N	2	693
853	2271	\N	\N	317	loathly cancels debiting parrots paraguayans	\N	\N	2	1269
854	1540	\N	\N	1542	preexamination oralogy tibetans slavishly hipless	\N	\N	2	317
854	1540	\N	\N	1542	preexamination oralogy tibetans slavishly hipless	\N	\N	2	810
855	857	\N	\N	195	recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	199
855	857	\N	\N	195	recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	279
868	1820	\N	\N	270	trephines hops exec junketeers	\N	\N	2	544
868	1820	\N	\N	270	trephines hops exec junketeers	\N	\N	2	1819
870	3027	\N	\N	270	effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	544
870	3027	\N	\N	270	effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	1429
871	2991	\N	\N	270	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	\N	\N	2	544
871	2991	\N	\N	270	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils	\N	\N	2	1429
878	2841	\N	\N	179	sharpers forbearer anesthetization undermentioned outflanking funnyman	\N	\N	2	176
878	2841	\N	\N	179	sharpers forbearer anesthetization undermentioned outflanking funnyman	\N	\N	2	2420
879	880	\N	\N	882	northers mutualist harebrained earthworms lunk forefended overtaking	\N	\N	2	881
879	880	\N	\N	882	northers mutualist harebrained earthworms lunk forefended overtaking	\N	\N	2	883
888	2570	\N	\N	887	reformers goodwife technicolor plenishes nippy bounden occulters	\N	\N	2	919
888	2570	\N	\N	887	reformers goodwife technicolor plenishes nippy bounden occulters	\N	\N	2	1315
904	2480	\N	\N	902	bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	131
904	2480	\N	\N	902	bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1632
905	1887	\N	\N	1217	retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	470
905	1887	\N	\N	1217	retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	902
906	910	\N	\N	907	hesitation fainting croupy bacchanalia	\N	\N	2	908
906	910	\N	\N	907	hesitation fainting croupy bacchanalia	\N	\N	2	909
914	916	\N	\N	917	unremorsefully extradites stollens ponderers	\N	\N	2	346
914	916	\N	\N	917	unremorsefully extradites stollens ponderers	\N	\N	2	782
924	2028	\N	\N	1790	environs hulled preexamination oralogy tibetans	\N	\N	2	279
924	2028	\N	\N	1790	environs hulled preexamination oralogy tibetans	\N	\N	2	1112
925	926	\N	\N	23	skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	135
925	926	\N	\N	23	skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	927
931	1399	\N	\N	1397	scalepan folklorists attractive yeller cognizably reminds teratoid coadjutors thuggeries	\N	\N	2	929
931	1399	\N	\N	1397	scalepan folklorists attractive yeller cognizably reminds teratoid coadjutors thuggeries	\N	\N	2	1398
933	934	\N	\N	323	thoughtless elation swampland earings circumscribed paralyzingly pouchy	\N	\N	2	936
933	934	\N	\N	323	thoughtless elation swampland earings circumscribed paralyzingly pouchy	\N	\N	2	937
938	1995	\N	\N	1996	varies thickest machinability orbiters tormentor	\N	\N	2	891
938	1995	\N	\N	1996	varies thickest machinability orbiters tormentor	\N	\N	2	1412
939	940	\N	\N	943	placarders septuagenarians safecracker cacaos mignonette	\N	\N	2	942
939	940	\N	\N	943	placarders septuagenarians safecracker cacaos mignonette	\N	\N	2	944
949	2746	\N	\N	810	retrogressions eliminates unknowns mongoloids	\N	\N	2	693
949	2746	\N	\N	810	retrogressions eliminates unknowns mongoloids	\N	\N	2	947
954	955	\N	\N	956	reupholstered xerosis steamers neurological warranter	\N	\N	2	320
954	955	\N	\N	956	reupholstered xerosis steamers neurological warranter	\N	\N	2	957
960	1404	\N	\N	1359	pegboxes feeblish extenuation stranders abbesses strongboxes chromas	\N	\N	2	958
960	1404	\N	\N	1359	pegboxes feeblish extenuation stranders abbesses strongboxes chromas	\N	\N	2	1060
962	963	\N	\N	810	treaties preprocessor despising loftily	\N	\N	2	808
962	963	\N	\N	810	treaties preprocessor despising loftily	\N	\N	2	809
965	2836	\N	\N	2198	irradiates befriends insinuators restorers rebroadcasting grousing	\N	\N	2	261
965	2836	\N	\N	2198	irradiates befriends insinuators restorers rebroadcasting grousing	\N	\N	2	1126
969	2663	\N	\N	340	voucherable intercepting jeered immunopathology addends	\N	\N	2	967
969	2663	\N	\N	340	voucherable intercepting jeered immunopathology addends	\N	\N	2	2662
973	2114	\N	\N	329	parrots paraguayans resonates overbites terminals giros podgy	\N	\N	2	139
973	2114	\N	\N	329	parrots paraguayans resonates overbites terminals giros podgy	\N	\N	2	1058
974	2829	\N	\N	329	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques	\N	\N	2	972
974	2829	\N	\N	329	reoccupations embossers cerebrum gloves mohairs admiralties bewigged playgoers cheques	\N	\N	2	1025
978	1344	\N	\N	329	equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	972
978	1344	\N	\N	329	equalled sandwiching bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	1343
979	1774	\N	\N	329	despising loftily yabber reprovingly blungers	\N	\N	2	972
979	1774	\N	\N	329	despising loftily yabber reprovingly blungers	\N	\N	2	1025
984	3031	\N	\N	983	underlaid neurosurgeon innervated hunts barrens emanative blowpipe	\N	\N	2	434
984	3031	\N	\N	983	underlaid neurosurgeon innervated hunts barrens emanative blowpipe	\N	\N	2	797
985	2911	\N	\N	2910	scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	342
985	2911	\N	\N	2910	scalepan folklorists attractive yeller cognizably reminds teratoid	\N	\N	2	433
991	2024	\N	\N	323	xerosis steamers neurological warranter flashings oops detonations chippering	\N	\N	2	936
991	2024	\N	\N	323	xerosis steamers neurological warranter flashings oops detonations chippering	\N	\N	2	937
994	2964	\N	\N	755	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	1282
994	2964	\N	\N	755	inadvisability disciplinarians majors manifestly decaffeinates scalepan	\N	\N	2	1568
995	2536	\N	\N	755	tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	759
995	2536	\N	\N	755	tetrachlorides loutish polygony malines cliffhanger entailments	\N	\N	2	992
996	1567	\N	\N	755	neologic intermuscular fobbed transcribed swifters	\N	\N	2	1282
996	1567	\N	\N	755	neologic intermuscular fobbed transcribed swifters	\N	\N	2	1568
1005	2843	\N	\N	385	flashings oops detonations chippering photospherically pouchiest canvasses pyorrheas cartons	\N	\N	2	1658
1005	2843	\N	\N	385	flashings oops detonations chippering photospherically pouchiest canvasses pyorrheas cartons	\N	\N	2	2160
1006	2390	\N	\N	385	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	1658
1006	2390	\N	\N	385	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	2160
1014	2162	\N	\N	1013	toiled nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	1214
1014	2162	\N	\N	1013	toiled nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	2129
1017	2770	\N	\N	1015	owner zanier corkscrewed promiscuousness clewed reassemble hesitation fainting croupy	\N	\N	2	1047
1017	2770	\N	\N	1015	owner zanier corkscrewed promiscuousness clewed reassemble hesitation fainting croupy	\N	\N	2	1159
1019	2073	\N	\N	2072	overabundant legworks easeful cognize hoatzin toiled nonspecialized	\N	\N	2	495
1019	2073	\N	\N	2072	overabundant legworks easeful cognize hoatzin toiled nonspecialized	\N	\N	2	1052
1028	2700	\N	\N	1637	unmuzzling measles decentralizing hogfishes	\N	\N	2	1026
1028	2700	\N	\N	1637	unmuzzling measles decentralizing hogfishes	\N	\N	2	1520
1031	2866	\N	\N	2586	nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	193
1031	2866	\N	\N	2586	nonspecialized vrouw squads tantalums overweight readmits loopholing tattles	\N	\N	2	1029
1033	2081	\N	\N	1129	coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	691
1033	2081	\N	\N	1129	coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras recirculations alkalin succulently	\N	\N	2	813
1034	2719	\N	\N	2017	heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	1171
1034	2719	\N	\N	2017	heartier petitionee brill neologic intermuscular fobbed transcribed	\N	\N	2	2060
1035	2606	\N	\N	2607	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	691
1035	2606	\N	\N	2607	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1049
1038	2165	\N	\N	1129	trephines hops exec junketeers isolators reducing nethermost nonfiction	\N	\N	2	691
1038	2165	\N	\N	1129	trephines hops exec junketeers isolators reducing nethermost nonfiction	\N	\N	2	813
1042	1665	\N	\N	1664	overbites terminals giros podgy vagus kinkiest xix	\N	\N	2	1039
1042	1665	\N	\N	1664	overbites terminals giros podgy vagus kinkiest xix	\N	\N	2	1666
1043	2992	\N	\N	2973	perspicuously disjoined nigglings midmonths labium peeped daydreams	\N	\N	2	1039
1043	2992	\N	\N	2973	perspicuously disjoined nigglings midmonths labium peeped daydreams	\N	\N	2	2423
1066	1067	\N	\N	1070	thickest machinability orbiters tormentor owner zanier	\N	\N	2	1068
1066	1067	\N	\N	1070	thickest machinability orbiters tormentor owner zanier	\N	\N	2	1071
1081	2534	\N	\N	838	triunities dipped votarists kilogram timbrel presell	\N	\N	2	88
1081	2534	\N	\N	838	triunities dipped votarists kilogram timbrel presell	\N	\N	2	1078
1082	1876	\N	\N	838	tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	88
1082	1876	\N	\N	838	tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	1078
1093	2819	\N	\N	2595	antiquarians dilutes quantitatively shovels vitric mendelism kookiest leavening	\N	\N	2	875
1093	2819	\N	\N	2595	antiquarians dilutes quantitatively shovels vitric mendelism kookiest leavening	\N	\N	2	2408
1094	2915	\N	\N	2595	inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	875
1094	2915	\N	\N	2595	inadvisability disciplinarians majors manifestly decaffeinates scalepan folklorists	\N	\N	2	2408
1103	1786	\N	\N	1787	swampland earings circumscribed paralyzingly pouchy surrejoinders	\N	\N	2	1160
1103	1786	\N	\N	1787	swampland earings circumscribed paralyzingly pouchy surrejoinders	\N	\N	2	1696
1115	1796	\N	\N	1114	webbier foxiness toddy playlets	\N	\N	2	886
1115	1796	\N	\N	1114	webbier foxiness toddy playlets	\N	\N	2	1339
1120	3064	\N	\N	111	occulters blubberer amenities desecrated tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	135
1120	3064	\N	\N	111	occulters blubberer amenities desecrated tetrachlorides loutish polygony malines cliffhanger	\N	\N	2	1262
1121	2693	\N	\N	2692	valiantly unremorsefully extradites stollens ponderers conditione loathly cancels debiting	\N	\N	2	946
1121	2693	\N	\N	2692	valiantly unremorsefully extradites stollens ponderers conditione loathly cancels debiting	\N	\N	2	2061
1122	1881	\N	\N	111	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	135
1122	1881	\N	\N	111	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1262
1130	2789	\N	\N	1727	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	141
1130	2789	\N	\N	1727	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	1129
1132	2690	\N	\N	1129	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	826
1132	2690	\N	\N	1129	plights corollaries gaudiness irades inadvisability disciplinarians	\N	\N	2	2345
1138	2764	\N	\N	1980	dumps carousels acidly deponent venges shivas	\N	\N	2	427
1138	2764	\N	\N	1980	dumps carousels acidly deponent venges shivas	\N	\N	2	1136
1147	3028	\N	\N	330	rebroadcasting grousing overdrinking frow	\N	\N	2	951
1147	3028	\N	\N	330	rebroadcasting grousing overdrinking frow	\N	\N	2	1145
1148	1377	\N	\N	36	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	38
1148	1377	\N	\N	36	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	1106
1152	2683	\N	\N	36	bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	38
1152	2683	\N	\N	36	bewitchment cheaters riffled kerneling napoleons rifer	\N	\N	2	1106
1153	2986	\N	\N	2721	recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	38
1153	2986	\N	\N	2721	recalculation safest signiory latchets inflecting trephines hops	\N	\N	2	1173
1164	2519	\N	\N	1781	easeful cognize hoatzin toiled nonspecialized vrouw squads tantalums overweight	\N	\N	2	281
1164	2519	\N	\N	1781	easeful cognize hoatzin toiled nonspecialized vrouw squads tantalums overweight	\N	\N	2	1681
1165	1531	\N	\N	1528	quantitatively shovels vitric mendelism kookiest	\N	\N	2	281
1165	1531	\N	\N	1528	quantitatively shovels vitric mendelism kookiest	\N	\N	2	1530
1168	1769	\N	\N	1166	fainting croupy bacchanalia regainers teardown margarins inconvenience triunities dipped	\N	\N	2	1767
1168	1769	\N	\N	1166	fainting croupy bacchanalia regainers teardown margarins inconvenience triunities dipped	\N	\N	2	1768
1169	2620	\N	\N	2428	fringier rhythmical wastebaskets powderer	\N	\N	2	323
1169	2620	\N	\N	2428	fringier rhythmical wastebaskets powderer	\N	\N	2	1166
1177	2548	\N	\N	1021	dumpers bering evasiveness toto teashop reaccepts gunneries	\N	\N	2	450
1177	2548	\N	\N	1021	dumpers bering evasiveness toto teashop reaccepts gunneries	\N	\N	2	2123
1181	2299	\N	\N	2173	votarists kilogram timbrel presell woodcraft reupholstered	\N	\N	2	1618
1181	2299	\N	\N	2173	votarists kilogram timbrel presell woodcraft reupholstered	\N	\N	2	2300
1190	1195	\N	\N	1194	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	1191
1190	1195	\N	\N	1194	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	1192
1199	2163	\N	\N	1198	composedly taunting dragged lobsters careering triplets hepatics colonies defalcate	\N	\N	2	116
1199	2163	\N	\N	1198	composedly taunting dragged lobsters careering triplets hepatics colonies defalcate	\N	\N	2	2076
1202	1203	\N	\N	1204	cerebrum gloves mohairs admiralties	\N	\N	2	449
1202	1203	\N	\N	1204	cerebrum gloves mohairs admiralties	\N	\N	2	753
1216	1221	\N	\N	1217	slavishly hipless prs bluejays	\N	\N	2	1219
1216	1221	\N	\N	1217	slavishly hipless prs bluejays	\N	\N	2	1220
1231	2342	\N	\N	111	trephines hops exec junketeers isolators reducing	\N	\N	2	113
1231	2342	\N	\N	111	trephines hops exec junketeers isolators reducing	\N	\N	2	126
1232	3063	\N	\N	111	acridities unrealistic substituting surges	\N	\N	2	113
1232	3063	\N	\N	111	acridities unrealistic substituting surges	\N	\N	2	126
1238	2507	\N	\N	195	summable heliocentricity excretions recelebrating dually plateauing	\N	\N	2	199
1238	2507	\N	\N	195	summable heliocentricity excretions recelebrating dually plateauing	\N	\N	2	279
1241	1243	\N	\N	341	undermentioned outflanking funnyman commuted lachrymation floweret arcadian	\N	\N	2	1242
1241	1243	\N	\N	341	undermentioned outflanking funnyman commuted lachrymation floweret arcadian	\N	\N	2	1244
1248	2701	\N	\N	1624	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	632
1248	2701	\N	\N	1624	hops exec junketeers isolators reducing nethermost nonfiction retrogressions eliminates	\N	\N	2	1370
1251	1367	\N	\N	1255	subpartnership cordilleras recirculations alkalin succulently marquise	\N	\N	2	1056
1251	1367	\N	\N	1255	subpartnership cordilleras recirculations alkalin succulently marquise	\N	\N	2	1249
1252	1253	\N	\N	1255	photospherically pouchiest canvasses pyorrheas	\N	\N	2	1056
1252	1253	\N	\N	1255	photospherically pouchiest canvasses pyorrheas	\N	\N	2	1254
1256	1258	\N	\N	896	hesitation fainting croupy bacchanalia	\N	\N	2	468
1256	1258	\N	\N	896	hesitation fainting croupy bacchanalia	\N	\N	2	893
1264	2581	\N	\N	346	hulled preexamination oralogy tibetans	\N	\N	2	719
1264	2581	\N	\N	346	hulled preexamination oralogy tibetans	\N	\N	2	720
1265	1268	\N	\N	1267	hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1025
1265	1268	\N	\N	1267	hipless prs bluejays cuppier nonsurgical skimpiest outpoured	\N	\N	2	1266
1273	1277	\N	\N	1276	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	725
1273	1277	\N	\N	1276	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	1274
1289	1290	\N	\N	195	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	\N	\N	2	196
1289	1290	\N	\N	195	satisfying undamped sharpers forbearer anesthetization undermentioned outflanking funnyman commuted	\N	\N	2	1209
1295	2716	\N	\N	385	regainers teardown margarins inconvenience	\N	\N	2	1293
1295	2716	\N	\N	385	regainers teardown margarins inconvenience	\N	\N	2	1420
1303	1306	\N	\N	403	succulently marquise underlaid neurosurgeon innervated hunts barrens emanative	\N	\N	2	1304
1303	1306	\N	\N	403	succulently marquise underlaid neurosurgeon innervated hunts barrens emanative	\N	\N	2	1305
1313	2574	\N	\N	896	wastebaskets powderer immigrates inserter plights corollaries gaudiness irades	\N	\N	2	468
1313	2574	\N	\N	896	wastebaskets powderer immigrates inserter plights corollaries gaudiness irades	\N	\N	2	898
1320	1324	\N	\N	1325	oblongish leapfrogged overabundant legworks easeful cognize hoatzin toiled	\N	\N	2	1321
1320	1324	\N	\N	1325	oblongish leapfrogged overabundant legworks easeful cognize hoatzin toiled	\N	\N	2	1322
1331	1333	\N	\N	1332	cooked reformers goodwife technicolor plenishes	\N	\N	2	817
1331	1333	\N	\N	1332	cooked reformers goodwife technicolor plenishes	\N	\N	2	1334
1337	2863	\N	\N	1541	immediately canzona interrelated cooked	\N	\N	2	1335
1337	2863	\N	\N	1541	immediately canzona interrelated cooked	\N	\N	2	1419
1346	2419	\N	\N	896	technicolor plenishes nippy bounden occulters blubberer amenities desecrated tetrachlorides	\N	\N	2	468
1346	2419	\N	\N	896	technicolor plenishes nippy bounden occulters blubberer amenities desecrated tetrachlorides	\N	\N	2	893
1362	2794	\N	\N	558	satisfying undamped sharpers forbearer	\N	\N	2	331
1362	2794	\N	\N	558	satisfying undamped sharpers forbearer	\N	\N	2	1360
1387	2529	\N	\N	2528	cheaters riffled kerneling napoleons rifer splinting surmisers satisfying undamped	\N	\N	2	1634
1387	2529	\N	\N	2528	cheaters riffled kerneling napoleons rifer splinting surmisers satisfying undamped	\N	\N	2	2082
1392	1393	\N	\N	179	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	1050
1392	1393	\N	\N	179	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	1191
1395	2982	\N	\N	1394	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	\N	\N	2	725
1395	2982	\N	\N	1394	sodality outcrop slipcases phenylketonuria grunts venturers valiantly	\N	\N	2	2066
1396	2177	\N	\N	1394	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	\N	\N	2	23
1396	2177	\N	\N	1394	loftily yabber reprovingly blungers dwarflike effulgences coreless tuberculoses environs	\N	\N	2	2178
1407	2999	\N	\N	2428	clewed reassemble hesitation fainting croupy bacchanalia regainers teardown	\N	\N	2	1287
1407	2999	\N	\N	2428	clewed reassemble hesitation fainting croupy bacchanalia regainers teardown	\N	\N	2	1405
1431	2996	\N	\N	1217	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	876
1431	2996	\N	\N	1217	interrelated cooked reformers goodwife technicolor plenishes nippy bounden	\N	\N	2	2416
1434	1435	\N	\N	1438	colonies defalcate transplantations forfends	\N	\N	2	1053
1434	1435	\N	\N	1438	colonies defalcate transplantations forfends	\N	\N	2	1437
1443	3025	\N	\N	1793	pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	338
1443	3025	\N	\N	1793	pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	1781
1450	2367	\N	\N	1662	overtaking sourdoughs traditionless spoliator earthlier stenographers reallocating aslope	\N	\N	2	1364
1450	2367	\N	\N	1662	overtaking sourdoughs traditionless spoliator earthlier stenographers reallocating aslope	\N	\N	2	1448
1452	1978	\N	\N	319	substituting surges preheats loggias reconciliating	\N	\N	2	451
1452	1978	\N	\N	319	substituting surges preheats loggias reconciliating	\N	\N	2	946
1453	2993	\N	\N	319	exec junketeers isolators reducing nethermost nonfiction retrogressions	\N	\N	2	451
1453	2993	\N	\N	319	exec junketeers isolators reducing nethermost nonfiction retrogressions	\N	\N	2	946
1455	2913	\N	\N	111	effulgences coreless tuberculoses environs	\N	\N	2	319
1455	2913	\N	\N	111	effulgences coreless tuberculoses environs	\N	\N	2	2070
1464	1469	\N	\N	1468	innervated hunts barrens emanative blowpipe varies thickest	\N	\N	2	1466
1464	1469	\N	\N	1468	innervated hunts barrens emanative blowpipe varies thickest	\N	\N	2	1467
1477	2877	\N	\N	1476	trephines hops exec junketeers isolators reducing nethermost	\N	\N	2	1186
1477	2877	\N	\N	1476	trephines hops exec junketeers isolators reducing nethermost	\N	\N	2	1473
1478	2901	\N	\N	1476	effulgences coreless tuberculoses environs hulled preexamination oralogy tibetans	\N	\N	2	107
1478	2901	\N	\N	1476	effulgences coreless tuberculoses environs hulled preexamination oralogy tibetans	\N	\N	2	1620
1479	1984	\N	\N	1476	acridities unrealistic substituting surges preheats loggias	\N	\N	2	1186
1479	1984	\N	\N	1476	acridities unrealistic substituting surges preheats loggias	\N	\N	2	1473
1480	2882	\N	\N	1476	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1473
1480	2882	\N	\N	1476	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1862
1482	1766	\N	\N	1476	bewigged playgoers cheques batting waspishly stilbestrol	\N	\N	2	107
1482	1766	\N	\N	1476	bewigged playgoers cheques batting waspishly stilbestrol	\N	\N	2	1620
1483	2773	\N	\N	2528	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	182
1483	2773	\N	\N	2528	slipcases phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	1476
1487	1708	\N	\N	1709	equalled sandwiching bewitchment cheaters riffled	\N	\N	2	371
1487	1708	\N	\N	1709	equalled sandwiching bewitchment cheaters riffled	\N	\N	2	1242
1488	2879	\N	\N	1709	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated	\N	\N	2	371
1488	2879	\N	\N	1709	prs bluejays cuppier nonsurgical skimpiest outpoured dissociated	\N	\N	2	1242
1494	2126	\N	\N	2125	hunts barrens emanative blowpipe varies	\N	\N	2	303
1494	2126	\N	\N	2125	hunts barrens emanative blowpipe varies	\N	\N	2	347
1498	2245	\N	\N	331	polers oinked apnea maxillary dumpers	\N	\N	2	600
1498	2245	\N	\N	331	polers oinked apnea maxillary dumpers	\N	\N	2	688
1501	1504	\N	\N	1502	carpetbag peonism metropolitanize twanged pedros nonforfeitable dissociative apostacy	\N	\N	2	1235
1501	1504	\N	\N	1502	carpetbag peonism metropolitanize twanged pedros nonforfeitable dissociative apostacy	\N	\N	2	1503
1512	2708	\N	\N	457	thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter plights	\N	\N	2	458
1512	2708	\N	\N	457	thurifer teazle fringier rhythmical wastebaskets powderer immigrates inserter plights	\N	\N	2	459
1515	1516	\N	\N	1518	reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras	\N	\N	2	327
1515	1516	\N	\N	1518	reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership cordilleras	\N	\N	2	1517
1527	3041	\N	\N	1526	junketeers isolators reducing nethermost nonfiction	\N	\N	2	335
1527	3041	\N	\N	1526	junketeers isolators reducing nethermost nonfiction	\N	\N	2	2302
1534	3079	\N	\N	1581	timbrel presell woodcraft reupholstered xerosis steamers neurological	\N	\N	2	1046
1534	3079	\N	\N	1581	timbrel presell woodcraft reupholstered xerosis steamers neurological	\N	\N	2	1753
1535	2779	\N	\N	1581	cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	1046
1535	2779	\N	\N	1581	cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	1753
1536	2103	\N	\N	1581	decaffeinates scalepan folklorists attractive	\N	\N	2	365
1536	2103	\N	\N	1581	decaffeinates scalepan folklorists attractive	\N	\N	2	1046
1545	2980	\N	\N	470	fringier rhythmical wastebaskets powderer	\N	\N	2	1317
1545	2980	\N	\N	470	fringier rhythmical wastebaskets powderer	\N	\N	2	1543
1548	3022	\N	\N	1255	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	1056
1548	3022	\N	\N	1255	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets	\N	\N	2	1254
1566	2953	\N	\N	816	parrots paraguayans resonates overbites terminals giros	\N	\N	2	440
1566	2953	\N	\N	816	parrots paraguayans resonates overbites terminals giros	\N	\N	2	819
1573	1741	\N	\N	303	marrieds fungic gasogenes obnoxiously dismounting	\N	\N	2	304
1573	1741	\N	\N	303	marrieds fungic gasogenes obnoxiously dismounting	\N	\N	2	306
1578	1579	\N	\N	1582	measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets powderer	\N	\N	2	1581
1578	1579	\N	\N	1582	measurage tonsils pasturage thurifer teazle fringier rhythmical wastebaskets powderer	\N	\N	2	1583
1588	1589	\N	\N	36	resonates overbites terminals giros podgy vagus	\N	\N	2	587
1588	1589	\N	\N	36	resonates overbites terminals giros podgy vagus	\N	\N	2	1591
1599	1757	\N	\N	270	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	998
1599	1757	\N	\N	270	nigglings midmonths labium peeped daydreams permuting immediately canzona	\N	\N	2	1759
1600	2660	\N	\N	270	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1376
1600	2660	\N	\N	270	podgy vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	1759
1604	2955	\N	\N	2954	lobsters careering triplets hepatics colonies defalcate transplantations forfends voucherable	\N	\N	2	555
1604	2955	\N	\N	2954	lobsters careering triplets hepatics colonies defalcate transplantations forfends voucherable	\N	\N	2	2244
1605	3044	\N	\N	2954	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	555
1605	3044	\N	\N	2954	blowpipe varies thickest machinability orbiters tormentor owner zanier	\N	\N	2	2244
1616	1878	\N	\N	1815	teardown margarins inconvenience triunities dipped votarists kilogram timbrel presell	\N	\N	2	589
1616	1878	\N	\N	1815	teardown margarins inconvenience triunities dipped votarists kilogram timbrel presell	\N	\N	2	1678
1625	2622	\N	\N	1624	vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	326
1625	2622	\N	\N	1624	vagus kinkiest xix recollected householder overeducated objurgate	\N	\N	2	674
1630	1806	\N	\N	339	neurological warranter flashings oops detonations chippering photospherically	\N	\N	2	555
1630	1806	\N	\N	339	neurological warranter flashings oops detonations chippering photospherically	\N	\N	2	715
1643	1684	\N	\N	1683	scrapped prat islanded burlily thanklessly swiveled polers oinked	\N	\N	2	1310
1643	1684	\N	\N	1683	scrapped prat islanded burlily thanklessly swiveled polers oinked	\N	\N	2	1380
1647	2132	\N	\N	1228	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	294
1647	2132	\N	\N	1228	claymores shiftlessly feedstuffs lyricizing hierarchs composedly taunting dragged	\N	\N	2	1226
1649	3011	\N	\N	1204	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	449
1649	3011	\N	\N	1204	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	2831
1656	2351	\N	\N	1583	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	1413
1656	2351	\N	\N	1583	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	2350
1668	1837	\N	\N	712	hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	1179
1668	1837	\N	\N	712	hulled preexamination oralogy tibetans slavishly hipless prs	\N	\N	2	1319
1669	1751	\N	\N	712	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	1179
1669	1751	\N	\N	712	chestiest measurage tonsils pasturage thurifer teazle fringier rhythmical	\N	\N	2	1319
1670	2053	\N	\N	2054	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	710
1670	2053	\N	\N	2054	xix recollected householder overeducated objurgate treaties preprocessor despising loftily	\N	\N	2	1928
1675	1676	\N	\N	1678	colonies defalcate transplantations forfends	\N	\N	2	286
1675	1676	\N	\N	1678	colonies defalcate transplantations forfends	\N	\N	2	454
1707	2890	\N	\N	1562	taunting dragged lobsters careering triplets hepatics colonies defalcate transplantations	\N	\N	2	1048
1707	2890	\N	\N	1562	taunting dragged lobsters careering triplets hepatics colonies defalcate transplantations	\N	\N	2	2655
1712	1713	\N	\N	195	neologic intermuscular fobbed transcribed	\N	\N	2	196
1712	1713	\N	\N	195	neologic intermuscular fobbed transcribed	\N	\N	2	1209
1725	1728	\N	\N	1727	powderer immigrates inserter plights corollaries	\N	\N	2	1089
1725	1728	\N	\N	1727	powderer immigrates inserter plights corollaries	\N	\N	2	1726
1733	1735	\N	\N	23	phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	821
1733	1735	\N	\N	23	phenylketonuria grunts venturers valiantly unremorsefully extradites stollens ponderers	\N	\N	2	1446
1738	2781	\N	\N	2783	votarists kilogram timbrel presell	\N	\N	2	340
1738	2781	\N	\N	2783	votarists kilogram timbrel presell	\N	\N	2	2167
1760	1762	\N	\N	628	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	516
1760	1762	\N	\N	628	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids	\N	\N	2	629
1785	2899	\N	\N	641	succulently marquise underlaid neurosurgeon innervated hunts	\N	\N	2	642
1785	2899	\N	\N	641	succulently marquise underlaid neurosurgeon innervated hunts	\N	\N	2	645
1789	2761	\N	\N	1946	allayed zinged fridge stained unintentional antiquarians dilutes quantitatively shovels	\N	\N	2	259
1789	2761	\N	\N	1946	allayed zinged fridge stained unintentional antiquarians dilutes quantitatively shovels	\N	\N	2	519
1791	3033	\N	\N	1790	surges preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	322
1791	3033	\N	\N	1790	surges preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	2323
1794	2005	\N	\N	1357	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless	\N	\N	2	1329
1794	2005	\N	\N	1357	tuberculoses environs hulled preexamination oralogy tibetans slavishly hipless	\N	\N	2	2004
1795	2346	\N	\N	1357	labium peeped daydreams permuting immediately canzona interrelated	\N	\N	2	1051
1795	2346	\N	\N	1357	labium peeped daydreams permuting immediately canzona interrelated	\N	\N	2	1568
1800	2905	\N	\N	2027	triplets hepatics colonies defalcate	\N	\N	2	69
1800	2905	\N	\N	2027	triplets hepatics colonies defalcate	\N	\N	2	332
1804	2057	\N	\N	2056	retorts insoles stockman queening	\N	\N	2	1054
1804	2057	\N	\N	2056	retorts insoles stockman queening	\N	\N	2	2055
1811	1812	\N	\N	1541	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	1419
1811	1812	\N	\N	1541	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously	\N	\N	2	1813
1817	2427	\N	\N	2426	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	324
1817	2427	\N	\N	2426	zanier corkscrewed promiscuousness clewed reassemble hesitation fainting	\N	\N	2	2425
1827	1898	\N	\N	1678	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble hesitation	\N	\N	2	286
1827	1898	\N	\N	1678	orbiters tormentor owner zanier corkscrewed promiscuousness clewed reassemble hesitation	\N	\N	2	454
1828	1830	\N	\N	21	podgy vagus kinkiest xix recollected householder	\N	\N	2	20
1828	1830	\N	\N	21	podgy vagus kinkiest xix recollected householder	\N	\N	2	843
1836	3055	\N	\N	2607	skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	1462
1836	3055	\N	\N	2607	skimpiest outpoured dissociated heartier petitionee brill	\N	\N	2	2431
1848	2725	\N	\N	2147	paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	1356
1848	2725	\N	\N	2147	paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	1414
1853	3008	\N	\N	2756	reallocating aslope seawaters ruminative patronly hydrozoon webbier foxiness toddy	\N	\N	2	1057
1853	3008	\N	\N	2756	reallocating aslope seawaters ruminative patronly hydrozoon webbier foxiness toddy	\N	\N	2	2449
1864	2020	\N	\N	915	surmisers satisfying undamped sharpers forbearer	\N	\N	2	720
1864	2020	\N	\N	915	surmisers satisfying undamped sharpers forbearer	\N	\N	2	1952
1865	1866	\N	\N	1868	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	329
1865	1866	\N	\N	1868	lenity tautological jambing sodality outcrop slipcases phenylketonuria grunts	\N	\N	2	1867
1870	2937	\N	\N	48	apnea maxillary dumpers bering evasiveness toto	\N	\N	2	46
1870	2937	\N	\N	48	apnea maxillary dumpers bering evasiveness toto	\N	\N	2	382
1871	1872	\N	\N	1369	tuberculoses environs hulled preexamination oralogy	\N	\N	2	777
1871	1872	\N	\N	1369	tuberculoses environs hulled preexamination oralogy	\N	\N	2	921
1875	3071	\N	\N	895	barrens emanative blowpipe varies	\N	\N	2	1125
1875	3071	\N	\N	895	barrens emanative blowpipe varies	\N	\N	2	1410
1897	2876	\N	\N	2623	reminds teratoid coadjutors thuggeries nondestructive	\N	\N	2	1895
1897	2876	\N	\N	2623	reminds teratoid coadjutors thuggeries nondestructive	\N	\N	2	2160
1907	2975	\N	\N	2910	presell woodcraft reupholstered xerosis steamers neurological warranter	\N	\N	2	1418
1907	2975	\N	\N	2910	presell woodcraft reupholstered xerosis steamers neurological warranter	\N	\N	2	1905
1910	2949	\N	\N	1683	bewigged playgoers cheques batting	\N	\N	2	566
1910	2949	\N	\N	1683	bewigged playgoers cheques batting	\N	\N	2	2669
1917	2845	\N	\N	2323	oralogy tibetans slavishly hipless prs bluejays	\N	\N	2	277
1917	2845	\N	\N	2323	oralogy tibetans slavishly hipless prs bluejays	\N	\N	2	2096
1920	3073	\N	\N	2127	dwarflike effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	1918
1920	3073	\N	\N	2127	dwarflike effulgences coreless tuberculoses environs hulled preexamination	\N	\N	2	2272
1930	2543	\N	\N	1194	retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously disjoined nigglings	\N	\N	2	1191
1930	2543	\N	\N	1194	retrogressions eliminates unknowns mongoloids danker raunchiness perspicuously disjoined nigglings	\N	\N	2	1192
1934	2505	\N	\N	1868	anesthetization undermentioned outflanking funnyman	\N	\N	2	971
1934	2505	\N	\N	1868	anesthetization undermentioned outflanking funnyman	\N	\N	2	1775
1936	2684	\N	\N	1868	swifters redigesting ostinato recalculation safest	\N	\N	2	971
1936	2684	\N	\N	1868	swifters redigesting ostinato recalculation safest	\N	\N	2	1775
1941	2208	\N	\N	146	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	701
1941	2208	\N	\N	146	cuppier nonsurgical skimpiest outpoured dissociated heartier petitionee brill neologic	\N	\N	2	702
1944	3006	\N	\N	1891	bedstraws thoughtless elation swampland earings	\N	\N	2	144
1944	3006	\N	\N	1891	bedstraws thoughtless elation swampland earings	\N	\N	2	1415
1981	2968	\N	\N	457	interrelated cooked reformers goodwife technicolor plenishes	\N	\N	2	460
1981	2968	\N	\N	457	interrelated cooked reformers goodwife technicolor plenishes	\N	\N	2	1382
1983	2265	\N	\N	1458	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	866
1983	2265	\N	\N	1458	nethermost nonfiction retrogressions eliminates unknowns mongoloids danker raunchiness	\N	\N	2	1459
1988	2730	\N	\N	2731	renege briefless regularities planarity stubborner	\N	\N	2	577
1988	2730	\N	\N	2731	renege briefless regularities planarity stubborner	\N	\N	2	2251
1990	1992	\N	\N	1868	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	1260
1990	1992	\N	\N	1868	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	1993
1997	2389	\N	\N	628	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	1092
1997	2389	\N	\N	628	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	2270
1998	2822	\N	\N	628	preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	516
1998	2822	\N	\N	628	preheats loggias reconciliating photocatalyst lenity tautological	\N	\N	2	629
1999	2785	\N	\N	628	recollected householder overeducated objurgate treaties preprocessor despising loftily yabber	\N	\N	2	874
1999	2785	\N	\N	628	recollected householder overeducated objurgate treaties preprocessor despising loftily yabber	\N	\N	2	1092
2000	2742	\N	\N	628	tetrachlorides loutish polygony malines	\N	\N	2	874
2000	2742	\N	\N	628	tetrachlorides loutish polygony malines	\N	\N	2	1092
2007	2359	\N	\N	457	cliffhanger entailments reindexed bedstraws	\N	\N	2	1382
2007	2359	\N	\N	457	cliffhanger entailments reindexed bedstraws	\N	\N	2	2360
2034	2565	\N	\N	343	jeered immunopathology addends surveiled wagers	\N	\N	2	2032
2034	2565	\N	\N	343	jeered immunopathology addends surveiled wagers	\N	\N	2	2205
2048	2052	\N	\N	1843	nondestructive maladjustments subpartnership cordilleras recirculations alkalin	\N	\N	2	681
2048	2052	\N	\N	1843	nondestructive maladjustments subpartnership cordilleras recirculations alkalin	\N	\N	2	2051
2087	3039	\N	\N	1276	resonates overbites terminals giros podgy vagus kinkiest	\N	\N	2	466
2087	3039	\N	\N	1276	resonates overbites terminals giros podgy vagus kinkiest	\N	\N	2	822
2088	2501	\N	\N	1276	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	466
2088	2501	\N	\N	1276	technicolor plenishes nippy bounden occulters blubberer amenities desecrated	\N	\N	2	822
2089	2747	\N	\N	1276	safest signiory latchets inflecting	\N	\N	2	725
2089	2747	\N	\N	1276	safest signiory latchets inflecting	\N	\N	2	1274
2090	2092	\N	\N	1787	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	1696
2090	2092	\N	\N	1787	nippy bounden occulters blubberer amenities desecrated tetrachlorides loutish polygony	\N	\N	2	2091
2095	2555	\N	\N	2094	chromas oats pulling leatheriness witchy horologe bigamistic furrows	\N	\N	2	2404
2095	2555	\N	\N	2094	chromas oats pulling leatheriness witchy horologe bigamistic furrows	\N	\N	2	2453
2098	3070	\N	\N	2323	excretions recelebrating dually plateauing reoccupations embossers cerebrum	\N	\N	2	1073
2098	3070	\N	\N	2323	excretions recelebrating dually plateauing reoccupations embossers cerebrum	\N	\N	2	2096
2101	2354	\N	\N	2323	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	1073
2101	2354	\N	\N	2323	overeducated objurgate treaties preprocessor despising loftily yabber reprovingly blungers	\N	\N	2	2096
2108	2487	\N	\N	36	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	1106
2108	2487	\N	\N	36	commuted lachrymation floweret arcadian acridities unrealistic substituting surges	\N	\N	2	2227
2110	2111	\N	\N	1194	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	597
2110	2111	\N	\N	1194	slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	1193
2121	2977	\N	\N	1839	ostinato recalculation safest signiory	\N	\N	2	1705
2121	2977	\N	\N	1839	ostinato recalculation safest signiory	\N	\N	2	2064
2128	2438	\N	\N	1787	latchets inflecting trephines hops	\N	\N	2	348
2128	2438	\N	\N	1787	latchets inflecting trephines hops	\N	\N	2	2147
2134	2136	\N	\N	712	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	349
2134	2136	\N	\N	712	neologic intermuscular fobbed transcribed swifters redigesting ostinato recalculation	\N	\N	2	2137
2141	3000	\N	\N	1868	treaties preprocessor despising loftily	\N	\N	2	1260
2141	3000	\N	\N	1868	treaties preprocessor despising loftily	\N	\N	2	1993
2150	2397	\N	\N	2241	flashings oops detonations chippering photospherically pouchiest	\N	\N	2	1902
2150	2397	\N	\N	2241	flashings oops detonations chippering photospherically pouchiest	\N	\N	2	2398
2169	2984	\N	\N	907	embrocation casteless uroliths sashes	\N	\N	2	908
2169	2984	\N	\N	907	embrocation casteless uroliths sashes	\N	\N	2	2117
2170	2609	\N	\N	907	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership	\N	\N	2	908
2170	2609	\N	\N	907	yeller cognizably reminds teratoid coadjutors thuggeries nondestructive maladjustments subpartnership	\N	\N	2	2117
2179	2287	\N	\N	48	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	382
2179	2287	\N	\N	48	dually plateauing reoccupations embossers cerebrum gloves mohairs admiralties	\N	\N	2	529
2183	2972	\N	\N	1194	firefanged skeins equalled sandwiching	\N	\N	2	597
2183	2972	\N	\N	1194	firefanged skeins equalled sandwiching	\N	\N	2	1193
2191	2498	\N	\N	23	floweret arcadian acridities unrealistic substituting surges preheats loggias reconciliating	\N	\N	2	464
2191	2498	\N	\N	23	floweret arcadian acridities unrealistic substituting surges preheats loggias reconciliating	\N	\N	2	821
2197	2199	\N	\N	2198	antiquarians dilutes quantitatively shovels	\N	\N	2	169
2197	2199	\N	\N	2198	antiquarians dilutes quantitatively shovels	\N	\N	2	344
2255	2553	\N	\N	2533	yeller cognizably reminds teratoid	\N	\N	2	1188
2255	2553	\N	\N	2533	yeller cognizably reminds teratoid	\N	\N	2	1409
2260	2261	\N	\N	53	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	50
2260	2261	\N	\N	53	napoleons rifer splinting surmisers satisfying undamped sharpers forbearer	\N	\N	2	51
2273	2872	\N	\N	348	occulters blubberer amenities desecrated	\N	\N	2	1557
2273	2872	\N	\N	348	occulters blubberer amenities desecrated	\N	\N	2	2272
2276	2277	\N	\N	1468	hierarchs composedly taunting dragged lobsters careering triplets hepatics	\N	\N	2	1466
2276	2277	\N	\N	1468	hierarchs composedly taunting dragged lobsters careering triplets hepatics	\N	\N	2	1467
2281	2405	\N	\N	201	loopholing tattles irradiates befriends insinuators restorers rebroadcasting grousing overdrinking	\N	\N	2	1044
2281	2405	\N	\N	201	loopholing tattles irradiates befriends insinuators restorers rebroadcasting grousing overdrinking	\N	\N	2	2279
2310	3030	\N	\N	2533	technicolor plenishes nippy bounden	\N	\N	2	82
2310	3030	\N	\N	2533	technicolor plenishes nippy bounden	\N	\N	2	334
2319	2925	\N	\N	2339	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	155
2319	2925	\N	\N	2339	circumscribed paralyzingly pouchy surrejoinders chestiest measurage tonsils pasturage	\N	\N	2	2926
2327	2329	\N	\N	1194	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	597
2327	2329	\N	\N	1194	swifters redigesting ostinato recalculation safest signiory	\N	\N	2	2330
2333	2334	\N	\N	1541	reconciliating photocatalyst lenity tautological jambing sodality outcrop	\N	\N	2	1419
2333	2334	\N	\N	1541	reconciliating photocatalyst lenity tautological jambing sodality outcrop	\N	\N	2	1813
2361	2870	\N	\N	290	subpartnership cordilleras recirculations alkalin	\N	\N	2	289
2361	2870	\N	\N	290	subpartnership cordilleras recirculations alkalin	\N	\N	2	2159
2364	2906	\N	\N	290	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids danker	\N	\N	2	289
2364	2906	\N	\N	290	isolators reducing nethermost nonfiction retrogressions eliminates unknowns mongoloids danker	\N	\N	2	2159
2370	2386	\N	\N	28	fobbed transcribed swifters redigesting ostinato recalculation safest	\N	\N	2	27
2370	2386	\N	\N	28	fobbed transcribed swifters redigesting ostinato recalculation safest	\N	\N	2	29
2383	2384	\N	\N	2385	loathly cancels debiting parrots paraguayans	\N	\N	2	341
2383	2384	\N	\N	2385	loathly cancels debiting parrots paraguayans	\N	\N	2	1709
2402	2856	\N	\N	21	gunneries exorcises pirog desexes	\N	\N	2	20
2402	2856	\N	\N	21	gunneries exorcises pirog desexes	\N	\N	2	843
2436	2563	\N	\N	2178	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	464
2436	2563	\N	\N	2178	raunchiness perspicuously disjoined nigglings midmonths labium peeped	\N	\N	2	1411
2468	2839	\N	\N	2135	loutish polygony malines cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	462
2468	2839	\N	\N	2135	loutish polygony malines cliffhanger entailments reindexed bedstraws thoughtless elation	\N	\N	2	2638
2511	3021	\N	\N	816	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	833
2511	3021	\N	\N	816	ostinato recalculation safest signiory latchets inflecting trephines hops exec	\N	\N	2	1602
2512	2835	\N	\N	335	preexamination oralogy tibetans slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	1904
2512	2835	\N	\N	335	preexamination oralogy tibetans slavishly hipless prs bluejays cuppier nonsurgical	\N	\N	2	2228
2557	2720	\N	\N	1204	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	449
2557	2720	\N	\N	1204	yabber reprovingly blungers dwarflike effulgences coreless	\N	\N	2	753
2585	2588	\N	\N	2586	addends surveiled wagers joysticks nonliving agric	\N	\N	2	2382
2585	2588	\N	\N	2586	addends surveiled wagers joysticks nonliving agric	\N	\N	2	2587
2728	2740	\N	\N	1678	photospherically pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	454
2728	2740	\N	\N	1678	photospherically pouchiest canvasses pyorrheas cartons acquirable refocus vividness	\N	\N	2	2204
\.



COPY "Person" ("ID", name, email, "assignedByReviewer", "TYPE") FROM stdin;
459	Jake Bober	Jake.Bober@secretresearch.tld	\N	2
1437	Fullara Mohsin	Fullara.Mohsin@secretresearch.tld	\N	2
555	Lanzo Buseck	Lanzo.Buseck@secretresearch.tld	\N	2
462	Ludovica Diekmann	Ludovica.Diekmann@secretresearch.tld	\N	2
1632	Elvita Zielke	Elvita.Zielke@secretresearch.tld	\N	2
158	Trillare Stukel	Trillare.Stukel@secretresearch.tld	\N	2
1026	Adamanta Schlitt	Adamanta.Schlitt@secretresearch.tld	\N	2
711	Teana Stallworth	Teana.Stallworth@secretresearch.tld	\N	2
1448	Wicus Kastendieck	Wicus.Kastendieck@secretresearch.tld	\N	2
1304	Tekusa Houlberg	Tekusa.Houlberg@secretresearch.tld	\N	2
1044	Matsa Scheer	Matsa.Scheer@secretresearch.tld	\N	2
1254	Saraswathi Knickman	Saraswathi.Knickman@secretresearch.tld	\N	2
986	Zeenab Lasane	Zeenab.Lasane@secretresearch.tld	\N	2
321	Unkei Whitfield	Unkei.Whitfield@secretresearch.tld	\N	2
626	Aetos Bitar	Aetos.Bitar@secretresearch.tld	\N	2
334	Petros Josefy	Petros.Josefy@secretresearch.tld	\N	2
1719	Araminta Macumber	Araminta.Macumber@secretresearch.tld	\N	2
1965	LaReina Iqbal	LaReina.Iqbal@secretresearch.tld	\N	2
1737	Lone Pavese	Lone.Pavese@secretresearch.tld	\N	2
1902	Ceanna Vangoff	Ceanna.Vangoff@secretresearch.tld	\N	2
2123	Letizia Madaras	Letizia.Madaras@secretresearch.tld	\N	2
600	Toku Synowiec	Toku.Synowiec@secretresearch.tld	\N	2
1416	Gerakna Ryneer	Gerakna.Ryneer@secretresearch.tld	\N	2
2091	Goncalo Gahm	Goncalo.Gahm@secretresearch.tld	\N	2
944	Ustin Behm	Ustin.Behm@secretresearch.tld	\N	2
1000	Luitfriede Westmark	Luitfriede.Westmark@secretresearch.tld	\N	2
277	Tienne Segraves	Tienne.Segraves@secretresearch.tld	\N	2
200	Britney Gong	Britney.Gong@secretresearch.tld	\N	2
1142	Shaka Enget	Shaka.Enget@secretresearch.tld	\N	2
442	Chebi Selking	Chebi.Selking@secretresearch.tld	\N	2
2341	Gerke Ostermeyer	Gerke.Ostermeyer@secretresearch.tld	\N	2
322	Gulielma Arce	Gulielma.Arce@secretresearch.tld	\N	2
1174	Notburg Towber	Notburg.Towber@secretresearch.tld	\N	2
1360	Timun Silverstein	Timun.Silverstein@secretresearch.tld	\N	2
1618	Khaalida Dire	Khaalida.Dire@secretresearch.tld	\N	2
957	Tetsuya Deerdoff	Tetsuya.Deerdoff@secretresearch.tld	\N	2
881	Fernanda Hokutan	Fernanda.Hokutan@secretresearch.tld	\N	2
1011	Demetria Tramonti	Demetria.Tramonti@secretresearch.tld	\N	2
17	Cathy Phebus	Cathy.Phebus@secretresearch.tld	\N	2
193	Ursuel Eskind	Ursuel.Eskind@secretresearch.tld	\N	2
2312	Bakhteiarova Amlin	Bakhteiarova.Amlin@secretresearch.tld	\N	2
2360	Tasia Ellenburg	Tasia.Ellenburg@secretresearch.tld	\N	2
552	Hieronim Mccaig	Hieronim.Mccaig@secretresearch.tld	\N	2
332	Ignatius Beausoleil	Ignatius.Beausoleil@secretresearch.tld	\N	2
2008	Iaroia Korth	Iaroia.Korth@secretresearch.tld	\N	2
694	Miranda Leinen	Miranda.Leinen@secretresearch.tld	\N	2
647	Ehud Bazzle	Ehud.Bazzle@secretresearch.tld	\N	2
2082	Isamu Cokely	Isamu.Cokely@secretresearch.tld	\N	2
1335	Reece Raburn	Reece.Raburn@secretresearch.tld	\N	2
2587	Shaaheen Latu	Shaaheen.Latu@secretresearch.tld	\N	2
2137	Casandra Shire	Casandra.Shire@secretresearch.tld	\N	2
768	Nakamaro Zinkievich	Nakamaro.Zinkievich@secretresearch.tld	\N	2
545	Elea Kossak	Elea.Kossak@secretresearch.tld	\N	2
660	Dell Kosel	Dell.Kosel@secretresearch.tld	\N	2
2061	Bailee Chabolla	Bailee.Chabolla@secretresearch.tld	\N	2
729	Adolfa Leuthauser	Adolfa.Leuthauser@secretresearch.tld	\N	2
344	Justino Bedenfield	Justino.Bedenfield@secretresearch.tld	\N	2
1467	Ravati Boyarsky	Ravati.Boyarsky@secretresearch.tld	\N	2
946	Lavina Brunskill	Lavina.Brunskill@secretresearch.tld	\N	2
830	Mufeed Nwankwo	Mufeed.Nwankwo@secretresearch.tld	\N	2
186	Toyoshige Annen	Toyoshige.Annen@secretresearch.tld	\N	2
1696	Cadell Parral	Cadell.Parral@secretresearch.tld	\N	2
893	Janita Bolieu	Janita.Bolieu@secretresearch.tld	\N	2
1672	Fujio Hocke	Fujio.Hocke@secretresearch.tld	\N	2
225	Mimi Stremmel	Mimi.Stremmel@secretresearch.tld	\N	2
1855	Gerulf Githens	Gerulf.Githens@secretresearch.tld	\N	2
1867	Dawn Lauinger	Dawn.Lauinger@secretresearch.tld	\N	2
1415	Leopoldina Alvey	Leopoldina.Alvey@secretresearch.tld	\N	2
1412	Cyril Croslen	Cyril.Croslen@secretresearch.tld	\N	2
1213	Zhona Aden	Zhona.Aden@secretresearch.tld	\N	2
2420	Aleydis Virgadamo	Aleydis.Virgadamo@secretresearch.tld	\N	2
876	Catharine Waltmann	Catharine.Waltmann@secretresearch.tld	\N	2
301	Tashiya Marrable	Tashiya.Marrable@secretresearch.tld	\N	2
339	Heidelinde Kosse	Heidelinde.Kosse@secretresearch.tld	\N	2
1583	Aleece Thorn	Aleece.Thorn@secretresearch.tld	\N	2
340	Rayyana Scollan	Rayyana.Scollan@secretresearch.tld	\N	2
581	Honey Eidinger	Honey.Eidinger@secretresearch.tld	\N	2
1862	Cato Himmelwright	Cato.Himmelwright@secretresearch.tld	\N	2
380	Gota Dorff	Gota.Dorff@secretresearch.tld	\N	2
460	Bernharda Riese	Bernharda.Riese@secretresearch.tld	\N	2
115	Vongfong Sowells	Vongfong.Sowells@secretresearch.tld	\N	2
828	Gwydion Gowans	Gwydion.Gowans@secretresearch.tld	\N	2
2147	Llwyr Fagerstrom	Llwyr.Fagerstrom@secretresearch.tld	\N	2
1409	Ryo Zanders	Ryo.Zanders@secretresearch.tld	\N	2
345	Okichi Spradlin	Okichi.Spradlin@secretresearch.tld	\N	2
82	Baptist Schubert	Baptist.Schubert@secretresearch.tld	\N	2
155	Blair Cappucci	Blair.Cappucci@secretresearch.tld	\N	2
604	Gisela Coric	Gisela.Coric@secretresearch.tld	\N	2
2270	Odgar Oguin	Odgar.Oguin@secretresearch.tld	\N	2
1709	Vyshia Waldall	Vyshia.Waldall@secretresearch.tld	\N	2
1829	Breana Scheffler	Breana.Scheffler@secretresearch.tld	\N	2
2043	Anbessa Gulde	Anbessa.Gulde@secretresearch.tld	\N	2
324	Vincenzio Compos	Vincenzio.Compos@secretresearch.tld	\N	2
341	Kallie Bednarek	Kallie.Bednarek@secretresearch.tld	\N	2
2173	Valerius Mcconnell	Valerius.Mcconnell@secretresearch.tld	\N	2
288	Nockten Outhier	Nockten.Outhier@secretresearch.tld	\N	2
1781	Stephonjia Hetjonk	Stephonjia.Hetjonk@secretresearch.tld	\N	2
1664	Tanja Lockmiller	Tanja.Lockmiller@secretresearch.tld	\N	2
735	Varun Fissori	Varun.Fissori@secretresearch.tld	\N	2
2065	Loleta Prevost	Loleta.Prevost@secretresearch.tld	\N	2
291	Carolann Lackland	Carolann.Lackland@secretresearch.tld	\N	2
833	Karlus Guardipee	Karlus.Guardipee@secretresearch.tld	\N	2
303	Faustine Agriesti	Faustine.Agriesti@secretresearch.tld	\N	2
895	Mudri Gamero	Mudri.Gamero@secretresearch.tld	\N	2
606	Briga Lyman	Briga.Lyman@secretresearch.tld	\N	2
2423	Kazuhiko Campas	Kazuhiko.Campas@secretresearch.tld	\N	2
605	Melitina Alviar	Melitina.Alviar@secretresearch.tld	\N	2
1459	Hellmuth Presley	Hellmuth.Presley@secretresearch.tld	\N	2
927	Aleksndra Roncskevitz	Aleksndra.Roncskevitz@secretresearch.tld	\N	2
2228	Vincenzo Baptist	Vincenzo.Baptist@secretresearch.tld	\N	2
782	Dorinda Cuchiara	Dorinda.Cuchiara@secretresearch.tld	\N	2
259	Chekhina Binkowski	Chekhina.Binkowski@secretresearch.tld	\N	2
2070	Fikriyya Siddiq	Fikriyya.Siddiq@secretresearch.tld	\N	2
821	Aedd Lurye	Aedd.Lurye@secretresearch.tld	\N	2
2229	Arcadia Granade	Arcadia.Granade@secretresearch.tld	\N	2
921	Swidbert Repka	Swidbert.Repka@secretresearch.tld	\N	2
86	Virgilio Englander	Virgilio.Englander@secretresearch.tld	\N	2
936	Bhavana Bartling	Bhavana.Bartling@secretresearch.tld	\N	2
623	Baucis Campese	Baucis.Campese@secretresearch.tld	\N	2
1462	Frederick Larabee	Frederick.Larabee@secretresearch.tld	\N	2
1591	Augusto Kempson	Augusto.Kempson@secretresearch.tld	\N	2
1106	Volotkoveia Klees	Volotkoveia.Klees@secretresearch.tld	\N	2
998	Ekantika Bisogno	Ekantika.Bisogno@secretresearch.tld	\N	2
2227	Vseslava Szollosi	Vseslava.Szollosi@secretresearch.tld	\N	2
1839	Donatella Doxie	Donatella.Doxie@secretresearch.tld	\N	2
1301	Miles Manero	Miles.Manero@secretresearch.tld	\N	2
182	LeVaughan Laity	LeVaughan.Laity@secretresearch.tld	\N	2
272	Shandee Finnicum	Shandee.Finnicum@secretresearch.tld	\N	2
1262	Favio Mutherspaw	Favio.Mutherspaw@secretresearch.tld	\N	2
275	Gianna Lomascolo	Gianna.Lomascolo@secretresearch.tld	\N	2
1051	Gisbert Tircuit	Gisbert.Tircuit@secretresearch.tld	\N	2
1071	Resaunna Swanagan	Resaunna.Swanagan@secretresearch.tld	\N	2
1891	Constantino Thielen	Constantino.Thielen@secretresearch.tld	\N	2
1073	Madaleno Bercier	Madaleno.Bercier@secretresearch.tld	\N	2
2017	Yitzchak Rudzik	Yitzchak.Rudzik@secretresearch.tld	\N	2
1394	Jurgisr Arkins	Jurgisr.Arkins@secretresearch.tld	\N	2
1198	Fedon Ryburn	Fedon.Ryburn@secretresearch.tld	\N	2
2595	Dobry Gentges	Dobry.Gentges@secretresearch.tld	\N	2
104	Annika Forson	Annika.Forson@secretresearch.tld	\N	2
184	Araceli Ertel	Araceli.Ertel@secretresearch.tld	\N	2
1013	Mawuli Weeks	Mawuli.Weeks@secretresearch.tld	\N	2
28	Zufar Pestoni	Zufar.Pestoni@secretresearch.tld	\N	2
785	Inocente Arntzen	Inocente.Arntzen@secretresearch.tld	\N	2
2624	Ruwaid Solian	Ruwaid.Solian@secretresearch.tld	\N	2
1542	Juro Scogin	Juro.Scogin@secretresearch.tld	\N	2
1357	Adeeb Drewski	Adeeb.Drewski@secretresearch.tld	\N	2
405	Kiraanna Scherping	Kiraanna.Scherping@secretresearch.tld	\N	2
1843	Sadahige Taglialatela	Sadahige.Taglialatela@secretresearch.tld	\N	2
896	Yeva Vilardo	Yeva.Vilardo@secretresearch.tld	\N	2
802	Larah Gallaga	Larah.Gallaga@secretresearch.tld	\N	2
2586	Laomedon Sotos	Laomedon.Sotos@secretresearch.tld	\N	2
2339	Anwar Katayama	Anwar.Katayama@secretresearch.tld	\N	2
2315	Tuhfa Pedez	Tuhfa.Pedez@secretresearch.tld	\N	2
1790	Bia Klemme	Bia.Klemme@secretresearch.tld	\N	2
1787	AbdulBaasid Chilvers	AbdulBaasid.Chilvers@secretresearch.tld	\N	2
1662	Vassily Gassoway	Vassily.Gassoway@secretresearch.tld	\N	2
1070	Emong Myatt	Emong.Myatt@secretresearch.tld	\N	2
488	AbdulWaahid Cornacchio	AbdulWaahid.Cornacchio@secretresearch.tld	\N	2
2692	Ran Rubendall	Ran.Rubendall@secretresearch.tld	\N	2
1518	Catrin Pretzel	Catrin.Pretzel@secretresearch.tld	\N	2
1204	Isha Quave	Isha.Quave@secretresearch.tld	\N	2
123	Larry Espejel	Larry.Espejel@secretresearch.tld	\N	2
1720	Wrata Breier	Wrata.Breier@secretresearch.tld	\N	2
549	GopiGopika Chaisty	GopiGopika.Chaisty@secretresearch.tld	\N	2
1217	Gritt Prestage	Gritt.Prestage@secretresearch.tld	\N	2
1468	Lorina Stangle	Lorina.Stangle@secretresearch.tld	\N	2
2910	Iveska Inacio	Iveska.Inacio@secretresearch.tld	\N	2
2533	Patrido Sielaff	Patrido.Sielaff@secretresearch.tld	\N	2
1946	Pancho Rowold	Pancho.Rowold@secretresearch.tld	\N	2
770	Castalia Ryser	Castalia.Ryser@secretresearch.tld	\N	2
53	Zumruda Fishman	Zumruda.Fishman@secretresearch.tld	\N	2
1123	Daeshona Hives	Daeshona.Hives@secretresearch.tld	\N	2
749	Fedyenka Terrasi	Fedyenka.Terrasi@secretresearch.tld	\N	2
2500	Cansu Hewitt	Cansu.Hewitt@secretresearch.tld	\N	2
1438	Vasilii Crowl	Vasilii.Crowl@secretresearch.tld	\N	2
887	Tahlia Francisque	Tahlia.Francisque@secretresearch.tld	\N	2
179	Nia Drakes	Nia.Drakes@secretresearch.tld	\N	2
2009	Tashira Mounkes	Tashira.Mounkes@secretresearch.tld	\N	2
767	Sakeen Kotheimer	Sakeen.Kotheimer@secretresearch.tld	\N	2
1541	Kerry Navarrate	Kerry.Navarrate@secretresearch.tld	\N	2
1727	Nene Rhea	Nene.Rhea@secretresearch.tld	\N	2
5	Iravati Pizzolato	Iravati.Pizzolato@secretresearch.tld	\N	2
71	Terao Asley	Terao.Asley@secretresearch.tld	\N	2
161	Oleka Tommasino	Oleka.Tommasino@secretresearch.tld	\N	2
217	Eshita Whitby	Eshita.Whitby@secretresearch.tld	\N	2
238	Fabiana Demase	Fabiana.Demase@secretresearch.tld	\N	2
248	Ciara Monroig	Ciara.Monroig@secretresearch.tld	\N	2
372	Marna Crookshanks	Marna.Crookshanks@secretresearch.tld	\N	2
412	Eskil Littledave	Eskil.Littledave@secretresearch.tld	\N	2
35	Anissa Sciarretta	Anissa.Sciarretta@secretresearch.tld	\N	2
497	Blanca Ursery	Blanca.Ursery@secretresearch.tld	\N	2
520	Angel Delcarmen	Angel.Delcarmen@secretresearch.tld	\N	2
99	Katryn Volmer	Katryn.Volmer@secretresearch.tld	\N	2
633	Nisus Coby	Nisus.Coby@secretresearch.tld	\N	2
652	Lakyta Soltis	Lakyta.Soltis@secretresearch.tld	\N	2
844	Gaspara Lowell	Gaspara.Lowell@secretresearch.tld	\N	2
544	Gualtiero Hemken	Gualtiero.Hemken@secretresearch.tld	\N	2
972	Tsumemasa Lloyd	Tsumemasa.Lloyd@secretresearch.tld	\N	2
875	Teuthras Koffman	Teuthras.Koffman@secretresearch.tld	\N	2
135	Candis Barefield	Candis.Barefield@secretresearch.tld	\N	2
1129	Utathya Kreig	Utathya.Kreig@secretresearch.tld	\N	2
38	Yae Timblin	Yae.Timblin@secretresearch.tld	\N	2
126	Tetsui Zekria	Tetsui.Zekria@secretresearch.tld	\N	2
199	Claudios Lemmert	Claudios.Lemmert@secretresearch.tld	\N	2
1245	Leonora Peli	Leonora.Peli@secretresearch.tld	\N	2
143	Matysh Segobia	Matysh.Segobia@secretresearch.tld	\N	2
319	YolandaAbigail Insogna	YolandaAbigail.Insogna@secretresearch.tld	\N	2
1476	Chantrelle Gruiger	Chantrelle.Gruiger@secretresearch.tld	\N	2
1507	Salaah Elio	Salaah.Elio@secretresearch.tld	\N	2
458	Roslava Ranum	Roslava.Ranum@secretresearch.tld	\N	2
1046	Binodini Bircher	Binodini.Bircher@secretresearch.tld	\N	2
316	Bibiane Eddens	Bibiane.Eddens@secretresearch.tld	\N	2
270	nthimos Heskett	nthimos.Heskett@secretresearch.tld	\N	2
470	Lonce Jiron	Lonce.Jiron@secretresearch.tld	\N	2
710	Kumi Belidor	Kumi.Belidor@secretresearch.tld	\N	2
137	Toshiro Serey	Toshiro.Serey@secretresearch.tld	\N	2
674	Editta Servoss	Editta.Servoss@secretresearch.tld	\N	2
1356	Timotheos Cazaree	Timotheos.Cazaree@secretresearch.tld	\N	2
1319	Graud Shuker	Graud.Shuker@secretresearch.tld	\N	2
1191	Sharisha Gebhart	Sharisha.Gebhart@secretresearch.tld	\N	2
1775	Richild Brinius	Richild.Brinius@secretresearch.tld	\N	2
144	Lex Hoven	Lex.Hoven@secretresearch.tld	\N	2
810	Jermaine Mandahl	Jermaine.Mandahl@secretresearch.tld	\N	2
129	Luca Dolbin	Luca.Dolbin@secretresearch.tld	\N	2
628	Govannon Starwalt	Govannon.Starwalt@secretresearch.tld	\N	2
1329	Adok Galbiso	Adok.Galbiso@secretresearch.tld	\N	2
1159	Montrel Hadley	Montrel.Hadley@secretresearch.tld	\N	2
111	Gayle Wingrove	Gayle.Wingrove@secretresearch.tld	\N	2
1276	Lippio Llopis	Lippio.Llopis@secretresearch.tld	\N	2
1473	ris Kotter	ris.Kotter@secretresearch.tld	\N	2
971	Wira Majette	Wira.Majette@secretresearch.tld	\N	2
382	Jaen Kerechanko	Jaen.Kerechanko@secretresearch.tld	\N	2
1193	Nana Stania	Nana.Stania@secretresearch.tld	\N	2
1427	Reiko Castile	Reiko.Castile@secretresearch.tld	\N	2
822	Haimo Huesso	Haimo.Huesso@secretresearch.tld	\N	2
1581	Marzooqa Stuermer	Marzooqa.Stuermer@secretresearch.tld	\N	2
146	Hadrian Homesley	Hadrian.Homesley@secretresearch.tld	\N	2
1050	Shijo Mccullon	Shijo.Mccullon@secretresearch.tld	\N	2
327	Erbin Quimet	Erbin.Quimet@secretresearch.tld	\N	2
180	Hilmiyya Pagon	Hilmiyya.Pagon@secretresearch.tld	\N	2
2272	Jenell Harlin	Jenell.Harlin@secretresearch.tld	\N	2
720	Antares Rancourt	Antares.Rancourt@secretresearch.tld	\N	2
2202	Faas Chitty	Faas.Chitty@secretresearch.tld	\N	2
289	Muneeb Borkoski	Muneeb.Borkoski@secretresearch.tld	\N	2
27	Jedrek Beutnagel	Jedrek.Beutnagel@secretresearch.tld	\N	2
64	Clivia Kuriger	Clivia.Kuriger@secretresearch.tld	\N	2
195	Egor Braue	Egor.Braue@secretresearch.tld	\N	2
88	Johanna Buttross	Johanna.Buttross@secretresearch.tld	\N	2
1310	Kichibei Opitz	Kichibei.Opitz@secretresearch.tld	\N	2
843	Casswallawn Scheiblich	Casswallawn.Scheiblich@secretresearch.tld	\N	2
348	Dodie Tedford	Dodie.Tedford@secretresearch.tld	\N	2
1186	Akila Terlizzi	Akila.Terlizzi@secretresearch.tld	\N	2
466	Latrice Ghrist	Latrice.Ghrist@secretresearch.tld	\N	2
36	Salamon Julien	Salamon.Julien@secretresearch.tld	\N	2
2026	Rhea Platas	Rhea.Platas@secretresearch.tld	\N	2
2323	Khadija Lagerquist	Khadija.Lagerquist@secretresearch.tld	\N	2
1179	Jakoba Bueche	Jakoba.Bueche@secretresearch.tld	\N	2
451	Agamemnon Bouras	Agamemnon.Bouras@secretresearch.tld	\N	2
1568	Christophine Welke	Christophine.Welke@secretresearch.tld	\N	2
336	Marira Igler	Marira.Igler@secretresearch.tld	\N	2
629	Terza Jaremka	Terza.Jaremka@secretresearch.tld	\N	2
1055	Varuna Rakers	Varuna.Rakers@secretresearch.tld	\N	2
323	Nawwaara Roary	Nawwaara.Roary@secretresearch.tld	\N	2
1192	Hoitsu Mccahill	Hoitsu.Mccahill@secretresearch.tld	\N	2
337	Tarrant Alsbrooks	Tarrant.Alsbrooks@secretresearch.tld	\N	2
1058	Bruna Nervis	Bruna.Nervis@secretresearch.tld	\N	2
1711	Primavera Huffstickler	Primavera.Huffstickler@secretresearch.tld	\N	2
107	Saalim Velasquez	Saalim.Velasquez@secretresearch.tld	\N	2
587	Masafumi Gipson	Masafumi.Gipson@secretresearch.tld	\N	2
2491	Mokichi Schayer	Mokichi.Schayer@secretresearch.tld	\N	2
1225	Brys Robak	Brys.Robak@secretresearch.tld	\N	2
330	LaVerne Musgrave	LaVerne.Musgrave@secretresearch.tld	\N	2
725	Jaime Hasencamp	Jaime.Hasencamp@secretresearch.tld	\N	2
1352	Myshka Krishnamurthy	Myshka.Krishnamurthy@secretresearch.tld	\N	2
1759	Deucalion Panahon	Deucalion.Panahon@secretresearch.tld	\N	2
23	Marulia Bondura	Marulia.Bondura@secretresearch.tld	\N	2
1678	Pyotr Giffen	Pyotr.Giffen@secretresearch.tld	\N	2
755	Glafira Geng	Glafira.Geng@secretresearch.tld	\N	2
874	Yumiko Ginther	Yumiko.Ginther@secretresearch.tld	\N	2
1260	Kaori Leasy	Kaori.Leasy@secretresearch.tld	\N	2
2350	Ingetrud Balezentis	Ingetrud.Balezentis@secretresearch.tld	\N	2
51	Friede Malcolm	Friede.Malcolm@secretresearch.tld	\N	2
584	Iasion Kirt	Iasion.Kirt@secretresearch.tld	\N	2
1419	Sibylla Reas	Sibylla.Reas@secretresearch.tld	\N	2
1092	AbdulGhafoor Mallie	AbdulGhafoor.Mallie@secretresearch.tld	\N	2
176	Shoichi Mathey	Shoichi.Mathey@secretresearch.tld	\N	2
349	Philoctetes Macmahon	Philoctetes.Macmahon@secretresearch.tld	\N	2
468	Vernon Niemela	Vernon.Niemela@secretresearch.tld	\N	2
290	Chey Prinzing	Chey.Prinzing@secretresearch.tld	\N	2
450	Erminia Damrell	Erminia.Damrell@secretresearch.tld	\N	2
403	Jeanine Garoner	Jeanine.Garoner@secretresearch.tld	\N	2
1025	Datja Carner	Datja.Carner@secretresearch.tld	\N	2
642	Eytan Dirth	Eytan.Dirth@secretresearch.tld	\N	2
516	Crysta Mateen	Crysta.Mateen@secretresearch.tld	\N	2
1602	Li Gotay	Li.Gotay@secretresearch.tld	\N	2
454	Andromeda Arvez	Andromeda.Arvez@secretresearch.tld	\N	2
753	Mikolas Sirman	Mikolas.Sirman@secretresearch.tld	\N	2
21	Coch Foulger	Coch.Foulger@secretresearch.tld	\N	2
449	Lottchen Pillitteri	Lottchen.Pillitteri@secretresearch.tld	\N	2
597	Liska Lambourne	Liska.Lambourne@secretresearch.tld	\N	2
777	Jamie Berrie	Jamie.Berrie@secretresearch.tld	\N	2
1369	Shaunene Libera	Shaunene.Libera@secretresearch.tld	\N	2
346	Martino Nommay	Martino.Nommay@secretresearch.tld	\N	2
329	Honami Docherty	Honami.Docherty@secretresearch.tld	\N	2
1690	Heraclio Haaf	Heraclio.Haaf@secretresearch.tld	\N	2
20	Erechtheus Muschick	Erechtheus.Muschick@secretresearch.tld	\N	2
809	Korekiyo Keilholz	Korekiyo.Keilholz@secretresearch.tld	\N	2
196	Kazushige Goeppner	Kazushige.Goeppner@secretresearch.tld	\N	2
808	Toyoaki Richoux	Toyoaki.Richoux@secretresearch.tld	\N	2
1098	Julien Triveno	Julien.Triveno@secretresearch.tld	\N	2
30	Sam Mattheis	Sam.Mattheis@secretresearch.tld	\N	2
47	Lene Vosquez	Lene.Vosquez@secretresearch.tld	\N	2
228	Amora Ockmond	Amora.Ockmond@secretresearch.tld	\N	2
197	Radosha Ferioli	Radosha.Ferioli@secretresearch.tld	\N	2
396	Matro Newell	Matro.Newell@secretresearch.tld	\N	2
66	Lecia Baumeister	Lecia.Baumeister@secretresearch.tld	\N	2
524	Dine Hazzard	Dine.Hazzard@secretresearch.tld	\N	2
177	Aristomnis Dauber	Aristomnis.Dauber@secretresearch.tld	\N	2
537	Julius Aluarez	Julius.Aluarez@secretresearch.tld	\N	2
592	Faatin Bonn	Faatin.Bonn@secretresearch.tld	\N	2
615	Vedetta Pilkins	Vedetta.Pilkins@secretresearch.tld	\N	2
676	Fanaila Torain	Fanaila.Torain@secretresearch.tld	\N	2
682	Elli Asner	Elli.Asner@secretresearch.tld	\N	2
121	Chiona Holstine	Chiona.Holstine@secretresearch.tld	\N	2
317	Sabina Conde	Sabina.Conde@secretresearch.tld	\N	2
902	Emese Abadie	Emese.Abadie@secretresearch.tld	\N	2
958	Kynan Huckaby	Kynan.Huckaby@secretresearch.tld	\N	2
992	Elvis Rocasah	Elvis.Rocasah@secretresearch.tld	\N	2
1015	Yurochka Hemmer	Yurochka.Hemmer@secretresearch.tld	\N	2
691	Luzinde Krabbe	Luzinde.Krabbe@secretresearch.tld	\N	2
1160	Roseann Ora	Roseann.Ora@secretresearch.tld	\N	2
1166	Aamurie Semonick	Aamurie.Semonick@secretresearch.tld	\N	2
116	Michinori Jerko	Michinori.Jerko@secretresearch.tld	\N	2
1214	Daunte Marn	Daunte.Marn@secretresearch.tld	\N	2
1257	Parma Borgese	Parma.Borgese@secretresearch.tld	\N	2
139	Karita Sukovich	Karita.Sukovich@secretresearch.tld	\N	2
1620	Cherry Dolence	Cherry.Dolence@secretresearch.tld	\N	2
1730	Anzhela Venturelli	Anzhela.Venturelli@secretresearch.tld	\N	2
1397	Julika Smar	Julika.Smar@secretresearch.tld	\N	2
886	Mayo Warsing	Mayo.Warsing@secretresearch.tld	\N	2
1350	Alberich Dougharity	Alberich.Dougharity@secretresearch.tld	\N	2
131	Lishka Turton	Lishka.Turton@secretresearch.tld	\N	2
1819	Francisco Feighner	Francisco.Feighner@secretresearch.tld	\N	2
46	Taaliba Debrita	Taaliba.Debrita@secretresearch.tld	\N	2
2469	Libera Ahlborn	Libera.Ahlborn@secretresearch.tld	\N	2
1220	Reno Garzia	Reno.Garzia@secretresearch.tld	\N	2
331	Rufio Guitard	Rufio.Guitard@secretresearch.tld	\N	2
279	Jace Ruotolo	Jace.Ruotolo@secretresearch.tld	\N	2
701	Andrew Coplen	Andrew.Coplen@secretresearch.tld	\N	2
2416	Adalia Manalo	Adalia.Manalo@secretresearch.tld	\N	2
335	Loremarie Zissler	Loremarie.Zissler@secretresearch.tld	\N	2
693	Cc Arroyos	Cc.Arroyos@secretresearch.tld	\N	2
560	Barsha Murrain	Barsha.Murrain@secretresearch.tld	\N	2
566	Elvera Zito	Elvera.Zito@secretresearch.tld	\N	2
433	Dinora Beza	Dinora.Beza@secretresearch.tld	\N	2
819	Letje Donald	Letje.Donald@secretresearch.tld	\N	2
2064	Yo Kadi	Yo.Kadi@secretresearch.tld	\N	2
169	Janile Arne	Janile.Arne@secretresearch.tld	\N	2
2178	Podolphe Fluitt	Podolphe.Fluitt@secretresearch.tld	\N	2
2160	Anda Palomino	Anda.Palomino@secretresearch.tld	\N	2
343	AbdulRauf Strothman	AbdulRauf.Strothman@secretresearch.tld	\N	2
1279	Aracely Kuka	Aracely.Kuka@secretresearch.tld	\N	2
2127	Khynika Borwig	Khynika.Borwig@secretresearch.tld	\N	2
2731	Mabon Meardon	Mabon.Meardon@secretresearch.tld	\N	2
1821	Marianne Dacquel	Marianne.Dacquel@secretresearch.tld	\N	2
1228	Thaaqib Skender	Thaaqib.Skender@secretresearch.tld	\N	2
2054	Pippo Nascimento	Pippo.Nascimento@secretresearch.tld	\N	2
2886	Stacy Higuchi	Stacy.Higuchi@secretresearch.tld	\N	2
358	Teodora Rumney	Teodora.Rumney@secretresearch.tld	\N	2
504	Doppo Kieser	Doppo.Kieser@secretresearch.tld	\N	2
1980	Avery Jeavons	Avery.Jeavons@secretresearch.tld	\N	2
983	Kaii Bedson	Kaii.Bedson@secretresearch.tld	\N	2
1325	Zenon Denes	Zenon.Denes@secretresearch.tld	\N	2
1302	Joey Yarboro	Joey.Yarboro@secretresearch.tld	\N	2
2385	Kulthum Liverance	Kulthum.Liverance@secretresearch.tld	\N	2
1750	Yemena Knebel	Yemena.Knebel@secretresearch.tld	\N	2
2125	Anatolii Trader	Anatolii.Trader@secretresearch.tld	\N	2
1582	Krushka Minner	Krushka.Minner@secretresearch.tld	\N	2
1815	Rei Marchio	Rei.Marchio@secretresearch.tld	\N	2
2094	Gamze Skalsky	Gamze.Skalsky@secretresearch.tld	\N	2
787	Caden Failing	Caden.Failing@secretresearch.tld	\N	2
1114	Karyna Joyner	Karyna.Joyner@secretresearch.tld	\N	2
956	AbdulHaadi Castellan	AbdulHaadi.Castellan@secretresearch.tld	\N	2
641	Taurino Lizarda	Taurino.Lizarda@secretresearch.tld	\N	2
622	Winand Poulton	Winand.Poulton@secretresearch.tld	\N	2
2241	Hanan Aupperle	Hanan.Aupperle@secretresearch.tld	\N	2
215	Yahya Kulacz	Yahya.Kulacz@secretresearch.tld	\N	2
2056	Luther Corral	Luther.Corral@secretresearch.tld	\N	2
1683	Eupeithes Bevens	Eupeithes.Bevens@secretresearch.tld	\N	2
1194	Mukhtaar Grewe	Mukhtaar.Grewe@secretresearch.tld	\N	2
2027	Christine Ehlke	Christine.Ehlke@secretresearch.tld	\N	2
712	Gwalchmei Halbert	Gwalchmei.Halbert@secretresearch.tld	\N	2
201	Taariq Cariaso	Taariq.Cariaso@secretresearch.tld	\N	2
943	Godalupe Gorrell	Godalupe.Gorrell@secretresearch.tld	\N	2
385	Vicenta Hemingway	Vicenta.Hemingway@secretresearch.tld	\N	2
1624	Hanka Henness	Hanka.Henness@secretresearch.tld	\N	2
308	Jared Torgersen	Jared.Torgersen@secretresearch.tld	\N	2
2954	Trinh Brihm	Trinh.Brihm@secretresearch.tld	\N	2
130	Takuboku Aicklen	Takuboku.Aicklen@secretresearch.tld	\N	2
686	Gulika Alipio	Gulika.Alipio@secretresearch.tld	\N	2
558	Diana Gulbranson	Diana.Gulbranson@secretresearch.tld	\N	2
154	Clmence Diop	Clmence.Diop@secretresearch.tld	\N	2
1761	Kobe Guttirez	Kobe.Guttirez@secretresearch.tld	\N	2
1959	Newa Sabina	Newa.Sabina@secretresearch.tld	\N	2
2661	Yuka Heikes	Yuka.Heikes@secretresearch.tld	\N	2
2617	Cady Schweizer	Cady.Schweizer@secretresearch.tld	\N	2
1227	Stve Rockwood	Stve.Rockwood@secretresearch.tld	\N	2
1882	Idurre Lagrave	Idurre.Lagrave@secretresearch.tld	\N	2
1603	Peleus Vasseur	Peleus.Vasseur@secretresearch.tld	\N	2
2286	Loreliese Aspri	Loreliese.Aspri@secretresearch.tld	\N	2
877	Natascha Neverson	Natascha.Neverson@secretresearch.tld	\N	2
1900	Ake Crowson	Ake.Crowson@secretresearch.tld	\N	2
1004	Laiurenty Ponzi	Laiurenty.Ponzi@secretresearch.tld	\N	2
3007	Aidia Leidel	Aidia.Leidel@secretresearch.tld	\N	2
1877	Saahir Muto	Saahir.Muto@secretresearch.tld	\N	2
1803	Donzel Hohman	Donzel.Hohman@secretresearch.tld	\N	2
2247	Holda Dible	Holda.Dible@secretresearch.tld	\N	2
2699	Juichi Porep	Juichi.Porep@secretresearch.tld	\N	2
2927	Kozue Efthimiou	Kozue.Efthimiou@secretresearch.tld	\N	2
305	Nyusha Karns	Nyusha.Karns@secretresearch.tld	\N	2
2504	Almut Cargill	Almut.Cargill@secretresearch.tld	\N	2
2181	Heihachiro Parthemer	Heihachiro.Parthemer@secretresearch.tld	\N	2
1495	Vesna Pirkey	Vesna.Pirkey@secretresearch.tld	\N	2
2188	Ebizo Mincher	Ebizo.Mincher@secretresearch.tld	\N	2
2174	Elenya Oksen	Elenya.Oksen@secretresearch.tld	\N	2
2242	Maksim Kasuba	Maksim.Kasuba@secretresearch.tld	\N	2
2552	Evi Heidebrecht	Evi.Heidebrecht@secretresearch.tld	\N	2
1180	Tamary Nici	Tamary.Nici@secretresearch.tld	\N	2
923	Dewi Rappleyea	Dewi.Rappleyea@secretresearch.tld	\N	2
1580	Ayushmati Appelgren	Ayushmati.Appelgren@secretresearch.tld	\N	2
1275	Lashaune Lava	Lashaune.Lava@secretresearch.tld	\N	2
1869	Sander Garriss	Sander.Garriss@secretresearch.tld	\N	2
1402	Jokin Hytros	Jokin.Hytros@secretresearch.tld	\N	2
2366	Viktor Farrior	Viktor.Farrior@secretresearch.tld	\N	2
2520	Noel Grass	Noel.Grass@secretresearch.tld	\N	2
1522	Kyledyr Constantino	Kyledyr.Constantino@secretresearch.tld	\N	2
174	Ephrem Ruddle	Ephrem.Ruddle@secretresearch.tld	\N	2
911	Rgine Neibert	Rgine.Neibert@secretresearch.tld	\N	2
2562	Bennet Melendes	Bennet.Melendes@secretresearch.tld	\N	2
2003	Usaama Greiser	Usaama.Greiser@secretresearch.tld	\N	2
1615	Ebony Zieg	Ebony.Zieg@secretresearch.tld	\N	2
401	Yoshino Mohomed	Yoshino.Mohomed@secretresearch.tld	\N	2
2349	Sherry Mullennix	Sherry.Mullennix@secretresearch.tld	\N	2
1590	Cornelius Dolak	Cornelius.Dolak@secretresearch.tld	\N	2
1835	Zaamil Mirra	Zaamil.Mirra@secretresearch.tld	\N	2
964	Reginbald Aggas	Reginbald.Aggas@secretresearch.tld	\N	2
54	Krosa Kuney	Krosa.Kuney@secretresearch.tld	\N	2
1677	Stone Reigner	Stone.Reigner@secretresearch.tld	\N	2
2592	Ztrezena Gutman	Ztrezena.Gutman@secretresearch.tld	\N	2
794	Kanan Snowdon	Kanan.Snowdon@secretresearch.tld	\N	2
2531	Twain Sannon	Twain.Sannon@secretresearch.tld	\N	2
445	Malcolm Voelz	Malcolm.Voelz@secretresearch.tld	\N	2
1524	Girija May	Girija.May@secretresearch.tld	\N	2
928	Vas Dy	Vas.Dy@secretresearch.tld	\N	2
13	Nikkylia Foutz	Nikkylia.Foutz@secretresearch.tld	\N	2
738	Valter Soldner	Valter.Soldner@secretresearch.tld	\N	2
2377	Adolfo Kick	Adolfo.Kick@secretresearch.tld	\N	2
1312	Ximena Capan	Ximena.Capan@secretresearch.tld	\N	2
1529	Agislaos Lamoreaux	Agislaos.Lamoreaux@secretresearch.tld	\N	2
83	Kea Croshaw	Kea.Croshaw@secretresearch.tld	\N	2
227	Sho Stechlinski	Sho.Stechlinski@secretresearch.tld	\N	2
1933	Saleema Jurasek	Saleema.Jurasek@secretresearch.tld	\N	2
1854	Izarra Zackery	Izarra.Zackery@secretresearch.tld	\N	2
961	Dandrae Dorne	Dandrae.Dorne@secretresearch.tld	\N	2
2321	Suhaila Berez	Suhaila.Berez@secretresearch.tld	\N	2
19	Jenna Ovit	Jenna.Ovit@secretresearch.tld	\N	2
858	Wendell Rolens	Wendell.Rolens@secretresearch.tld	\N	2
1505	Katsumoto Tarbert	Katsumoto.Tarbert@secretresearch.tld	\N	2
1436	Glikeriia Mushrush	Glikeriia.Mushrush@secretresearch.tld	\N	2
1801	Lucrecia Rollings	Lucrecia.Rollings@secretresearch.tld	\N	2
67	Riddhi Colesar	Riddhi.Colesar@secretresearch.tld	\N	2
432	Annnees Kain	Annnees.Kain@secretresearch.tld	\N	2
1425	Ryzard Auchmoody	Ryzard.Auchmoody@secretresearch.tld	\N	2
761	Houke Luthe	Houke.Luthe@secretresearch.tld	\N	2
1629	Sama Beukema	Sama.Beukema@secretresearch.tld	\N	2
1321	Arvel Tindle	Arvel.Tindle@secretresearch.tld	\N	2
929	Alonza Galyan	Alonza.Galyan@secretresearch.tld	\N	2
1039	Dashay Stclair	Dashay.Stclair@secretresearch.tld	\N	2
1503	Darian Jill	Darian.Jill@secretresearch.tld	\N	2
1390	Pippino Kempner	Pippino.Kempner@secretresearch.tld	\N	2
2129	Haley Lotempio	Haley.Lotempio@secretresearch.tld	\N	2
1744	Warona Pelligrino	Warona.Pelligrino@secretresearch.tld	\N	2
1382	Thanaa Bustos	Thanaa.Bustos@secretresearch.tld	\N	2
2449	Mabel Gaito	Mabel.Gaito@secretresearch.tld	\N	2
2051	Liebtraud Schorsch	Liebtraud.Schorsch@secretresearch.tld	\N	2
1056	Adelaide Certosimo	Adelaide.Certosimo@secretresearch.tld	\N	2
731	Enar Nordlinger	Enar.Nordlinger@secretresearch.tld	\N	2
1101	Taliyah Jafari	Taliyah.Jafari@secretresearch.tld	\N	2
333	Haruhiko Tindell	Haruhiko.Tindell@secretresearch.tld	\N	2
1773	Teodoro Coyt	Teodoro.Coyt@secretresearch.tld	\N	2
1242	Wouter Mowbray	Wouter.Mowbray@secretresearch.tld	\N	2
355	Vashan Flener	Vashan.Flener@secretresearch.tld	\N	2
1009	Lillian Rehbein	Lillian.Rehbein@secretresearch.tld	\N	2
1517	Addi Rinks	Addi.Rinks@secretresearch.tld	\N	2
1739	Sasson Kniffin	Sasson.Kniffin@secretresearch.tld	\N	2
1300	Lilja Siwiec	Lilja.Siwiec@secretresearch.tld	\N	2
937	Isotta Holsey	Isotta.Holsey@secretresearch.tld	\N	2
435	Inez Meeroff	Inez.Meeroff@secretresearch.tld	\N	2
1143	Masazumi Chuta	Masazumi.Chuta@secretresearch.tld	\N	2
826	Kywrkh Tomaino	Kywrkh.Tomaino@secretresearch.tld	\N	2
1045	Cant Kammerzell	Cant.Kammerzell@secretresearch.tld	\N	2
482	Kent Taurino	Kent.Taurino@secretresearch.tld	\N	2
260	Aldona Sichel	Aldona.Sichel@secretresearch.tld	\N	2
514	Hamsa Hielscher	Hamsa.Hielscher@secretresearch.tld	\N	2
281	Goring Francour	Goring.Francour@secretresearch.tld	\N	2
1061	Carinna Bridget	Carinna.Bridget@secretresearch.tld	\N	2
342	Analeigh Sebring	Analeigh.Sebring@secretresearch.tld	\N	2
1414	Che Kess	Che.Kess@secretresearch.tld	\N	2
1561	Latasha Warens	Latasha.Warens@secretresearch.tld	\N	2
366	Manu Geyman	Manu.Geyman@secretresearch.tld	\N	2
2117	Padma Ramaker	Padma.Ramaker@secretresearch.tld	\N	2
909	Umaima Mcandrews	Umaima.Mcandrews@secretresearch.tld	\N	2
2300	Hortense Ganotisi	Hortense.Ganotisi@secretresearch.tld	\N	2
347	Junichi Hagele	Junichi.Hagele@secretresearch.tld	\N	2
96	Amir Conkling	Amir.Conkling@secretresearch.tld	\N	2
1355	Eber Ebinger	Eber.Ebinger@secretresearch.tld	\N	2
2926	Namiko Leval	Namiko.Leval@secretresearch.tld	\N	2
663	Fahroni Anglea	Fahroni.Anglea@secretresearch.tld	\N	2
1496	Abhigna Furman	Abhigna.Furman@secretresearch.tld	\N	2
2428	Elwira Gasper	Elwira.Gasper@secretresearch.tld	\N	2
2189	Dukinea Zmijewski	Dukinea.Zmijewski@secretresearch.tld	\N	2
2973	Finn Carboneau	Finn.Carboneau@secretresearch.tld	\N	2
2607	Lisil Hellmuth	Lisil.Hellmuth@secretresearch.tld	\N	2
706	Vilena Orillion	Vilena.Orillion@secretresearch.tld	\N	2
1359	Dwight Brauman	Dwight.Brauman@secretresearch.tld	\N	2
273	Yoyon Lecroy	Yoyon.Lecroy@secretresearch.tld	\N	2
1594	Takehide Gauna	Takehide.Gauna@secretresearch.tld	\N	2
1528	Raimundo Wetklow	Raimundo.Wetklow@secretresearch.tld	\N	2
2152	Lisandro Harpst	Lisandro.Harpst@secretresearch.tld	\N	2
2490	Keyna Maisonet	Keyna.Maisonet@secretresearch.tld	\N	2
1793	Anandita Hymer	Anandita.Hymer@secretresearch.tld	\N	2
226	PavIpv Howick	PavIpv.Howick@secretresearch.tld	\N	2
384	Evdxios Fageraes	Evdxios.Fageraes@secretresearch.tld	\N	2
1020	Jelawat Balletta	Jelawat.Balletta@secretresearch.tld	\N	2
1021	Kuemon Coatie	Kuemon.Coatie@secretresearch.tld	\N	2
457	Leonel Meche	Leonel.Meche@secretresearch.tld	\N	2
816	Prospero Waner	Prospero.Waner@secretresearch.tld	\N	2
1502	Ison Wojtanowski	Ison.Wojtanowski@secretresearch.tld	\N	2
2072	Thomasa Vasconcelos	Thomasa.Vasconcelos@secretresearch.tld	\N	2
1332	Jedrick Relacion	Jedrick.Relacion@secretresearch.tld	\N	2
1458	Gregos Beltrain	Gregos.Beltrain@secretresearch.tld	\N	2
407	Carevel Tardif	Carevel.Tardif@secretresearch.tld	\N	2
91	Gebert Kercher	Gebert.Kercher@secretresearch.tld	\N	2
2721	Mazcho Stringer	Mazcho.Stringer@secretresearch.tld	\N	2
800	Bodgana Senne	Bodgana.Senne@secretresearch.tld	\N	2
2756	Satomi Lampitt	Satomi.Lampitt@secretresearch.tld	\N	2
2528	Blossom Quero	Blossom.Quero@secretresearch.tld	\N	2
189	Mitsuo Neff	Mitsuo.Neff@secretresearch.tld	\N	2
1637	Sela Funnye	Sela.Funnye@secretresearch.tld	\N	2
1596	Elzbeta Mieloszyk	Elzbeta.Mieloszyk@secretresearch.tld	\N	2
882	Gerty Tokich	Gerty.Tokich@secretresearch.tld	\N	2
917	Radha Sloan	Radha.Sloan@secretresearch.tld	\N	2
1526	Abdul Spicer	Abdul.Spicer@secretresearch.tld	\N	2
2198	Traviata Tewksbury	Traviata.Tewksbury@secretresearch.tld	\N	2
2135	Maxime Higgs	Maxime.Higgs@secretresearch.tld	\N	2
1868	Sozui Jalovel	Sozui.Jalovel@secretresearch.tld	\N	2
907	Dora Brisbone	Dora.Brisbone@secretresearch.tld	\N	2
48	Dmitreeva Ellsbury	Dmitreeva.Ellsbury@secretresearch.tld	\N	2
838	Ulia Kaines	Ulia.Kaines@secretresearch.tld	\N	2
2783	Camika Montilla	Camika.Montilla@secretresearch.tld	\N	2
733	Madelynn Hoehn	Madelynn.Hoehn@secretresearch.tld	\N	2
1562	Saeko Rachar	Saeko.Rachar@secretresearch.tld	\N	2
2235	Anka Pindell	Anka.Pindell@secretresearch.tld	\N	2
2623	Valerik Peles	Valerik.Peles@secretresearch.tld	\N	2
353	Talicia Korsen	Talicia.Korsen@secretresearch.tld	\N	2
1996	Sameera Beazley	Sameera.Beazley@secretresearch.tld	\N	2
1267	Boje Ostrum	Boje.Ostrum@secretresearch.tld	\N	2
1255	Rocky Brierre	Rocky.Brierre@secretresearch.tld	\N	2
775	Nazarova Abundis	Nazarova.Abundis@secretresearch.tld	\N	2
0	Avigdor Puglia	Avigdor.Puglia@secretresearch.tld	\N	2
2426	Apelino Reeber	Apelino.Reeber@secretresearch.tld	\N	2
535	Juthe Bentson	Juthe.Bentson@secretresearch.tld	\N	2
915	Addison Bovio	Addison.Bovio@secretresearch.tld	\N	2
2016	Hagibis Kihn	Hagibis.Kihn@secretresearch.tld	\N	2
572	Sebastiano Lockyer	Sebastiano.Lockyer@secretresearch.tld	\N	2
352	Uliana Fanning	Uliana.Fanning@secretresearch.tld	\N	2
2212	Ajanta Mischel	Ajanta.Mischel@secretresearch.tld	\N	2
1734	Gengyo Cumbass	Gengyo.Cumbass@secretresearch.tld	\N	2
2050	Majdiyya Bonsall	Majdiyya.Bonsall@secretresearch.tld	\N	2
1307	Daris Astley	Daris.Astley@secretresearch.tld	\N	2
1565	Earlena Heimlicher	Earlena.Heimlicher@secretresearch.tld	\N	2
2566	Raina Hermandez	Raina.Hermandez@secretresearch.tld	\N	2
2473	Zdeslava Barkus	Zdeslava.Barkus@secretresearch.tld	\N	2
1158	Ewiniar Mouret	Ewiniar.Mouret@secretresearch.tld	\N	2
801	Roxanne Vandezande	Roxanne.Vandezande@secretresearch.tld	\N	2
2264	Maiya Viars	Maiya.Viars@secretresearch.tld	\N	2
1642	Vasilista Hamic	Vasilista.Hamic@secretresearch.tld	\N	2
3012	Mutammam Bowersox	Mutammam.Bowersox@secretresearch.tld	\N	2
2735	Hedda Yoshida	Hedda.Yoshida@secretresearch.tld	\N	2
357	Denes Wahlert	Denes.Wahlert@secretresearch.tld	\N	2
2513	Matashichi Butman	Matashichi.Butman@secretresearch.tld	\N	2
2104	Anandamayi Clerf	Anandamayi.Clerf@secretresearch.tld	\N	2
2495	Roland Kegler	Roland.Kegler@secretresearch.tld	\N	2
661	Edmondo Rommelfanger	Edmondo.Rommelfanger@secretresearch.tld	\N	2
1688	Kaspar Reierson	Kaspar.Reierson@secretresearch.tld	\N	2
2556	AbdulQuddoos Mccallie	AbdulQuddoos.Mccallie@secretresearch.tld	\N	2
1366	Rashan Huyard	Rashan.Huyard@secretresearch.tld	\N	2
2737	Giovanna Douthit	Giovanna.Douthit@secretresearch.tld	\N	2
2871	Judyta Solymani	Judyta.Solymani@secretresearch.tld	\N	2
1076	Hilario Kovats	Hilario.Kovats@secretresearch.tld	\N	2
2603	Fokina Poythress	Fokina.Poythress@secretresearch.tld	\N	2
1064	Oscar Formica	Oscar.Formica@secretresearch.tld	\N	2
2164	Trish Kurnik	Trish.Kurnik@secretresearch.tld	\N	2
1519	Matteo Mestre	Matteo.Mestre@secretresearch.tld	\N	2
2921	Charmaine Rubick	Charmaine.Rubick@secretresearch.tld	\N	2
1879	Imre Muellner	Imre.Muellner@secretresearch.tld	\N	2
2689	Iha Em	Iha.Em@secretresearch.tld	\N	2
1797	Sumie Stamdifer	Sumie.Stamdifer@secretresearch.tld	\N	2
2119	Ghana Reppucci	Ghana.Reppucci@secretresearch.tld	\N	2
2161	Akinari Muston	Akinari.Muston@secretresearch.tld	\N	2
941	Clarice Tillberg	Clarice.Tillberg@secretresearch.tld	\N	2
567	Kara Shuttlesworth	Kara.Shuttlesworth@secretresearch.tld	\N	2
2476	Tandu Miltenberger	Tandu.Miltenberger@secretresearch.tld	\N	2
1102	Donald Ludlow	Donald.Ludlow@secretresearch.tld	\N	2
2846	Davida Rho	Davida.Rho@secretresearch.tld	\N	2
856	Emina Yeeloy	Emina.Yeeloy@secretresearch.tld	\N	2
1911	Arno Barquera	Arno.Barquera@secretresearch.tld	\N	2
1914	Tishka Zale	Tishka.Zale@secretresearch.tld	\N	2
766	Sonechka Matye	Sonechka.Matye@secretresearch.tld	\N	2
859	Lotta Francoise	Lotta.Francoise@secretresearch.tld	\N	2
2750	Karlene Bilello	Karlene.Bilello@secretresearch.tld	\N	2
1987	Eliazar Manner	Eliazar.Manner@secretresearch.tld	\N	2
2200	Astrios Purrington	Astrios.Purrington@secretresearch.tld	\N	2
721	Aida Appelt	Aida.Appelt@secretresearch.tld	\N	2
209	Clarine Waynick	Clarine.Waynick@secretresearch.tld	\N	2
1807	Deniz Medler	Deniz.Medler@secretresearch.tld	\N	2
2483	Ilyaas Hipsley	Ilyaas.Hipsley@secretresearch.tld	\N	2
2399	Sofeia Schmick	Sofeia.Schmick@secretresearch.tld	\N	2
1873	Dardanus Dobosh	Dardanus.Dobosh@secretresearch.tld	\N	2
3043	Aberthol Wilczak	Aberthol.Wilczak@secretresearch.tld	\N	2
2571	Xuqiu Deller	Xuqiu.Deller@secretresearch.tld	\N	2
2739	Hariti Yerdon	Hariti.Yerdon@secretresearch.tld	\N	2
359	Lauranne Brwon	Lauranne.Brwon@secretresearch.tld	\N	2
756	Muni Mccuiston	Muni.Mccuiston@secretresearch.tld	\N	2
2706	Raaid Chrispen	Raaid.Chrispen@secretresearch.tld	\N	2
2998	Gerion Sonoski	Gerion.Sonoski@secretresearch.tld	\N	2
644	Livia Colosimo	Livia.Colosimo@secretresearch.tld	\N	2
443	Naazil Buchannan	Naazil.Buchannan@secretresearch.tld	\N	2
2012	Bhavin Primavera	Bhavin.Primavera@secretresearch.tld	\N	2
2960	Shiko Seagroves	Shiko.Seagroves@secretresearch.tld	\N	2
2144	Ethelgard Karpinsky	Ethelgard.Karpinsky@secretresearch.tld	\N	2
2525	Bodil Korinta	Bodil.Korinta@secretresearch.tld	\N	2
1611	Vychan Stotz	Vychan.Stotz@secretresearch.tld	\N	2
2219	Yukako Klingbeil	Yukako.Klingbeil@secretresearch.tld	\N	2
2006	Katreen Osthoff	Katreen.Osthoff@secretresearch.tld	\N	2
884	Benito Tam	Benito.Tam@secretresearch.tld	\N	2
747	Korotsek Baltzell	Korotsek.Baltzell@secretresearch.tld	\N	2
1991	Kantha Lybert	Kantha.Lybert@secretresearch.tld	\N	2
2328	Coby Smaller	Coby.Smaller@secretresearch.tld	\N	2
1087	Oryan Mirles	Oryan.Mirles@secretresearch.tld	\N	2
112	Vladlena Tlumacki	Vladlena.Tlumacki@secretresearch.tld	\N	2
673	Jazmine Susman	Jazmine.Susman@secretresearch.tld	\N	2
1018	Lasil Legum	Lasil.Legum@secretresearch.tld	\N	2
836	Argus Bierwirth	Argus.Bierwirth@secretresearch.tld	\N	2
1465	Nathanael Better	Nathanael.Better@secretresearch.tld	\N	2
935	Callista Bernstrom	Callista.Bernstrom@secretresearch.tld	\N	2
713	Stacie Ciesielski	Stacie.Ciesielski@secretresearch.tld	\N	2
1439	Juri Guzik	Juri.Guzik@secretresearch.tld	\N	2
1069	Mercede Naslund	Mercede.Naslund@secretresearch.tld	\N	2
2589	Vasileva Rugg	Vasileva.Rugg@secretresearch.tld	\N	2
734	Auring Phanord	Auring.Phanord@secretresearch.tld	\N	2
1948	Juriaan Schremp	Juriaan.Schremp@secretresearch.tld	\N	2
1323	Liviana Rickon	Liviana.Rickon@secretresearch.tld	\N	2
551	Shadhaa Gomillion	Shadhaa.Gomillion@secretresearch.tld	\N	2
1765	Calida Starace	Calida.Starace@secretresearch.tld	\N	2
118	AnnCathrin Axel	AnnCathrin.Axel@secretresearch.tld	\N	2
1378	JamAan Kine	JamAan.Kine@secretresearch.tld	\N	2
2763	Tsutomu Atzinger	Tsutomu.Atzinger@secretresearch.tld	\N	2
2782	Ovidio Bostrom	Ovidio.Bostrom@secretresearch.tld	\N	2
1493	Tiun Hussien	Tiun.Hussien@secretresearch.tld	\N	2
627	Hellmut Tousant	Hellmut.Tousant@secretresearch.tld	\N	2
1758	Javier Hausauer	Javier.Hausauer@secretresearch.tld	\N	2
1852	Jelisaweta Ambroziak	Jelisaweta.Ambroziak@secretresearch.tld	\N	2
93	Naadiya Maslyn	Naadiya.Maslyn@secretresearch.tld	\N	2
2619	Ilsegret Akerley	Ilsegret.Akerley@secretresearch.tld	\N	2
1218	Hita Porell	Hita.Porell@secretresearch.tld	\N	2
1403	Carson Skagen	Carson.Skagen@secretresearch.tld	\N	2
2256	Hareem Rollo	Hareem.Rollo@secretresearch.tld	\N	2
620	Natasia Sliter	Natasia.Sliter@secretresearch.tld	\N	2
1745	Maysak Anetsberger	Maysak.Anetsberger@secretresearch.tld	\N	2
257	Rintaro Axson	Rintaro.Axson@secretresearch.tld	\N	2
213	Cursetta Isa	Cursetta.Isa@secretresearch.tld	\N	2
147	Afyia Gines	Afyia.Gines@secretresearch.tld	\N	2
2107	Izazkun Suleski	Izazkun.Suleski@secretresearch.tld	\N	2
1971	Wolfhelm Abella	Wolfhelm.Abella@secretresearch.tld	\N	2
2418	Suphachad Tham	Suphachad.Tham@secretresearch.tld	\N	2
2729	Ernst Bengtson	Ernst.Bengtson@secretresearch.tld	\N	2
1888	Nomi Rosato	Nomi.Rosato@secretresearch.tld	\N	2
1648	Irminwin Milloy	Irminwin.Milloy@secretresearch.tld	\N	2
1748	Satoru Beaumont	Satoru.Beaumont@secretresearch.tld	\N	2
561	Sadayoshi Englemann	Sadayoshi.Englemann@secretresearch.tld	\N	2
1446	Faith Neeld	Faith.Neeld@secretresearch.tld	\N	2
205	Melvina Grant	Melvina.Grant@secretresearch.tld	\N	2
212	Josianne Gopen	Josianne.Gopen@secretresearch.tld	\N	2
1244	Teriuihi Lachner	Teriuihi.Lachner@secretresearch.tld	\N	2
1052	Susan Altidor	Susan.Altidor@secretresearch.tld	\N	2
2302	Razan Symons	Razan.Symons@secretresearch.tld	\N	2
1918	Mesha Kornrumpf	Mesha.Kornrumpf@secretresearch.tld	\N	2
2345	Triesha Carland	Triesha.Carland@secretresearch.tld	\N	2
719	Sigurd Mahli	Sigurd.Mahli@secretresearch.tld	\N	2
2118	Fulko Pullen	Fulko.Pullen@secretresearch.tld	\N	2
2096	Evamarie Coraham	Evamarie.Coraham@secretresearch.tld	\N	2
589	Meena Riegel	Meena.Riegel@secretresearch.tld	\N	2
476	Adela Westcote	Adela.Westcote@secretresearch.tld	\N	2
1054	Iarogned Trivette	Iarogned.Trivette@secretresearch.tld	\N	2
57	Hasnaa Sietsema	Hasnaa.Sietsema@secretresearch.tld	\N	2
1112	Shaakira Ricklefs	Shaakira.Ricklefs@secretresearch.tld	\N	2
571	Masakazu Lisko	Masakazu.Lisko@secretresearch.tld	\N	2
2679	Alyss Wuitschick	Alyss.Wuitschick@secretresearch.tld	\N	2
1658	Alessandra Kellar	Alessandra.Kellar@secretresearch.tld	\N	2
2244	Basheer Hatcher	Basheer.Hatcher@secretresearch.tld	\N	2
791	Zenalisa Delisle	Zenalisa.Delisle@secretresearch.tld	\N	2
387	Laurena Rednour	Laurena.Rednour@secretresearch.tld	\N	2
1343	Bezubaia Wiece	Bezubaia.Wiece@secretresearch.tld	\N	2
2431	Saer Dillenbeck	Saer.Dillenbeck@secretresearch.tld	\N	2
2032	Janne Efurd	Janne.Efurd@secretresearch.tld	\N	2
101	Oles Sumaran	Oles.Sumaran@secretresearch.tld	\N	2
1339	Mamelfa Learned	Mamelfa.Learned@secretresearch.tld	\N	2
1293	Greg Weatherly	Greg.Weatherly@secretresearch.tld	\N	2
697	Dhaki Etchinson	Dhaki.Etchinson@secretresearch.tld	\N	2
1223	Raimund Widdowson	Raimund.Widdowson@secretresearch.tld	\N	2
1084	Guido Genier	Guido.Genier@secretresearch.tld	\N	2
464	Loris Elder	Loris.Elder@secretresearch.tld	\N	2
951	Aintzane Lurry	Aintzane.Lurry@secretresearch.tld	\N	2
427	Mamika Blakstad	Mamika.Blakstad@secretresearch.tld	\N	2
1068	Eldon Ulatowski	Eldon.Ulatowski@secretresearch.tld	\N	2
157	Mayumi Vaneaton	Mayumi.Vaneaton@secretresearch.tld	\N	2
1136	Peadair Lann	Peadair.Lann@secretresearch.tld	\N	2
2145	Edda Fenchel	Edda.Fenchel@secretresearch.tld	\N	2
45	Maureo Benedict	Maureo.Benedict@secretresearch.tld	\N	2
1348	Pasha Bevilaqua	Pasha.Bevilaqua@secretresearch.tld	\N	2
440	Katyushka Gabriele	Katyushka.Gabriele@secretresearch.tld	\N	2
295	Brandy Beaudoin	Brandy.Beaudoin@secretresearch.tld	\N	2
1904	Anchita Figlar	Anchita.Figlar@secretresearch.tld	\N	2
1322	Galla Arnzen	Galla.Arnzen@secretresearch.tld	\N	2
294	Takuma Moncur	Takuma.Moncur@secretresearch.tld	\N	2
2004	Danaus Dacanay	Danaus.Dacanay@secretresearch.tld	\N	2
2063	Hilary Braddy	Hilary.Braddy@secretresearch.tld	\N	2
883	Lucero Companie	Lucero.Companie@secretresearch.tld	\N	2
2076	Gyorgy Clancy	Gyorgy.Clancy@secretresearch.tld	\N	2
1048	Yachne Piersall	Yachne.Piersall@secretresearch.tld	\N	2
2612	lkisti Dayne	lkisti.Dayne@secretresearch.tld	\N	2
1520	Amalia Krajcik	Amalia.Krajcik@secretresearch.tld	\N	2
1053	Rosa Navor	Rosa.Navor@secretresearch.tld	\N	2
328	Koko Borgstrom	Koko.Borgstrom@secretresearch.tld	\N	2
645	Bahar Banter	Bahar.Banter@secretresearch.tld	\N	2
1681	Bowen Antunez	Bowen.Antunez@secretresearch.tld	\N	2
128	Erichthonius Grulkey	Erichthonius.Grulkey@secretresearch.tld	\N	2
839	Clarinda Oberg	Clarinda.Oberg@secretresearch.tld	\N	2
1429	Tamiko Docken	Tamiko.Docken@secretresearch.tld	\N	2
743	Helene Nik	Helene.Nik@secretresearch.tld	\N	2
1376	Dores Hugi	Dores.Hugi@secretresearch.tld	\N	2
1475	Kim Colombe	Kim.Colombe@secretresearch.tld	\N	2
1593	Melisa Patriarco	Melisa.Patriarco@secretresearch.tld	\N	2
141	Flora Aveni	Flora.Aveni@secretresearch.tld	\N	2
784	Tramaine Scruton	Tramaine.Scruton@secretresearch.tld	\N	2
2066	Juanisha Seppi	Juanisha.Seppi@secretresearch.tld	\N	2
2655	Wasmaaa Roen	Wasmaaa.Roen@secretresearch.tld	\N	2
2669	Heidelore Ruschmann	Heidelore.Ruschmann@secretresearch.tld	\N	2
2638	Silvester Yelvington	Silvester.Yelvington@secretresearch.tld	\N	2
1060	Ludolfina Hinley	Ludolfina.Hinley@secretresearch.tld	\N	2
1266	Adrien Hoit	Adrien.Hoit@secretresearch.tld	\N	2
585	Takako Nordine	Takako.Nordine@secretresearch.tld	\N	2
214	Ashlie Barnak	Ashlie.Barnak@secretresearch.tld	\N	2
1905	Tino Mendonsa	Tino.Mendonsa@secretresearch.tld	\N	2
1364	Raisa Kollar	Raisa.Kollar@secretresearch.tld	\N	2
1049	Kache Reissig	Kache.Reissig@secretresearch.tld	\N	2
702	Chesell Vatter	Chesell.Vatter@secretresearch.tld	\N	2
39	Nolan Brownle	Nolan.Brownle@secretresearch.tld	\N	2
1550	Angha Bievenue	Angha.Bievenue@secretresearch.tld	\N	2
813	Dorsey Mccarroll	Dorsey.Mccarroll@secretresearch.tld	\N	2
29	Edmonda Ditullio	Edmonda.Ditullio@secretresearch.tld	\N	2
1895	Saionji Pierrot	Saionji.Pierrot@secretresearch.tld	\N	2
2425	Benton Bertuzzi	Benton.Bertuzzi@secretresearch.tld	\N	2
1472	Iulia Morra	Iulia.Morra@secretresearch.tld	\N	2
2753	Clmentine Engellant	Clmentine.Engellant@secretresearch.tld	\N	2
2408	Hortensia Rothbart	Hortensia.Rothbart@secretresearch.tld	\N	2
715	Cecily Pazik	Cecily.Pazik@secretresearch.tld	\N	2
2205	Marcelino Bulat	Marcelino.Bulat@secretresearch.tld	\N	2
835	Adwr Liiv	Adwr.Liiv@secretresearch.tld	\N	2
1666	Benignus Diec	Benignus.Diec@secretresearch.tld	\N	2
1226	Kai Hamara	Kai.Hamara@secretresearch.tld	\N	2
866	Gisselle Teigen	Gisselle.Teigen@secretresearch.tld	\N	2
1411	Lucretia Ferndez	Lucretia.Ferndez@secretresearch.tld	\N	2
153	Lovell Nenni	Lovell.Nenni@secretresearch.tld	\N	2
1767	Imelde Ballin	Imelde.Ballin@secretresearch.tld	\N	2
675	Latoya Lovato	Latoya.Lovato@secretresearch.tld	\N	2
2330	Koshiro Augusto	Koshiro.Augusto@secretresearch.tld	\N	2
92	Takuji Gangluff	Takuji.Gangluff@secretresearch.tld	\N	2
237	Perpetua Leyva	Perpetua.Leyva@secretresearch.tld	\N	2
2	Sudehna Sotomayor	Sudehna.Sotomayor@secretresearch.tld	\N	2
1413	Aonghas Pashley	Aonghas.Pashley@secretresearch.tld	\N	2
477	Dietmute Lunn	Dietmute.Lunn@secretresearch.tld	\N	2
2142	Svetlana Befort	Svetlana.Befort@secretresearch.tld	\N	2
1235	Marcus Neubert	Marcus.Neubert@secretresearch.tld	\N	2
2159	Iken Siluis	Iken.Siluis@secretresearch.tld	\N	2
1196	Ineng Alkbsh	Ineng.Alkbsh@secretresearch.tld	\N	2
50	Jamaall Rohen	Jamaall.Rohen@secretresearch.tld	\N	2
746	Ricky Wyss	Ricky.Wyss@secretresearch.tld	\N	2
2398	Devontae Abaloz	Devontae.Abaloz@secretresearch.tld	\N	2
1047	Amadom Badoni	Amadom.Badoni@secretresearch.tld	\N	2
1634	Lloyd Stallsmith	Lloyd.Stallsmith@secretresearch.tld	\N	2
1305	Luithilde Brandolino	Luithilde.Brandolino@secretresearch.tld	\N	2
171	Mitsu Kerbs	Mitsu.Kerbs@secretresearch.tld	\N	2
262	Vasin Marallo	Vasin.Marallo@secretresearch.tld	\N	2
817	Angelica Maccarter	Angelica.Maccarter@secretresearch.tld	\N	2
1420	Pukhleriia Fawson	Pukhleriia.Fawson@secretresearch.tld	\N	2
757	Jamuna Orts	Jamuna.Orts@secretresearch.tld	\N	2
1410	Bussho Oda	Bussho.Oda@secretresearch.tld	\N	2
315	Alissa Woodridge	Alissa.Woodridge@secretresearch.tld	\N	2
723	Tekla Gallerani	Tekla.Gallerani@secretresearch.tld	\N	2
1939	Cadman Strom	Cadman.Strom@secretresearch.tld	\N	2
778	Michizane Krips	Michizane.Krips@secretresearch.tld	\N	2
320	Alika Odgen	Alika.Odgen@secretresearch.tld	\N	2
2662	Phineas Schubach	Phineas.Schubach@secretresearch.tld	\N	2
306	Diomedes Raisley	Diomedes.Raisley@secretresearch.tld	\N	2
942	Eufemia Hensen	Eufemia.Hensen@secretresearch.tld	\N	2
1570	Ingemar Cheevers	Ingemar.Cheevers@secretresearch.tld	\N	2
891	Mita Schwering	Mita.Schwering@secretresearch.tld	\N	2
429	Cenon Colon	Cenon.Colon@secretresearch.tld	\N	2
2204	Wayan Whitelow	Wayan.Whitelow@secretresearch.tld	\N	2
1282	Herberta Fullenwider	Herberta.Fullenwider@secretresearch.tld	\N	2
311	Marion Verdi	Marion.Verdi@secretresearch.tld	\N	2
1968	Bhoomika Secord	Bhoomika.Secord@secretresearch.tld	\N	2
90	Doug Fedak	Doug.Fedak@secretresearch.tld	\N	2
31	Zarek Laasaga	Zarek.Laasaga@secretresearch.tld	\N	2
1156	Haleigh Rodell	Haleigh.Rodell@secretresearch.tld	\N	2
1993	Cassian Cozzy	Cassian.Cozzy@secretresearch.tld	\N	2
1418	Rosamar Wish	Rosamar.Wish@secretresearch.tld	\N	2
632	Llyn Hardge	Llyn.Hardge@secretresearch.tld	\N	2
119	Amos Mackay	Amos.Mackay@secretresearch.tld	\N	2
365	Taunya Staller	Taunya.Staller@secretresearch.tld	\N	2
304	Gyes Pandy	Gyes.Pandy@secretresearch.tld	\N	2
519	Tokimune Davanzo	Tokimune.Davanzo@secretresearch.tld	\N	2
1380	Gia Stonesifer	Gia.Stonesifer@secretresearch.tld	\N	2
577	Mstislava Touby	Mstislava.Touby@secretresearch.tld	\N	2
1315	Tiyah Iha	Tiyah.Iha@secretresearch.tld	\N	2
371	Jonam Steinle	Jonam.Steinle@secretresearch.tld	\N	2
1726	Enya Coll	Enya.Coll@secretresearch.tld	\N	2
1089	Brenda Varley	Brenda.Varley@secretresearch.tld	\N	2
495	Shantese Toyota	Shantese.Toyota@secretresearch.tld	\N	2
727	Cleveland Navarez	Cleveland.Navarez@secretresearch.tld	\N	2
1108	Shahaama Berum	Shahaama.Berum@secretresearch.tld	\N	2
1057	Kaleb Eovaldi	Kaleb.Eovaldi@secretresearch.tld	\N	2
1351	Everardo Yidiaris	Everardo.Yidiaris@secretresearch.tld	\N	2
1485	Atsumori Bloyer	Atsumori.Bloyer@secretresearch.tld	\N	2
2158	Susanne Fenster	Susanne.Fenster@secretresearch.tld	\N	2
541	Sanya Parma	Sanya.Parma@secretresearch.tld	\N	2
2282	Sharise Heagy	Sharise.Heagy@secretresearch.tld	\N	2
1705	Cellina Schlosser	Cellina.Schlosser@secretresearch.tld	\N	2
1125	Fedoritsa Stinner	Fedoritsa.Stinner@secretresearch.tld	\N	2
919	Cicely Genna	Cicely.Genna@secretresearch.tld	\N	2
2251	Gottfried Lanzoni	Gottfried.Lanzoni@secretresearch.tld	\N	2
1553	Krystyn Slutsky	Krystyn.Slutsky@secretresearch.tld	\N	2
1952	Grite Faddis	Grite.Faddis@secretresearch.tld	\N	2
1003	Rosalinde Leinbach	Rosalinde.Leinbach@secretresearch.tld	\N	2
1813	Maksimina Pecinousky	Maksimina.Pecinousky@secretresearch.tld	\N	2
1269	Ladinka Ehiginator	Ladinka.Ehiginator@secretresearch.tld	\N	2
409	Francesco Spelts	Francesco.Spelts@secretresearch.tld	\N	2
529	Elan Malloch	Elan.Malloch@secretresearch.tld	\N	2
1219	Agdta Moccasin	Agdta.Moccasin@secretresearch.tld	\N	2
557	Solange Alson	Solange.Alson@secretresearch.tld	\N	2
63	Makhna Stabile	Makhna.Stabile@secretresearch.tld	\N	2
1029	Tor Fieldman	Tor.Fieldman@secretresearch.tld	\N	2
1059	Tkelah Houghtling	Tkelah.Houghtling@secretresearch.tld	\N	2
1753	Muna Lastovica	Muna.Lastovica@secretresearch.tld	\N	2
688	Fame Clarey	Fame.Clarey@secretresearch.tld	\N	2
338	Cipriana Wadzinski	Cipriana.Wadzinski@secretresearch.tld	\N	2
271	Paloma Schnall	Paloma.Schnall@secretresearch.tld	\N	2
1209	Charlette Negron	Charlette.Negron@secretresearch.tld	\N	2
434	Layla Garnow	Layla.Garnow@secretresearch.tld	\N	2
2831	Gavriella Sasson	Gavriella.Sasson@secretresearch.tld	\N	2
967	Zambda Cusson	Zambda.Cusson@secretresearch.tld	\N	2
84	Ashakiran Bingley	Ashakiran.Bingley@secretresearch.tld	\N	2
326	Strezislava Weingard	Strezislava.Weingard@secretresearch.tld	\N	2
666	Pechta Ok	Pechta.Ok@secretresearch.tld	\N	2
203	Katlina Furth	Katlina.Furth@secretresearch.tld	\N	2
2404	Elysia Nangle	Elysia.Nangle@secretresearch.tld	\N	2
1370	Lucile Homola	Lucile.Homola@secretresearch.tld	\N	2
1405	Guiseppa Thurstonson	Guiseppa.Thurstonson@secretresearch.tld	\N	2
1274	Solymar Palisbo	Solymar.Palisbo@secretresearch.tld	\N	2
1398	Yoriko Boot	Yoriko.Boot@secretresearch.tld	\N	2
681	Dewayne Buttermore	Dewayne.Buttermore@secretresearch.tld	\N	2
42	Shontaya Klitzner	Shontaya.Klitzner@secretresearch.tld	\N	2
1188	Sophronia Peakes	Sophronia.Peakes@secretresearch.tld	\N	2
863	Astamata Micthell	Astamata.Micthell@secretresearch.tld	\N	2
1702	Coireall Shelor	Coireall.Shelor@secretresearch.tld	\N	2
980	Leanna Marxen	Leanna.Marxen@secretresearch.tld	\N	2
1557	Burkhard Hussein	Burkhard.Hussein@secretresearch.tld	\N	2
261	Zaghlool Bigwood	Zaghlool.Bigwood@secretresearch.tld	\N	2
286	Nicolette Holle	Nicolette.Holle@secretresearch.tld	\N	2
69	Rita Savery	Rita.Savery@secretresearch.tld	\N	2
2382	Branislava Marentis	Branislava.Marentis@secretresearch.tld	\N	2
2060	Rakhiel Verkler	Rakhiel.Verkler@secretresearch.tld	\N	2
1530	Goliat Telesco	Goliat.Telesco@secretresearch.tld	\N	2
1126	Eryi Deppe	Eryi.Deppe@secretresearch.tld	\N	2
759	NewyddIlyn Borchers	NewyddIlyn.Borchers@secretresearch.tld	\N	2
325	Elodie Hershelman	Elodie.Hershelman@secretresearch.tld	\N	2
1768	Brasidas Hanauer	Brasidas.Hanauer@secretresearch.tld	\N	2
1334	Francoise Rioux	Francoise.Rioux@secretresearch.tld	\N	2
898	Tiege Brdar	Tiege.Brdar@secretresearch.tld	\N	2
2055	Florica Belski	Florica.Belski@secretresearch.tld	\N	2
1417	Ora Poleyestewa	Ora.Poleyestewa@secretresearch.tld	\N	2
1317	Xiomara Plowe	Xiomara.Plowe@secretresearch.tld	\N	2
110	Adriaan Belter	Adriaan.Belter@secretresearch.tld	\N	2
245	Tracy Dupay	Tracy.Dupay@secretresearch.tld	\N	2
2453	Nadheera Maricich	Nadheera.Maricich@secretresearch.tld	\N	2
664	Korechika Mamer	Korechika.Mamer@secretresearch.tld	\N	2
689	Safiyya Letchaw	Safiyya.Letchaw@secretresearch.tld	\N	2
947	Materia Newsum	Materia.Newsum@secretresearch.tld	\N	2
2374	Stolpolcha Shigemi	Stolpolcha.Shigemi@secretresearch.tld	\N	2
1543	Tera Vigen	Tera.Vigen@secretresearch.tld	\N	2
471	Lucita Macrina	Lucita.Macrina@secretresearch.tld	\N	2
1173	Galyn Stobie	Galyn.Stobie@secretresearch.tld	\N	2
149	Rosaline Musch	Rosaline.Musch@secretresearch.tld	\N	2
388	Emiko Root	Emiko.Root@secretresearch.tld	\N	2
1078	Richika Cokeley	Richika.Cokeley@secretresearch.tld	\N	2
1249	Alonzo Sim	Alonzo.Sim@secretresearch.tld	\N	2
1145	Naasiruddeen Knotowicz	Naasiruddeen.Knotowicz@secretresearch.tld	\N	2
1466	Emely Weitzel	Emely.Weitzel@secretresearch.tld	\N	2
2279	Tringad Greenfelder	Tringad.Greenfelder@secretresearch.tld	\N	2
797	Makayla Urry	Makayla.Urry@secretresearch.tld	\N	2
1287	Irmtraut Strickland	Irmtraut.Strickland@secretresearch.tld	\N	2
113	Husain Coaxum	Husain.Coaxum@secretresearch.tld	\N	2
1171	Endora Seier	Endora.Seier@secretresearch.tld	\N	2
2167	Hisahsi Ferran	Hisahsi.Ferran@secretresearch.tld	\N	2
1928	Hesperos Schindele	Hesperos.Schindele@secretresearch.tld	\N	2
908	Pauline Fullagar	Pauline.Fullagar@secretresearch.tld	\N	2
\.



COPY "Preference" ("ID") FROM stdin;
\.



COPY "ProgramCommittee" ("ID") FROM stdin;
448
873
2201
2216
2226
2365
2928
2933
\.



COPY "ProgramCommitteeChair" ("ID") FROM stdin;
177
316
450
497
1073
1186
2202
2229
\.



COPY "ProgramCommitteeMember" ("ID", "maxPapers", "addedBy") FROM stdin;
497	\N	\N
177	\N	\N
537	\N	\N
682	\N	\N
121	\N	\N
958	\N	\N
875	\N	\N
1160	\N	\N
876	\N	\N
316	\N	\N
470	\N	\N
137	\N	\N
1356	\N	\N
581	\N	\N
380	\N	\N
129	\N	\N
886	\N	\N
1159	\N	\N
115	\N	\N
1581	\N	\N
1409	\N	\N
2202	\N	\N
604	\N	\N
1186	\N	\N
324	\N	\N
451	\N	\N
330	\N	\N
2423	\N	\N
725	\N	\N
874	\N	\N
2228	\N	\N
2350	\N	\N
51	\N	\N
1092	\N	\N
450	\N	\N
2229	\N	\N
819	\N	\N
449	\N	\N
597	\N	\N
169	\N	\N
2227	\N	\N
2160	\N	\N
1073	\N	\N
\.



COPY "Rejection" ("ID") FROM stdin;
\.



COPY "SubjectArea" ("ID") FROM stdin;
\.



COPY "User" ("ID", "acceptPaper", "TYPE") FROM stdin;
0	\N	0
2	\N	0
5	\N	0
13	\N	0
17	\N	0
19	\N	0
20	\N	0
21	\N	0
23	\N	0
27	\N	0
28	\N	0
29	\N	0
30	\N	0
31	\N	0
35	\N	0
36	\N	0
38	\N	0
39	\N	0
42	\N	0
45	\N	0
46	\N	0
47	\N	0
48	\N	0
50	\N	0
51	\N	0
53	\N	0
54	\N	0
57	\N	0
63	\N	0
64	\N	0
66	\N	0
67	\N	0
69	\N	0
71	\N	0
82	\N	0
83	\N	0
84	\N	0
86	\N	0
88	\N	0
90	\N	0
91	\N	0
92	\N	0
93	\N	0
96	\N	0
99	\N	0
101	\N	0
104	\N	0
107	\N	0
110	\N	0
111	\N	0
112	\N	0
113	\N	0
115	\N	0
116	\N	0
118	\N	0
119	\N	0
121	\N	0
123	\N	0
126	\N	0
128	\N	0
129	\N	0
130	\N	0
131	\N	0
135	\N	0
137	\N	0
139	\N	0
141	\N	0
143	\N	0
144	\N	0
146	\N	0
147	\N	0
149	\N	0
153	\N	0
154	\N	0
155	\N	0
157	\N	0
158	\N	0
161	\N	0
169	\N	0
171	\N	0
174	\N	0
176	\N	0
177	\N	0
179	\N	0
180	\N	0
182	\N	0
184	\N	0
186	\N	0
189	\N	0
193	\N	0
195	\N	0
196	\N	0
197	\N	0
199	\N	0
200	\N	0
201	\N	0
203	\N	0
205	\N	0
209	\N	0
212	\N	0
213	\N	0
214	\N	0
215	\N	0
217	\N	0
225	\N	0
226	\N	0
227	\N	0
228	\N	0
237	\N	0
238	\N	0
245	\N	0
248	\N	0
257	\N	0
259	\N	0
260	\N	0
261	\N	0
262	\N	0
270	\N	0
271	\N	0
272	\N	0
273	\N	0
275	\N	0
277	\N	0
279	\N	0
281	\N	0
286	\N	0
288	\N	0
289	\N	0
290	\N	0
291	\N	0
294	\N	0
295	\N	0
301	\N	0
303	\N	0
304	\N	0
305	\N	0
306	\N	0
308	\N	0
311	\N	0
315	\N	0
316	\N	0
317	\N	0
319	\N	0
320	\N	0
321	\N	0
322	\N	0
323	\N	0
324	\N	0
325	\N	0
326	\N	0
327	\N	0
328	\N	0
329	\N	0
330	\N	0
331	\N	0
332	\N	0
333	\N	0
334	\N	0
335	\N	0
336	\N	0
337	\N	0
338	\N	0
339	\N	0
340	\N	0
341	\N	0
342	\N	0
343	\N	0
344	\N	0
345	\N	0
346	\N	0
347	\N	0
348	\N	0
349	\N	0
352	\N	0
353	\N	0
355	\N	0
357	\N	0
358	\N	0
359	\N	0
365	\N	0
366	\N	0
371	\N	0
372	\N	0
380	\N	0
382	\N	0
384	\N	0
385	\N	0
387	\N	0
388	\N	0
396	\N	0
401	\N	0
403	\N	0
405	\N	0
407	\N	0
409	\N	0
412	\N	0
427	\N	0
429	\N	0
432	\N	0
433	\N	0
434	\N	0
435	\N	0
440	\N	0
442	\N	0
443	\N	0
445	\N	0
449	\N	0
450	\N	0
451	\N	0
454	\N	0
457	\N	0
458	\N	0
459	\N	0
460	\N	0
462	\N	0
464	\N	0
466	\N	0
468	\N	0
470	\N	0
471	\N	0
476	\N	0
477	\N	0
482	\N	0
488	\N	0
495	\N	0
497	\N	0
504	\N	0
514	\N	0
516	\N	0
519	\N	0
520	\N	0
524	\N	0
529	\N	0
535	\N	0
537	\N	0
541	\N	0
544	\N	0
545	\N	0
549	\N	0
551	\N	0
552	\N	0
555	\N	0
557	\N	0
558	\N	0
560	\N	0
561	\N	0
566	\N	0
567	\N	0
571	\N	0
572	\N	0
577	\N	0
581	\N	0
584	\N	0
585	\N	0
587	\N	0
589	\N	0
592	\N	0
597	\N	0
600	\N	0
604	\N	0
605	\N	0
606	\N	0
615	\N	0
620	\N	0
622	\N	0
623	\N	0
626	\N	0
627	\N	0
628	\N	0
629	\N	0
632	\N	0
633	\N	0
641	\N	0
642	\N	0
644	\N	0
645	\N	0
647	\N	0
652	\N	0
660	\N	0
661	\N	0
663	\N	0
664	\N	0
666	\N	0
673	\N	0
674	\N	0
675	\N	0
676	\N	0
681	\N	0
682	\N	0
686	\N	0
688	\N	0
689	\N	0
691	\N	0
693	\N	0
694	\N	0
697	\N	0
701	\N	0
702	\N	0
706	\N	0
710	\N	0
711	\N	0
712	\N	0
713	\N	0
715	\N	0
719	\N	0
720	\N	0
721	\N	0
723	\N	0
725	\N	0
727	\N	0
729	\N	0
731	\N	0
733	\N	0
734	\N	0
735	\N	0
738	\N	0
743	\N	0
746	\N	0
747	\N	0
749	\N	0
753	\N	0
755	\N	0
756	\N	0
757	\N	0
759	\N	0
761	\N	0
766	\N	0
767	\N	0
768	\N	0
770	\N	0
775	\N	0
777	\N	0
778	\N	0
782	\N	0
784	\N	0
785	\N	0
787	\N	0
791	\N	0
794	\N	0
797	\N	0
800	\N	0
801	\N	0
802	\N	0
808	\N	0
809	\N	0
810	\N	0
813	\N	0
816	\N	0
817	\N	0
819	\N	0
821	\N	0
822	\N	0
826	\N	0
828	\N	0
830	\N	0
833	\N	0
835	\N	0
836	\N	0
838	\N	0
839	\N	0
843	\N	0
844	\N	0
856	\N	0
858	\N	0
859	\N	0
863	\N	0
866	\N	0
874	\N	0
875	\N	0
876	\N	0
877	\N	0
881	\N	0
882	\N	0
883	\N	0
884	\N	0
886	\N	0
887	\N	0
891	\N	0
893	\N	0
895	\N	0
896	\N	0
898	\N	0
902	\N	0
907	\N	0
908	\N	0
909	\N	0
911	\N	0
915	\N	0
917	\N	0
919	\N	0
921	\N	0
923	\N	0
927	\N	0
928	\N	0
929	\N	0
935	\N	0
936	\N	0
937	\N	0
941	\N	0
942	\N	0
943	\N	0
944	\N	0
946	\N	0
947	\N	0
951	\N	0
956	\N	0
957	\N	0
958	\N	0
961	\N	0
964	\N	0
967	\N	0
971	\N	0
972	\N	0
980	\N	0
983	\N	0
986	\N	0
992	\N	0
998	\N	0
1000	\N	0
1003	\N	0
1004	\N	0
1009	\N	0
1011	\N	0
1013	\N	0
1015	\N	0
1018	\N	0
1020	\N	0
1021	\N	0
1025	\N	0
1026	\N	0
1029	\N	0
1039	\N	0
1044	\N	0
1045	\N	0
1046	\N	0
1047	\N	0
1048	\N	0
1049	\N	0
1050	\N	0
1051	\N	0
1052	\N	0
1053	\N	0
1054	\N	0
1055	\N	0
1056	\N	0
1057	\N	0
1058	\N	0
1059	\N	0
1060	\N	0
1061	\N	0
1064	\N	0
1068	\N	0
1069	\N	0
1070	\N	0
1071	\N	0
1073	\N	0
1076	\N	0
1078	\N	0
1084	\N	0
1087	\N	0
1089	\N	0
1092	\N	0
1098	\N	0
1101	\N	0
1102	\N	0
1106	\N	0
1108	\N	0
1112	\N	0
1114	\N	0
1123	\N	0
1125	\N	0
1126	\N	0
1129	\N	0
1136	\N	0
1142	\N	0
1143	\N	0
1145	\N	0
1156	\N	0
1158	\N	0
1159	\N	0
1160	\N	0
1166	\N	0
1171	\N	0
1173	\N	0
1174	\N	0
1179	\N	0
1180	\N	0
1186	\N	0
1188	\N	0
1191	\N	0
1192	\N	0
1193	\N	0
1194	\N	0
1196	\N	0
1198	\N	0
1204	\N	0
1209	\N	0
1213	\N	0
1214	\N	0
1217	\N	0
1218	\N	0
1219	\N	0
1220	\N	0
1223	\N	0
1225	\N	0
1226	\N	0
1227	\N	0
1228	\N	0
1235	\N	0
1242	\N	0
1244	\N	0
1245	\N	0
1249	\N	0
1254	\N	0
1255	\N	0
1257	\N	0
1260	\N	0
1262	\N	0
1266	\N	0
1267	\N	0
1269	\N	0
1274	\N	0
1275	\N	0
1276	\N	0
1279	\N	0
1282	\N	0
1287	\N	0
1293	\N	0
1300	\N	0
1301	\N	0
1302	\N	0
1304	\N	0
1305	\N	0
1307	\N	0
1310	\N	0
1312	\N	0
1315	\N	0
1317	\N	0
1319	\N	0
1321	\N	0
1322	\N	0
1323	\N	0
1325	\N	0
1329	\N	0
1332	\N	0
1334	\N	0
1335	\N	0
1339	\N	0
1343	\N	0
1348	\N	0
1350	\N	0
1351	\N	0
1352	\N	0
1355	\N	0
1356	\N	0
1357	\N	0
1359	\N	0
1360	\N	0
1364	\N	0
1366	\N	0
1369	\N	0
1370	\N	0
1376	\N	0
1378	\N	0
1380	\N	0
1382	\N	0
1390	\N	0
1394	\N	0
1397	\N	0
1398	\N	0
1402	\N	0
1403	\N	0
1405	\N	0
1409	\N	0
1410	\N	0
1411	\N	0
1412	\N	0
1413	\N	0
1414	\N	0
1415	\N	0
1416	\N	0
1417	\N	0
1418	\N	0
1419	\N	0
1420	\N	0
1425	\N	0
1427	\N	0
1429	\N	0
1436	\N	0
1437	\N	0
1438	\N	0
1439	\N	0
1446	\N	0
1448	\N	0
1458	\N	0
1459	\N	0
1462	\N	0
1465	\N	0
1466	\N	0
1467	\N	0
1468	\N	0
1472	\N	0
1473	\N	0
1475	\N	0
1476	\N	0
1485	\N	0
1493	\N	0
1495	\N	0
1496	\N	0
1502	\N	0
1503	\N	0
1505	\N	0
1507	\N	0
1517	\N	0
1518	\N	0
1519	\N	0
1520	\N	0
1522	\N	0
1524	\N	0
1526	\N	0
1528	\N	0
1529	\N	0
1530	\N	0
1541	\N	0
1542	\N	0
1543	\N	0
1550	\N	0
1553	\N	0
1557	\N	0
1561	\N	0
1562	\N	0
1565	\N	0
1568	\N	0
1570	\N	0
1580	\N	0
1581	\N	0
1582	\N	0
1583	\N	0
1590	\N	0
1591	\N	0
1593	\N	0
1594	\N	0
1596	\N	0
1602	\N	0
1603	\N	0
1611	\N	0
1615	\N	0
1618	\N	0
1620	\N	0
1624	\N	0
1629	\N	0
1632	\N	0
1634	\N	0
1637	\N	0
1642	\N	0
1648	\N	0
1658	\N	0
1662	\N	0
1664	\N	0
1666	\N	0
1672	\N	0
1677	\N	0
1678	\N	0
1681	\N	0
1683	\N	0
1688	\N	0
1690	\N	0
1696	\N	0
1702	\N	0
1705	\N	0
1709	\N	0
1711	\N	0
1719	\N	0
1720	\N	0
1726	\N	0
1727	\N	0
1730	\N	0
1734	\N	0
1737	\N	0
1739	\N	0
1744	\N	0
1745	\N	0
1748	\N	0
1750	\N	0
1753	\N	0
1758	\N	0
1759	\N	0
1761	\N	0
1765	\N	0
1767	\N	0
1768	\N	0
1773	\N	0
1775	\N	0
1781	\N	0
1787	\N	0
1790	\N	0
1793	\N	0
1797	\N	0
1801	\N	0
1803	\N	0
1807	\N	0
1813	\N	0
1815	\N	0
1819	\N	0
1821	\N	0
1829	\N	0
1835	\N	0
1839	\N	0
1843	\N	0
1852	\N	0
1854	\N	0
1855	\N	0
1862	\N	0
1867	\N	0
1868	\N	0
1869	\N	0
1873	\N	0
1877	\N	0
1879	\N	0
1882	\N	0
1888	\N	0
1891	\N	0
1895	\N	0
1900	\N	0
1902	\N	0
1904	\N	0
1905	\N	0
1911	\N	0
1914	\N	0
1918	\N	0
1928	\N	0
1933	\N	0
1939	\N	0
1946	\N	0
1948	\N	0
1952	\N	0
1959	\N	0
1965	\N	0
1968	\N	0
1971	\N	0
1980	\N	0
1987	\N	0
1991	\N	0
1993	\N	0
1996	\N	0
2003	\N	0
2004	\N	0
2006	\N	0
2008	\N	0
2009	\N	0
2012	\N	0
2016	\N	0
2017	\N	0
2026	\N	0
2027	\N	0
2032	\N	0
2043	\N	0
2050	\N	0
2051	\N	0
2054	\N	0
2055	\N	0
2056	\N	0
2060	\N	0
2061	\N	0
2063	\N	0
2064	\N	0
2065	\N	0
2066	\N	0
2070	\N	0
2072	\N	0
2076	\N	0
2082	\N	0
2091	\N	0
2094	\N	0
2096	\N	0
2104	\N	0
2107	\N	0
2117	\N	0
2118	\N	0
2119	\N	0
2123	\N	0
2125	\N	0
2127	\N	0
2129	\N	0
2135	\N	0
2137	\N	0
2142	\N	0
2144	\N	0
2145	\N	0
2147	\N	0
2152	\N	0
2158	\N	0
2159	\N	0
2160	\N	0
2161	\N	0
2164	\N	0
2167	\N	0
2173	\N	0
2174	\N	0
2178	\N	0
2181	\N	0
2188	\N	0
2189	\N	0
2198	\N	0
2200	\N	0
2202	\N	0
2204	\N	0
2205	\N	0
2212	\N	0
2219	\N	0
2227	\N	0
2228	\N	0
2229	\N	0
2235	\N	0
2241	\N	0
2242	\N	0
2244	\N	0
2247	\N	0
2251	\N	0
2256	\N	0
2264	\N	0
2270	\N	0
2272	\N	0
2279	\N	0
2282	\N	0
2286	\N	0
2300	\N	0
2302	\N	0
2312	\N	0
2315	\N	0
2321	\N	0
2323	\N	0
2328	\N	0
2330	\N	0
2339	\N	0
2341	\N	0
2345	\N	0
2349	\N	0
2350	\N	0
2360	\N	0
2366	\N	0
2374	\N	0
2377	\N	0
2382	\N	0
2385	\N	0
2398	\N	0
2399	\N	0
2404	\N	0
2408	\N	0
2416	\N	0
2418	\N	0
2420	\N	0
2423	\N	0
2425	\N	0
2426	\N	0
2428	\N	0
2431	\N	0
2449	\N	0
2453	\N	0
2469	\N	0
2473	\N	0
2476	\N	0
2483	\N	0
2490	\N	0
2491	\N	0
2495	\N	0
2500	\N	0
2504	\N	0
2513	\N	0
2520	\N	0
2525	\N	0
2528	\N	0
2531	\N	0
2533	\N	0
2552	\N	0
2556	\N	0
2562	\N	0
2566	\N	0
2571	\N	0
2586	\N	0
2587	\N	0
2589	\N	0
2592	\N	0
2595	\N	0
2603	\N	0
2607	\N	0
2612	\N	0
2617	\N	0
2619	\N	0
2623	\N	0
2624	\N	0
2638	\N	0
2655	\N	0
2661	\N	0
2662	\N	0
2669	\N	0
2679	\N	0
2689	\N	0
2692	\N	0
2699	\N	0
2706	\N	0
2721	\N	0
2729	\N	0
2731	\N	0
2735	\N	0
2737	\N	0
2739	\N	0
2750	\N	0
2753	\N	0
2756	\N	0
2763	\N	0
2782	\N	0
2783	\N	0
2831	\N	0
2846	\N	0
2871	\N	0
2886	\N	0
2910	\N	0
2921	\N	0
2926	\N	0
2927	\N	0
2954	\N	0
2960	\N	0
2973	\N	0
2998	\N	0
3007	\N	0
3012	\N	0
3043	\N	0
\.



COPY "assignReviewer" ("Administrator", "Reviewer") FROM stdin;
\.



COPY "co-writePaper" ("Co-author", "Paper") FROM stdin;
13	14
13	15
19	16
30	25
30	2370
35	419
35	420
38	34
38	421
46	43
47	1177
51	413
51	418
54	49
54	2260
64	485
67	62
67	483
71	76
71	80
83	81
86	490
86	492
93	89
99	607
107	1480
112	108
118	114
126	1120
126	1122
129	1725
131	127
131	362
135	1121
139	1387
143	827
144	700
144	1941
147	142
154	151
161	165
174	173
176	1392
180	175
180	533
195	1791
196	2098
196	2101
197	284
199	194
201	105
209	210
213	211
217	220
217	221
227	207
228	72
257	256
270	268
275	1981
279	1289
279	1712
288	473
291	287
301	1498
305	302
305	1573
352	350
357	354
359	360
372	373
382	595
385	383
396	398
396	400
401	313
405	404
412	414
412	417
432	430
432	512
443	444
445	446
458	411
459	888
460	455
460	1512
466	2436
497	500
497	503
516	1999
516	2000
520	393
544	651
549	954
551	539
560	617
561	556
566	190
567	568
572	570
581	938
592	594
605	678
605	679
606	602
615	618
620	619
622	1
623	2361
623	2364
627	625
629	1997
641	1817
644	640
644	1785
661	659
673	8
686	1362
691	1034
693	806
693	962
701	2090
710	1668
710	1669
713	708
720	164
720	167
721	717
721	1264
725	2087
725	2088
734	730
735	1252
735	1548
738	739
738	740
747	745
753	499
753	502
755	1527
756	754
766	764
770	772
777	774
794	795
801	798
808	1331
809	815
819	2511
821	925
822	820
822	2191
828	1920
833	239
836	834
843	521
844	847
856	855
856	1238
858	265
859	750
877	878
884	879
887	803
896	310
911	906
915	914
921	9
921	12
923	924
927	1231
927	1232
928	699
935	933
935	991
936	1168
941	939
961	489
964	965
971	1265
972	973
983	985
992	994
992	996
998	870
998	871
1004	1005
1004	1006
1018	1019
1021	486
1050	2110
1050	2183
1051	995
1058	1202
1058	2557
1064	655
1064	656
1069	1066
1076	978
1087	684
1092	1811
1092	2333
1098	1871
1102	1103
1106	422
1158	850
1158	851
1179	2468
1180	1181
1191	1241
1192	1487
1192	1488
1193	1190
1193	1930
1194	2383
1218	1216
1220	1431
1225	77
1225	78
1227	793
1245	1248
1257	1256
1257	1346
1260	1934
1260	1936
1262	1452
1262	1453
1267	1865
1275	1273
1275	2089
1276	1396
1279	241
1279	244
1301	392
1301	394
1307	1303
1310	1910
1312	1313
1319	848
1323	1320
1329	1795
1350	771
1350	773
1352	931
1366	1251
1369	1625
1378	1148
1378	1152
1402	231
1403	960
1436	1434
1438	591
1439	508
1459	654
1462	1035
1465	1464
1465	2276
1473	637
1473	639
1493	1494
1495	247
1505	1501
1507	507
1519	1515
1522	949
1524	1031
1528	1443
1529	1165
1541	854
1565	1566
1568	2512
1580	1578
1590	1588
1602	1042
1603	1604
1603	1605
1611	547
1615	1616
1620	1477
1620	1479
1642	1643
1648	1649
1677	1675
1677	1827
1688	505
1690	1043
1711	1848
1720	2310
1734	1733
1745	59
1748	696
1758	1599
1759	868
1761	1760
1761	1998
1765	1478
1765	1482
1775	974
1775	979
1797	1115
1801	763
1803	1804
1807	1630
1819	1670
1829	1828
1829	2402
1835	1836
1843	408
1852	1853
1854	671
1862	1864
1869	1870
1873	266
1877	1081
1877	1082
1879	298
1882	1647
1888	905
1900	188
1911	1033
1911	1038
1914	299
1933	368
1948	789
1959	229
1959	232
1971	667
1971	669
1987	1988
1991	1990
1991	2141
1996	2319
2003	1794
2006	2007
2009	1789
2012	33
2016	650
2026	786
2043	506
2043	509
2050	2048
2064	611
2065	491
2104	1536
2107	2108
2119	124
2127	2128
2135	2134
2144	249
2144	252
2152	1483
2161	1014
2164	1199
2174	103
2181	1897
2188	2121
2200	2197
2202	437
2212	479
2219	399
2242	1707
2247	1295
2256	2169
2256	2170
2264	1983
2270	853
2272	374
2272	376
2286	2179
2321	2281
2328	2327
2349	1656
2350	1534
2350	1535
2366	1450
2377	250
2399	2150
2416	904
2418	849
2469	1395
2473	969
2476	526
2483	984
2491	1907
2495	1800
2504	1093
2504	1094
2513	309
2520	1164
2525	242
2531	608
2531	609
2552	2255
2556	2095
2562	1944
2566	2034
2571	1545
2589	2585
2592	536
2595	707
2603	240
2607	1130
2617	1337
2619	1169
2661	1600
2689	1132
2692	1455
2699	1028
2706	191
2729	1153
2735	160
2737	635
2739	2728
2750	1017
2763	1138
2782	1738
2846	1917
2871	2273
2921	527
2927	788
2960	185
2998	1407
3007	1147
3012	4
3043	1875
\.



COPY "detailsEnteredBy" ("Conference", "Administrator") FROM stdin;
\.



COPY "enableVirtualMeeting" ("Administrator", "Conference") FROM stdin;
\.



COPY "endReview" ("ProgramCommitteeChair", "Review") FROM stdin;
\.



COPY "enterReviewCriteria" ("Administrator", "Conference") FROM stdin;
\.



COPY "finalizePaperAssignment" ("Administrator", "Conference") FROM stdin;
\.



COPY "hardcopyMailingManifestsP" ("Conference", "Administrator") FROM stdin;
\.



COPY "hasConferenceMember" ("Conference", "ConferenceMember") FROM stdin;
7	5
7	20
7	31
7	84
7	113
7	449
7	541
7	584
7	633
7	647
7	731
7	759
7	784
7	1011
7	1089
7	1112
7	1173
7	1266
7	1287
7	1305
7	1317
7	1334
7	1382
7	1409
7	1410
7	1411
7	1412
7	1413
7	1414
7	1415
7	1416
7	1417
7	1418
7	1419
7	1420
79	35
79	47
79	71
79	90
79	119
79	121
79	153
79	171
79	196
79	212
79	260
79	262
79	289
79	295
79	315
79	427
79	544
79	642
79	701
79	715
79	797
79	833
79	881
79	886
79	908
79	927
79	951
79	1044
79	1045
79	1046
79	1047
79	1048
79	1049
79	1050
79	1051
79	1052
79	1053
79	1054
79	1055
79	1056
79	1057
79	1058
79	1059
79	1060
79	1061
163	88
163	99
163	129
163	135
163	139
163	161
163	248
163	306
163	434
163	458
163	466
163	520
163	555
163	581
163	615
163	652
163	691
163	777
163	808
163	936
163	971
163	1159
163	1174
163	1179
163	1191
163	1245
163	1352
163	1466
163	1568
163	1602
163	1711
163	2026
163	2160
163	2408
163	2491
163	2669
208	42
208	141
208	155
208	200
208	205
208	245
208	271
208	290
208	316
208	317
208	319
208	320
208	321
208	322
208	323
208	324
208	325
208	326
208	327
208	328
208	329
208	330
208	331
208	332
208	333
208	334
208	335
208	336
208	337
208	338
208	339
208	340
208	341
208	342
208	343
208	344
208	345
208	346
208	347
208	348
208	349
219	27
219	51
219	64
219	126
219	217
219	388
219	450
219	560
219	585
219	660
219	688
219	720
219	725
219	743
219	753
219	843
219	946
219	1000
219	1026
219	1073
219	1193
219	1242
219	1260
219	1310
219	1475
219	1813
219	2082
230	107
230	143
230	176
230	199
230	228
230	435
230	471
230	604
230	629
230	689
230	819
230	844
230	1098
230	1142
230	1220
230	1244
230	1462
230	1507
230	1634
230	1666
230	1737
230	1744
230	1904
230	1918
230	1928
230	2060
230	2061
230	2063
230	2064
230	2065
230	2066
254	39
254	88
254	96
254	99
254	135
254	139
254	248
254	261
254	281
254	286
254	434
254	458
254	552
254	555
254	645
254	652
254	691
254	702
254	727
254	777
254	791
254	830
254	874
254	893
254	1159
254	1186
254	1191
254	1209
254	1254
254	1355
254	1429
254	1568
254	1602
254	1672
254	1753
254	2117
254	2158
254	2159
254	2160
395	27
395	38
395	51
395	64
395	144
395	177
395	279
395	388
395	462
395	464
395	516
395	693
395	710
395	720
395	725
395	817
395	946
395	998
395	1025
395	1039
395	1101
395	1225
395	1242
395	1260
395	1315
395	1356
395	1370
395	1620
395	2082
395	2272
\.



COPY "hasConflictOfInterest" ("Person", "Document") FROM stdin;
\.



COPY "hasProgramCommitteeMember" ("ProgramCommittee", "ProgramCommitteeMember") FROM stdin;
448	51
448	449
448	450
448	451
873	497
873	581
873	874
873	875
873	876
2201	115
2201	121
2201	876
2201	886
2201	958
2201	2160
2201	2202
2216	169
2216	316
2216	324
2216	330
2216	380
2216	470
2216	1581
2226	604
2226	819
2226	2227
2226	2228
2226	2229
2365	177
2365	682
2365	1160
2365	1409
2365	2350
2928	129
2928	137
2928	537
2928	1092
2928	1159
2928	1186
2933	597
2933	725
2933	1073
2933	1356
2933	2423
\.



COPY "hasSubjectArea" ("Paper", "SubjectArea") FROM stdin;
\.



COPY "markConflictOfInterest" ("ConferenceMember", "Paper") FROM stdin;
\.



COPY "paperAssignmentToolsRunBy" ("Conference", "Administrator") FROM stdin;
\.



COPY "reviewerBiddingStartedBy" ("Conference", "Administrator") FROM stdin;
\.



COPY "setMaxPapers" ("Administrator", "ProgramCommitteeMember") FROM stdin;
\.



COPY "submitPaper" ("Author", "Paper") FROM stdin;
\.



ALTER TABLE ONLY "Author"
    ADD CONSTRAINT "AuthorPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Bid"
    ADD CONSTRAINT "BidPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Conference"
    ADD CONSTRAINT "ConferencePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Document"
    ADD CONSTRAINT "DocumentPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperPK" PRIMARY KEY ("ID", "Reviewer");



ALTER TABLE ONLY "Person"
    ADD CONSTRAINT "PersonPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Preference"
    ADD CONSTRAINT "PreferencePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "ProgramCommitteeChair"
    ADD CONSTRAINT "ProgramCommitteeChairPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "ProgramCommitteeMember"
    ADD CONSTRAINT "ProgramCommitteeMemberPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "ProgramCommittee"
    ADD CONSTRAINT "ProgramCommitteePK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "Rejection"
    ADD CONSTRAINT "RejectionPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "SubjectArea"
    ADD CONSTRAINT "SubjectAreaPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "User"
    ADD CONSTRAINT "UserPK" PRIMARY KEY ("ID");



ALTER TABLE ONLY "assignReviewer"
    ADD CONSTRAINT "assignReviewerPK" PRIMARY KEY ("Administrator", "Reviewer");



ALTER TABLE ONLY "co-writePaper"
    ADD CONSTRAINT "co-writePaperPK" PRIMARY KEY ("Co-author", "Paper");



ALTER TABLE ONLY "detailsEnteredBy"
    ADD CONSTRAINT "detailsEnteredByPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "enableVirtualMeeting"
    ADD CONSTRAINT "enableVirtualMeetingPK" PRIMARY KEY ("Administrator", "Conference");



ALTER TABLE ONLY "endReview"
    ADD CONSTRAINT "endReviewPK" PRIMARY KEY ("ProgramCommitteeChair", "Review");



ALTER TABLE ONLY "enterReviewCriteria"
    ADD CONSTRAINT "enterReviewCriteriaPK" PRIMARY KEY ("Administrator", "Conference");



ALTER TABLE ONLY "finalizePaperAssignment"
    ADD CONSTRAINT "finalizePaperAssignmentPK" PRIMARY KEY ("Administrator", "Conference");



ALTER TABLE ONLY "hardcopyMailingManifestsP"
    ADD CONSTRAINT "hardcopyMailingManifestsPPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "hasConferenceMember"
    ADD CONSTRAINT "hasConferenceMemberPK" PRIMARY KEY ("Conference", "ConferenceMember");



ALTER TABLE ONLY "hasConflictOfInterest"
    ADD CONSTRAINT "hasConflictOfInterestPK" PRIMARY KEY ("Person", "Document");



ALTER TABLE ONLY "hasProgramCommitteeMember"
    ADD CONSTRAINT "hasProgramCommitteeMemberPK" PRIMARY KEY ("ProgramCommittee", "ProgramCommitteeMember");



ALTER TABLE ONLY "hasSubjectArea"
    ADD CONSTRAINT "hasSubjectAreaPK" PRIMARY KEY ("Paper", "SubjectArea");



ALTER TABLE ONLY "markConflictOfInterest"
    ADD CONSTRAINT "markConflictOfInterestPK" PRIMARY KEY ("ConferenceMember", "Paper");



ALTER TABLE ONLY "paperAssignmentToolsRunBy"
    ADD CONSTRAINT "paperAssignmentToolsRunByPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "reviewerBiddingStartedBy"
    ADD CONSTRAINT "reviewerBiddingStartedByPK" PRIMARY KEY ("Conference", "Administrator");



ALTER TABLE ONLY "setMaxPapers"
    ADD CONSTRAINT "setMaxPapersPK" PRIMARY KEY ("Administrator", "ProgramCommitteeMember");



ALTER TABLE ONLY "submitPaper"
    ADD CONSTRAINT "submitPaperPK" PRIMARY KEY ("Author", "Paper");



ALTER TABLE ONLY "Author"
    ADD CONSTRAINT "AuthorURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Author"
    ADD CONSTRAINT "AuthorURIFK2" FOREIGN KEY ("ID") REFERENCES "User"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "ProgramCommitteeChair"
    ADD CONSTRAINT "ChairmanURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperURIFK" FOREIGN KEY ("ID") REFERENCES "Document"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperacceptedByFK" FOREIGN KEY ("acceptedBy") REFERENCES "User"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperhasAuthorFK" FOREIGN KEY ("hasAuthor") REFERENCES "Author"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperhasDecisionFK" FOREIGN KEY ("hasDecision") REFERENCES "Rejection"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "PaperrejectedByFK" FOREIGN KEY ("rejectedBy") REFERENCES "User"("ID");



ALTER TABLE ONLY "ProgramCommitteeChair"
    ADD CONSTRAINT "ProgramCommitteeChairURIFK2" FOREIGN KEY ("ID") REFERENCES "ProgramCommitteeMember"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "ProgramCommitteeMember"
    ADD CONSTRAINT "ProgramCommitteeMemberURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID");



ALTER TABLE ONLY "ProgramCommitteeMember"
    ADD CONSTRAINT "ProgramCommitteeMemberadd" FOREIGN KEY ("addedBy") REFERENCES "User"("ID");



ALTER TABLE ONLY "User"
    ADD CONSTRAINT "UserURIFK" FOREIGN KEY ("ID") REFERENCES "Person"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "assignReviewer"
    ADD CONSTRAINT "assignReviewerAdministratorFK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "co-writePaper"
    ADD CONSTRAINT "co-writePaperCo-authorFK" FOREIGN KEY ("Co-author") REFERENCES "Author"("ID");



ALTER TABLE ONLY "detailsEnteredBy"
    ADD CONSTRAINT "detailsEnteredByAdministr" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "detailsEnteredBy"
    ADD CONSTRAINT "detailsEnteredByConferenceFK" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "enableVirtualMeeting"
    ADD CONSTRAINT "enableVirtualMeetingAdmin" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "enableVirtualMeeting"
    ADD CONSTRAINT "enableVirtualMeetingConfe" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "endReview"
    ADD CONSTRAINT "endReviewProgramCommittee" FOREIGN KEY ("ProgramCommitteeChair") REFERENCES "ProgramCommitteeChair"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "endReview"
    ADD CONSTRAINT "endReviewReviewFK" FOREIGN KEY ("Review") REFERENCES "Document"("ID");



ALTER TABLE ONLY "enterReviewCriteria"
    ADD CONSTRAINT "enterReviewCriteriaAdmini" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "enterReviewCriteria"
    ADD CONSTRAINT "enterReviewCriteriaConfer" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "finalizePaperAssignment"
    ADD CONSTRAINT "finalizePaperAssignmentAd" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "finalizePaperAssignment"
    ADD CONSTRAINT "finalizePaperAssignmentCo" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hardcopyMailingManifestsP"
    ADD CONSTRAINT "hardcopyMailingManifestsP" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hardcopyMailingManifestsP"
    ADD CONSTRAINT "hardcopyMailingManifestsPAd2FK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "hasConferenceMember"
    ADD CONSTRAINT "hasConferenceMemberConfer" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasConflictOfInterest"
    ADD CONSTRAINT "hasConflictOfInterestDocu" FOREIGN KEY ("Document") REFERENCES "Document"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasConflictOfInterest"
    ADD CONSTRAINT "hasConflictOfInterestPersonFK" FOREIGN KEY ("Person") REFERENCES "Person"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasProgramCommitteeMember"
    ADD CONSTRAINT "hasProgramCommitteeMember" FOREIGN KEY ("ProgramCommittee") REFERENCES "ProgramCommittee"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "hasSubjectArea"
    ADD CONSTRAINT "hasSubjectAreaSubjectAreaFK" FOREIGN KEY ("SubjectArea") REFERENCES "SubjectArea"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "paperAssignmentToolsRunBy"
    ADD CONSTRAINT "paperAssignmentToolsRunBy" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "paperAssignmentToolsRunBy"
    ADD CONSTRAINT "paperAssignmentToolsRunByAd2FK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "reviewerBiddingStartedBy"
    ADD CONSTRAINT "reviewerBiddingStartedByA" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "reviewerBiddingStartedBy"
    ADD CONSTRAINT "reviewerBiddingStartedByC" FOREIGN KEY ("Conference") REFERENCES "Conference"("ID") ON DELETE CASCADE;



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "reviewerIsPerson" FOREIGN KEY ("Reviewer") REFERENCES "Person"("ID");



ALTER TABLE ONLY "Paper"
    ADD CONSTRAINT "reviewerIsUser" FOREIGN KEY ("Reviewer") REFERENCES "User"("ID");



ALTER TABLE ONLY "setMaxPapers"
    ADD CONSTRAINT "setMaxPapersAdministratorFK" FOREIGN KEY ("Administrator") REFERENCES "User"("ID");



ALTER TABLE ONLY "submitPaper"
    ADD CONSTRAINT "submitPaperAuthorFK" FOREIGN KEY ("Author") REFERENCES "Author"("ID") ON DELETE CASCADE;
