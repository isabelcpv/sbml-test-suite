(* 

category:      Test
synopsis:      Model using parameters and rules only, with csymbol time.
componentTags: Parameter, RateRule 
testTags:      NonConstantParameter, CSymbolTime
testType:      TimeCourse
levels:        2.1, 2.2, 2.3
generatedBy:   Numeric

The model contains two varying parameters called k1 and k2 and one constant
parameter called k3.  

The model contains two rules:

[{width:30em,margin-left:5em}|  *Type*  |  *Variable*  |  *Formula*  |
 | Rate                                 | k1           | $-k1 * k3 * t$  |
 | Rate                                 | k2           | $k1 * k3 * t$   |]
where the symbol 't' denotes the current simulation time.

The initial conditions are as follows:

[{width:30em,margin-left:5em}| |*Value*         |*Units*    |
|Value of parameter k1         |$1.5 \x 10^-15$ |any        |
|Value of parameter k2         |$            0$ |same as k1 |
|Value of parameter k3         |$            1$ |second^-2^ |]


*)

newcase[ "00891" ];

addParameter[ k1, value -> 1.5 10^-15, constant -> False ];
addParameter[ k2, value -> 0, constant -> False ];
addParameter[ k3, value -> 1 ];
addRule[ type->RateRule, variable -> k1, math -> -k1 * k3 * \[LeftAngleBracket]t, "time"\[RightAngleBracket]];
addRule[ type->RateRule, variable -> k2, math -> k1 * k3 * \[LeftAngleBracket]t, "time"\[RightAngleBracket]];

makemodel[]