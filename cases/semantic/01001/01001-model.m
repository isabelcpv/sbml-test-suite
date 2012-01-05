(* 

category:      Test
synopsis:      Basic single forward reaction with two species in a size-10 compartment 
               where the species have only substance units.
componentTags: Compartment, Species, Reaction, Parameter 
testTags:      Amount, HasOnlySubstanceUnits, NonUnityCompartment
testType:      TimeCourse
levels:        2.1, 2.2, 2.3, 2.4, 3.1
generatedBy:   Analytic

Note:  This test is a direct copy of test 00060, but with a size-10 compartment, to test the 'hasOnlySubstanceUnits' attribute.  The model should have exactly the same results, as concentration should have never been used to calculate anything.
 
The model contains one compartment called "compartment".  There are two
species named S1 and S2 and one parameter named k1.  The model contains one
reaction defined as:

[{width:30em,margin-left:5em}|  *Reaction*  |  *Rate*  |
| S1 -> S2 | $k1 * S1$  |]

The initial conditions are as follows:

[{width:30em,margin-left:5em}|       |*Value*         |*Units*  |
|Initial amount of S1                |$1.5 \x 10^-3$ |mole                      |
|Initial amount of S2                |$            0$ |mole                      |
|Value of parameter k1               |$          1.5$ |second^-1^ |
|Volume of compartment "compartment" |$           10$ |litre                     |]

The species have been declared as having substance units only. Thus, they 
must be treated as amounts where they appear in expressions.

Note: The test data for this model was generated from an analytical
solution of the system of equations.

*)

newcase[ "00060" ];

addCompartment[ compartment, size -> 10 ];
addSpecies[ S1, initialAmount -> 1.5 10^-3, hasOnlySubstanceUnits->True ];
addSpecies[ S2, initialAmount -> 0, hasOnlySubstanceUnits->True ];
addParameter[ k1, value -> 1.5 ];
addReaction[ S1 -> S2, reversible -> False,
	     kineticLaw -> k1 * S1 ];

makemodel[]
