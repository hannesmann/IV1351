-- From pg_dump

--
-- Data for Name: booked_lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booked_lessons (person_id, lesson_id) FROM stdin;
11	0
7	0
11	1
12	1
4	1
9	1
12	2
9	2
6	3
7	3
1	4
4	4
6	4
11	4
12	4
8	4
\.


--
-- Data for Name: contact_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_details (person_id, email, address) FROM stdin;
0	hannainho.mullvadsson@email.net	Kronobergsgatanvägsgatan 32, 316 32 Alingsås
1	\N	Kronobergsgatanvägsgatan 32, 316 32 Alingsås
2	stig.helmerinho.domherresson@email.net	Storgatanvägen 1, 493 54 Falun
3	carolinainho.domherresson@email.net	Storgatanvägen 1, 493 54 Falun
4	linusinho.domherresson@coolmail.com	Storgatanvägen 1, 493 54 Falun
5	\N	Angeredsgatanvägsgatan 23, 346 74 Västerås
6	jonnainho.uttersson@coolmail.com	Kronobergsgatanvägsgatan 8, 207 19 Solna
7	margarethainho@soundgood.nu	Adaptivevägen 16, 992 38 Umeå
8	amelinho@soundgood.nu	Storgatanvägen 34, 575 07 Solna
9	alinho@soundgood.nu	Stadsvägsgatangränd 26, 680 69 Umeå
10	carlinho.bamsesson@email.net	Årstavägsgatan 1, 866 72 Åre
11	sarainho.bamsesson@email.net	Årstavägsgatan 1, 866 72 Åre
12	annainho.bamsesson@email.net	Årstavägsgatan 1, 866 72 Åre
\.


--
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_person (student_id, contact_person_id) FROM stdin;
1	0
4	2
4	3
6	5
11	10
12	10
\.


--
-- Data for Name: ensemble; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ensemble (lesson_id, min_students, max_students, genre) FROM stdin;
4	4	5	Jazz
\.


--
-- Data for Name: group_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_lesson (lesson_id, min_students, skill_level, instrument) FROM stdin;
1	3	beginner	Guitar
3	2	advanced	Piano
\.


--
-- Data for Name: individual_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.individual_lesson (lesson_id, skill_level, instrument) FROM stdin;
0	beginner	Guitar
2	intermediate	Bass
\.


--
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (person_id, coming_payment) FROM stdin;
7	0
8	0
9	0
\.


--
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instrument (id, type, brand, rent_fee, rent_start, rent_end) FROM stdin;
0	Guitar	Instrument Inc	10	2022-10-10 00:00:00	2022-11-10 00:00:00
1	Bass	Instrument Inc	20	2022-10-08 00:00:00	2022-12-20 00:00:00
\.


--
-- Data for Name: known_instruments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.known_instruments (person_id, instrument) FROM stdin;
7	Guitar
7	Piano
8	Piano
9	Trumpet
9	Bass
9	Drums
9	Guitar
\.


--
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson (id, cost, place, time_slot) FROM stdin;
0	0	Place A	1
1	0	Place B	1
2	0	Place C	3
3	0	Place A	5
4	0	Place C	7
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, personal_number, name) FROM stdin;
0	198812132382	Hannainho Mullvadsson
1	200512012394	Lukeinho Mullvadsson
2	194710242811	Stig-Helmerinho Domherresson
3	194507018820	Carolinainho Domherresson
4	200209032390	Linusinho Domherresson
5	196107162791	Alinho Uttersson
6	199912242386	Jonnainho Uttersson
7	198204259264	Margarethainho Tjädersson
8	199505232380	Amelinho Talgoxesson
9	195406112853	Alinho Skalmansson
10	194607137454	Carlinho Bamsesson
11	200509102380	Sarainho Bamsesson
12	200112252382	Annainho Bamsesson
\.


--
-- Data for Name: phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phone (person_id, number) FROM stdin;
0	0701740616
1	0701740607
2	0701740631
2	0701740630
3	0701740632
4	0701740624
5	0701740628
6	0701740628
7	0701740618
8	0701740606
9	0701740616
10	0701740633
11	0701740623
12	0701740609
\.


--
-- Data for Name: pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pricing (lesson_type, skill_level, price) FROM stdin;
individual	beginner	20
individual	intermediate	25
individual	advanced	35
group	beginner	15
group	intermediate	20
group	advanced	25
ensemble	beginner	30
ensemble	intermediate	30
ensemble	advanced	30
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relationship (student_id, sibling_id) FROM stdin;
11	12
\.


--
-- Data for Name: rented_instruments; Type: TABLE DATA; Schema: public; Owner: hannes
--

COPY public.rented_instruments (person_id, instrument_id) FROM stdin;
4	0
12	1
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (person_id, current_skill_level, outstanding_balance) FROM stdin;
1	intermediate	0
4	beginner	0
6	advanced	0
11	beginner	0
12	beginner	0
\.


--
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slot (id, date_and_time) FROM stdin;
0	2022-11-02 12:00:00
1	2022-11-02 14:00:00
2	2022-11-02 16:00:00
3	2022-11-03 12:00:00
4	2022-11-03 14:00:00
5	2022-11-03 16:00:00
6	2022-11-04 12:00:00
7	2022-11-04 14:00:00
8	2022-11-04 16:00:00
\.