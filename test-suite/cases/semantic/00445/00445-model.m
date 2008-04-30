(* 

category:      Test
synopsis:      Basic two reactions with three species in one compartment
               and one event that assigns value to a species, subject to a delay.
componentTags: Compartment, Species, Reaction, Parameter, EventWithDelay 
testTags:      InitialAmount, StoichiometryMath
testType:      TimeCourse
levels:        2.1, 2.2, 2.3
generatedBy:   Numeric

The model contains one compartment called C.  There are three species
called S1, S2 and S3 and two parameters called k1 and k2.  The model
contains two reactions defined as:

[{width:30em,margin-left:5em}|  *Reaction*  |  *Rate*  |
| S1 + (2 * p1) S2 -> S3 | $k1 * S1 * S2 * C$  |
| S3 -> S1 + S2 | $k2 * S3 * C$     |]

The model contains one event that assigns a value to species S2:

[{width:30em,margin-left:5em}| | *Trigger*   | *Delay* | *Assignments* |
 | Event1                      | $S1 < 0.75$ | $0.95$  | $S2 = 1$      |]

The initial conditions are as follows:

[{width:30em,margin-left:5em}| |*Value* |*Units*  |
|Initial amount of S1          |$1.0$   |mole                      |
|Initial amount of S2          |$2.0$   |mole                      |
|Initial amount of S3          |$1.0$   |mole                      |
|Value of parameter k1         |$0.75$  |litre mole^-1^ second^-1^ |
|Value of parameter k2         |$0.25$  |second^-1^                |
|Value of parameter p1         |$1$     |                          |
|Volume of compartment C       |$1$     |litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) their symbols represent their values in concentration units
where they appear in expressions.

*)

newcase[ "00445" ];

addCompartment[ C, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0];
addSpecies[ S2, initialAmount -> 2.0];
addSpecies[ S3, initialAmount -> 1.0];
addParameter[ k1, value -> 0.75 ];
addParameter[ k2, value -> 0.25 ];
addParameter[ p1, value -> 1 ];
addReaction[ reactants->{S1, S2}, products->{S3}, reactantStoichiometry->{1, 2 * p1},
       reversible -> False,
	     kineticLaw -> k1 * S1 * S2 * C ];
addReaction[ S3 -> S1 + S2, reversible -> False,
	     kineticLaw -> k2 * S3 * C ];
addEvent[ trigger -> S1 < 0.75, delay->0.95, eventAssignment -> S2->1 ];

makemodel[]
