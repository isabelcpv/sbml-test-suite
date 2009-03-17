(* 

category:      Test
synopsis:      Zeroth order mass action kinetics.
componentTags: Compartment, Species, Reaction, Parameter 
testTags:      InitialAmount
testType:      TimeCourse
levels:        1.2, 2.1, 2.2, 2.3, 2.4
generatedBy:   Analytic

The model contains one compartment called C.  There are two species called 
S1 and S2 and one parameter called k.  The model contains  one reaction that has
a kinetic law that defines zero order mass action kinetics (as referenced by 
SBO:0000047):

[{width:30em,margin-left:5em}|  *Reaction*  |  *Rate*  |
| S1 -> S2 | $k * C$  |]

The initial conditions are as follows:

[{width:30em,margin-left:5em}| |*Value*       |*Units*  |
|Initial amount of S1        |$1.0$ |mole                      |
|Initial amount of S2        |$0$ |mole                      |
|Value of parameter k       |$0.075$          |mole litre^-1^ second^-1^ |
|Volume of compartment C     |$1$             |litre                  |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) their symbols represent their values in concentration units
where they appear in expressions.

Note: The test data for this model was generated from an analytical solution
of the system of equations.

*)

newcase[ "00801" ];

addCompartment[ C, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0];
addSpecies[ S2, initialAmount -> 0];
addParameter[ k, value -> 0.075 ];
addReaction[ S1 -> S2, reversible -> False,
	     kineticLaw -> k * C ];

makemodel[]
