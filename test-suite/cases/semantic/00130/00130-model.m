(* 

category:      Test
synopsis:      Basic reactions with three species in a compartment 
               involving a stoichiometryMath element that uses a functionDefinition.
componentTags: Compartment, Species, Reaction, Parameter, FunctionDefinition 
testTags:      InitialAmount, StoichiometryMath
testType:      TimeCourse
levels:        2.1, 2.2, 2.3
generatedBy:   Numeric

The model contains one compartment called "compartment".  There are three
species named S1, S2 and S3 and three parameters named k1, k2 and p1.  The
model contains two reactions defined as:

[{width:30em,margin-left:5em}|  *Reaction*  |  *Rate*  |
| S1 + S2 -> S3 | $k1 * S1 * S2 * compartment$  |
| multiply(2, p1)S3 -> S1  +  S2 | $k2 * S3 * compartment$  |]


The model contains one functionDefinition defined as:

[{width:30em,margin-left:5em}|  *Id*  |  *Arguments*  |  *Formula*  |
 | multiply | x, y | $x * y$ |]


The initial conditions are as follows:

[{width:30em,margin-left:5em}|       |*Value*          |*Units*  |
|Initial amount of S1                |$1.0 \x 10^-12$ |mole                      |
|Initial amount of S2                |$2.0 \x 10^-12$ |mole                      |
|Initial amount of S3                |$1.0 \x 10^-12$ |mole                      |
|Value of parameter k1               |$ 1.7 \x 10^10$ |litre mole^-1^ second^-1^ |
|Value of parameter k2               |$          0.3$ |second^-1^ |
|Value of parameter p1               |$            1$ | |
|Volume of compartment "compartment" |$            1$ |litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) their symbols represent their values in concentration units
where they appear in expressions.

*)

newcase[ "00130" ];

addFunction[ multiply, arguments -> {x, y}, math -> x * y];
addCompartment[ compartment, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0 10^-12];
addSpecies[ S2, initialAmount -> 2.0 10^-12];
addSpecies[ S3, initialAmount -> 1.0 10^-12];
addParameter[ k1, value -> 1.7 10^10 ];
addParameter[ k2, value -> 0.3 ];
addParameter[ p1, value -> 1 ];
addReaction[ S1 + S2 -> S3, reversible -> False,
	     kineticLaw -> k1 * S1 * S2 * compartment ];
addReaction[ reactants->{S3}, products->{S1, S2}, 
             reactantStoichiometry->{multiply[2,p1]}, reversible -> False, 
             kineticLaw -> k2 * S3 * compartment ];

makemodel[]
