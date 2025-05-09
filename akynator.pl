subject(math).
subject(physics).
subject(chemistry).
subject(biology).
subject(geography).
subject(history).
subject(literature).
subject(russian).
subject(english).
subject(french).
subject(german).
subject(informatic).
subject(art).
subject(music).
subject(phiscult).
subject(economics).
subject(law).
subject(technology).
subject(ecology).
subject(astronomy).

difficult(math,1).
difficult(physics,1).
difficult(chemistry,1).
difficult(biology,0).
difficult(geography,0).
difficult(history,0).
difficult(literature,0).
difficult(russian,1).
difficult(english,0).
difficult(french,0).
difficult(german,0).
difficult(informatic,1).
difficult(art,0).
difficult(music,0).
difficult(phiscult,0).
difficult(economics,0).
difficult(law,0).
difficult(technology,0).
difficult(ecology,0).
difficult(astronomy,0).

written_work(math,1).
written_work(physics,1).
written_work(chemistry,1).
written_work(biology,1).
written_work(geography,1).
written_work(history,1).
written_work(literature,1).
written_work(russian,1).
written_work(english,1).
written_work(french,1).
written_work(german,1).
written_work(informatic,1).
written_work(art,0).
written_work(music,1).
written_work(phiscult,0).
written_work(economics,1).
written_work(law,1).
written_work(technology,1).
written_work(ecology,1).
written_work(astronomy,1).

lab_work(math,0).
lab_work(physics,1).
lab_work(chemistry,1).
lab_work(biology,1).
lab_work(geography,0).
lab_work(history,0).
lab_work(literature,0).
lab_work(russian,0).
lab_work(english,0).
lab_work(french,0).
lab_work(german,0).
lab_work(informatic,1).
lab_work(art,0).
lab_work(music,0).
lab_work(phiscult,0).
lab_work(economics,0).
lab_work(law,0).
lab_work(technology,1).
lab_work(ecology,0).
lab_work(astronomy,0).

creative(math,0).
creative(physics,0).
creative(chemistry,0).
creative(biology,0).
creative(geography,0).
creative(history,0).
creative(literature,1).
creative(russian,1).
creative(english,0).
creative(french,0).
creative(german,0).
creative(informatic,0).
creative(art,1).
creative(music,1).
creative(phiscult,0).
creative(economics,0).
creative(law,0).
creative(technology,0).
creative(ecology,0).
creative(astronomy,0).

has_exam(math,1).
has_exam(physics,1).
has_exam(chemistry,1).
has_exam(biology,1).
has_exam(geography,0).
has_exam(history,1).
has_exam(literature,1).
has_exam(russian,1).
has_exam(english,1).
has_exam(french,0).
has_exam(german,0).
has_exam(informatic,0).
has_exam(art,0).
has_exam(music,0).
has_exam(phiscult,0).
has_exam(economics,0).
has_exam(law,0).
has_exam(technology,0).
has_exam(ecology,0).
has_exam(astronomy,0).


q1(X1) :-
    write('Is it hard?'), nl,
    read(X1).

q2(X2) :-
    write('Is it has written lab?'), nl,
    read(X2).

q3(X3) :-
    write('Is it has practic lab?'), nl,
    read(X3).

q4(X4) :-
    write('Is it createve subject?'), nl,
    read(X4).

q5(X5) :-
    write('Is it has exam?'), nl,
    read(X5).

pr :-
    q1(X1), q2(X2), q3(X3), q4(X4), q5(X5),
    subject(Subj),
    difficult(Subj, X1), written_work(Subj, X2), lab_work(Subj, X3), creative(Subj, X4), has_exam(Subj, X5),
    write(Subj).
