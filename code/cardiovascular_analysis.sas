/* Cardiovascular Disease Risk Factors Analysis
   Group N academic project
   Cleaned SAS code transcription
*/

/* 1. Frequency analysis of categorical variables */
proc freq data=cardio;
    tables gender prevalentStroke / chisq;
run;

/* 2. Inspect dataset structure */
proc contents data=cardio;
run;

/* 3. Descriptive statistics */
proc univariate data=cardio;
    var age systolicBP;
run;

/* 4. Full logistic regression model */
proc logistic data=cardio;
    class gender prevalentStroke;
    model CVD(event="1") =
        gender
        prevalentStroke
        age
        systolicBP;
run;

/* 5. Reduced logistic regression model */
proc logistic data=cardio;
    class gender prevalentStroke;
    model CVD(event="1") =
        gender
        prevalentStroke
        age
        systolicBP
        / lackfit;
run;
