lang(ruby).
lang(c_sharp).
lang(python).
lang(c_plus_plus).
lang(f_sharp).
lang(prolog).
lang(c).
lang(asm).
lang(java).
lang(javascript).
lang(go).
lang(kotlin).

type(ruby,2).     
type(python,2).
type(javascript,2).
type(c_sharp,1). 
type(java,1).
type(go,1).
type(kotlin,1).
type(f_sharp,3). 
type(prolog,3).
type(c,4).     
type(asm,4).
type(c_plus_plus,1).

high(ruby,1).  
high(c_sharp,1).
high(python,1).
high(c_plus_plus,1).
high(f_sharp,1).
high(prolog,1).
high(java,1).
high(javascript,1).
high(go,1).
high(kotlin,1).
high(c,0).     
high(asm,0).

decl(ruby,0).
decl(c_sharp,0).
decl(python,0).
decl(c_plus_plus,0).
decl(f_sharp,1).
decl(prolog,1).
decl(java,0).
decl(javascript,0).
decl(go,0).
decl(kotlin,0).
decl(c,0).
decl(asm,0).

interpret(ruby,1).
interpret(python,1).
interpret(f_sharp,1).
interpret(prolog,1).
interpret(javascript,1).
interpret(c_sharp,0).
interpret(c_plus_plus,0).
interpret(java,0).
interpret(go,0).
interpret(kotlin,0).
interpret(c,0).
interpret(asm,0).

oop(ruby,3).
oop(c_sharp,3).
oop(python,2).
oop(c_plus_plus,2).
oop(java,3).
oop(javascript,2).
oop(f_sharp,1).
oop(prolog,1).
oop(go,1).
oop(kotlin,3).
oop(c,0).
oop(asm,0).

cross(ruby,1).
cross(python,1).
cross(c_plus_plus,1).
cross(prolog,1).
cross(java,1).
cross(javascript,1).
cross(go,1).
cross(kotlin,1).
cross(c,1).
cross(asm,1).
cross(c_sharp,0).
cross(f_sharp,0).

visual(c_sharp,3).
visual(ruby,2).
visual(python,2).
visual(c_plus_plus,2).
visual(java,2).
visual(javascript,2).
visual(go,1).
visual(kotlin,2).
visual(f_sharp,2).
visual(prolog,1).
visual(c,0).
visual(asm,0).

mobile(c_sharp,0).
mobile(ruby,0).
mobile(python,0).
mobile(c_plus_plus,0).
mobile(java,0).
mobile(javascript,1).
mobile(go,0).
mobile(kotlin,1).
mobile(f_sharp,0).
mobile(prolog,0).
mobile(c,0).
mobile(asm,0).

question0(X0):- 
    write("What type of language is it?"), nl,
    write("1. General purpose"), nl,
    write("2. Scripting"), nl,
    write("3. Functional"), nl,
    write("4. Low-level"), nl,
    read(X0).

question1(X1):- 
    write("Is your language high level?"), nl,
    write("1. Yes"), nl,
    write("0. NO"), nl,
    read(X1).

question2(X2):- 
    write("Is your language declarative?"), nl,
    write("1. Yes"), nl,
    write("0. NO"), nl,
    read(X2).

question3(X3):- 
    write("Is your language interpreted?"), nl,
    write("1. Yes"), nl,
    write("0. NO"), nl,
    read(X3).

question4(X4):- 
    write("Does your language support OOP?"), nl,
    write("3. It is OOP itself"), nl,
    write("2. yes"), nl,
    write("1. yes, but very hard"), nl,
    write("0. NO"), nl,
    read(X4).

question5(X5):- 
    write("Is your language crossplatform?"), nl,
    write("1. Yes"), nl,
    write("0. NO"), nl,
    read(X5).

question6(X6):- 
    write("Does your language support visual interface?"), nl,
    write("3. It is visual itself"), nl,
    write("2. yes"), nl,
    write("1. yes, but very hard"), nl,
    write("0. NO"), nl,
    read(X6).

question7(X7):- 
    write("Is your language for mobile phones?"), nl,
    write("1. Yes"), nl,
    write("0. NO"), nl,
    read(X7).

pr:- 
    question0(X0), question1(X1),question2(X2), question3(X3), question4(X4),
    question5(X5), question6(X6), question7(X7),
    type(Lang,X0), high(Lang, X1), decl(Lang,X2), interpret(Lang,X3), oop(Lang,X4),
    cross(Lang,X5), visual(Lang,X6), mobile(Lang,X7),
    write("Your language is: "), write(Lang).