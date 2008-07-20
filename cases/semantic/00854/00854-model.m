(* 

category:      Test
synopsis:      Basic single forward reaction with two species in one compartment
using csymbol time passed to a functionDefinition.
componentTags: Compartment, Species, Reaction, Parameter, FunctionDefinition 
testTags:      InitialAmount, CSymbolTime
testType:      TimeCourse
levels:        2.1, 2.2, 2.3
generatedBy:   Numeric

The model contains one compartment called C.  There are two
species called S1 and S2 and one parameter called k1.  The model contains
one reaction:

[{width:30em,margin-left:5em}|  *Reaction*  |  *Rate*  |
| S1 -> S2 | $multiply(k1, S1, t) * C$ |]
where the symbol 't' denotes the current simulation time.

The reaction uses one functionDefinition defined as:

[{width:30em,margin-left:5em}|  *Id*  |  *Arguments*  |  *Formula*  |
 | multiply | x, y, z | $x * y * z$ |]

The initial conditions are as follows:

[{width:30em,margin-left:5em}|       |*Value*          |*Units*        |
|Initial amount of S1                |$1 \x 10^-15$  |mole           |
|Initial amount of S2                |$0.1 \x 10^-15$              |mole           |
|Value of parameter k1               |$1$              |second^-2^     |
|Volume of compartment C |$1$              |litre          |]

The species' initial quantities are given in terms of substance units to
make it easier to use the model in a discrete stochastic simulator, but (as
per usual SBML principles) their symbols represent their values in
concentration units where they appear in expressions.

*)

newcase[ "00854" ];

addFunction[ multiply, arguments -> {x, y, z}, math -> x * y * z];
addCompartment[ C, size -> 1 ];
addSpecies[ S1, initialAmount -> 1 10^-15 ];
addSpecies[ S2, initialAmount -> 0.1 10^-15 ];
addParameter[ k1, value -> 1 ];
addReaction[ S1 -> S2, reversible -> False, 
 kineticLaw -> multiply[k1, S1,\[LeftAngleBracket]t, "time"\[RightAngleBracket]] * C];

makemodel[]