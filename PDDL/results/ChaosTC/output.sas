begin_version
3
end_version
begin_metric
1
end_metric
2
begin_variable
var0
-1
18
Atom at(person, alvsjo)
Atom at(person, frosunda)
Atom at(person, fruangen)
Atom at(person, karlberg)
Atom at(person, karlstrnd)
Atom at(person, kista)
Atom at(person, kungstrad)
Atom at(person, ljholmen)
Atom at(person, nybroplan)
Atom at(person, omalm)
Atom at(person, ropsten)
Atom at(person, rosenlund)
Atom at(person, sdbyberg)
Atom at(person, skarhlmn)
Atom at(person, skyttehlm)
Atom at(person, tc)
Atom at(person, uni)
Atom at(person, vskogen)
end_variable
begin_variable
var1
-1
2
Atom visited(ljholmen)
NegatedAtom visited(ljholmen)
end_variable
0
begin_state
5
1
end_state
begin_goal
2
0 6
1 0
end_goal
55
begin_operator
takebus person alvsjo fruangen
0
1
0 0 0 2
10
end_operator
begin_operator
takebus person alvsjo ljholmen
0
2
0 0 0 7
0 1 -1 0
10
end_operator
begin_operator
takebus person frosunda skyttehlm
0
1
0 0 1 14
8
end_operator
begin_operator
takebus person fruangen alvsjo
0
1
0 0 2 0
10
end_operator
begin_operator
takebus person fruangen skarhlmn
0
1
0 0 2 13
14
end_operator
begin_operator
takebus person karlberg karlstrnd
0
1
0 0 3 4
4
end_operator
begin_operator
takebus person karlberg vskogen
0
1
0 0 3 17
5
end_operator
begin_operator
takebus person karlstrnd karlberg
0
1
0 0 4 3
4
end_operator
begin_operator
takebus person karlstrnd omalm
0
1
0 0 4 9
12
end_operator
begin_operator
takebus person kista frosunda
0
1
0 0 5 1
11
end_operator
begin_operator
takebus person kungstrad nybroplan
0
1
0 0 6 8
9
end_operator
begin_operator
takebus person kungstrad rosenlund
0
1
0 0 6 11
36
end_operator
begin_operator
takebus person ljholmen alvsjo
0
1
0 0 7 0
10
end_operator
begin_operator
takebus person ljholmen rosenlund
0
1
0 0 7 11
7
end_operator
begin_operator
takebus person nybroplan kungstrad
0
1
0 0 8 6
9
end_operator
begin_operator
takebus person nybroplan omalm
0
1
0 0 8 9
4
end_operator
begin_operator
takebus person omalm karlstrnd
0
1
0 0 9 4
12
end_operator
begin_operator
takebus person omalm nybroplan
0
1
0 0 9 8
4
end_operator
begin_operator
takebus person rosenlund kungstrad
0
1
0 0 11 6
36
end_operator
begin_operator
takebus person rosenlund ljholmen
0
2
0 0 11 7
0 1 -1 0
7
end_operator
begin_operator
takebus person skarhlmn fruangen
0
1
0 0 13 2
14
end_operator
begin_operator
takebus person skyttehlm frosunda
0
1
0 0 14 1
8
end_operator
begin_operator
takebus person skyttehlm vskogen
0
1
0 0 14 17
7
end_operator
begin_operator
takebus person vskogen karlberg
0
1
0 0 17 3
5
end_operator
begin_operator
takebus person vskogen skyttehlm
0
1
0 0 17 14
7
end_operator
begin_operator
takemetro person fruangen ljholmen
0
2
0 0 2 7
0 1 -1 0
8
end_operator
begin_operator
takemetro person kista vskogen
0
1
0 0 5 17
11
end_operator
begin_operator
takemetro person kungstrad tc
0
1
0 0 6 15
10
end_operator
begin_operator
takemetro person ljholmen fruangen
0
1
0 0 7 2
8
end_operator
begin_operator
takemetro person ljholmen skarhlmn
0
1
0 0 7 13
14
end_operator
begin_operator
takemetro person ljholmen tc
0
1
0 0 7 15
50
end_operator
begin_operator
takemetro person omalm ropsten
0
1
0 0 9 10
6
end_operator
begin_operator
takemetro person omalm tc
0
1
0 0 9 15
10
end_operator
begin_operator
takemetro person omalm uni
0
1
0 0 9 16
7
end_operator
begin_operator
takemetro person ropsten omalm
0
1
0 0 10 9
6
end_operator
begin_operator
takemetro person sdbyberg vskogen
0
1
0 0 12 17
6
end_operator
begin_operator
takemetro person skarhlmn ljholmen
0
2
0 0 13 7
0 1 -1 0
14
end_operator
begin_operator
takemetro person tc kungstrad
0
1
0 0 15 6
10
end_operator
begin_operator
takemetro person tc ljholmen
0
2
0 0 15 7
0 1 -1 0
50
end_operator
begin_operator
takemetro person tc omalm
0
1
0 0 15 9
10
end_operator
begin_operator
takemetro person tc vskogen
0
1
0 0 15 17
35
end_operator
begin_operator
takemetro person uni omalm
0
1
0 0 16 9
7
end_operator
begin_operator
takemetro person vskogen kista
0
1
0 0 17 5
11
end_operator
begin_operator
takemetro person vskogen sdbyberg
0
1
0 0 17 12
6
end_operator
begin_operator
takemetro person vskogen tc
0
1
0 0 17 15
35
end_operator
begin_operator
walk person kungstrad nybroplan
0
1
0 0 6 8
6
end_operator
begin_operator
walk person kungstrad omalm
0
1
0 0 6 9
11
end_operator
begin_operator
walk person kungstrad tc
0
1
0 0 6 15
5
end_operator
begin_operator
walk person nybroplan kungstrad
0
1
0 0 8 6
6
end_operator
begin_operator
walk person nybroplan omalm
0
1
0 0 8 9
7
end_operator
begin_operator
walk person omalm kungstrad
0
1
0 0 9 6
11
end_operator
begin_operator
walk person omalm nybroplan
0
1
0 0 9 8
7
end_operator
begin_operator
walk person omalm tc
0
1
0 0 9 15
16
end_operator
begin_operator
walk person tc kungstrad
0
1
0 0 15 6
5
end_operator
begin_operator
walk person tc omalm
0
1
0 0 15 9
16
end_operator
0
