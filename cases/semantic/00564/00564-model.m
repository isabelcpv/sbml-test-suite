(* 

category:      Test
synopsis:      Basic two reactions with four species in one compartment with
an algebraic rule used to determine rate of change of one species.
componentTags: StoichiometryMath, Compartment, Species, Reaction, Parameter, AlgebraicRule 
testTags:      Amount, AssignedConstantStoichiometry, NonUnityStoichiometry
testType:      TimeCourse
levels:        2.1, 2.2, 2.3, 2.4
generatedBy:   Numeric

The model contains one compartment called C.  There are four
species called S1, S2, S3 and S4 and three parameters called k1, k2 and p1.
Species S3 is labeled as an SBML boundary species.  The model
contains two reactions defined as:


[{width:30em,margin-left:5em}|  *Reaction*  |  *Rate*  |
| S1 + S2 -> S3 | $k1 * S1 * S2 * C$  |
| (4 * p1)S3 -> S1 + S2 | $k2 * S3 * C$     |]

The model contains one rule:

[{width:30em,margin-left:5em}|  *Type*  |  *Variable*  |  *Formula*  |
 | Algebraic |   n/a    | $S4 - S1$  |]

The initial conditions are as follows:

[{width:30em,margin-left:5em}|       |*Value*          |*Units*                   |
|Initial amount of S1                |$1.0 \x 10^-1$  |mole                      |
|Initial amount of S2                |$2.0 \x 10^-1$  |mole                      |
|Initial amount of S3                |$1.0 \x 10^-1$  |mole                      |
|Initial amount of S4                |$1.0 \x 10^-1$  |mole                      |
|Value of parameter k1               |$0.75$           |litre mole^-1^ second^-1^ |
|Value of parameter k2               |$0.25$           |second^-1^                |
|Value of parameter p1               |$0.5$   |dimensionless     |
|Volume of compartment C             |$1$              |litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) their symbols represent their values in concentration units
where they appear in expressions.

*)

newcase[ "00564" ];

addCompartment[ C, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0 10^-1];
addSpecies[ S2, initialAmount -> 2.0 10^-1];
addSpecies[ S3, initialAmount -> 1.0 10^-1 ];
addSpecies[ S4, initialAmount -> 1.0 10^-1];
addParameter[ k1, value -> 0.75 ];
addParameter[ k2, value -> 0.25 ];
addParameter[ p1, value -> 0.5 ];
addRule[ type->AlgebraicRule, math -> S4 - S1];
addReaction[ S1 + S2 -> S3, reversible -> False,
	     kineticLaw -> k1 * S1 * S2 * C ];
addReaction[reactants->{S3}, products->{S1, S2}, reactantStoichiometry->{4 * p1}, 
       reversible -> False,
	     kineticLaw -> k2 * S3 * C ];

makemodel[]
