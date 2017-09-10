# Model Explanation / Outline

by Elliot Williams

**QAC312 Assignment 1: **Propose an HLM model

#### Prompt

Choose a data set that you would like to work with for your course project. Describe the hierarchy of the data (for example, Level 1: students, Level 2: schools, or Level 1: individuals, Level 2: households, or Level 1: repeated measures, Level 2: individuals). 

Then, conceptualize a hierarchical linear model by a) formulating a research question, b) identifying a response variable and c) proposing a minimum of two Level 1 predictor variables and two Level 2 predictors of your response variable.

For your assignment submit via Moodle:

1) A sentence or two describing your research question

2) The name and a brief description of the hierarchy of your data set,

3) A brief definition, including the distribution (quantitative or binary), of your response variable,

4) A brief definition, including the distributions (quantitative or categorical), of your Level 1 and Level 2 predictor variables.

#### Answer

1. My research question is "How does the real and perceived agency people have regarding their work schedule affect the psychological distress of employees?"

2. The dataset I am using is the 2009-2011 Work, Family and Health Study (WFHS). It is a joint initiative of the NIH and the CDC, and the dataset describes the working conditions and wellbeing of employees within the IT division of an anonymous Fortune 500 company, codenamed "Tomo".

3. The response variable is EM_DIST1, which is a categorical variable measuring employee response to the question "During the past 30 days, how much of the time did you feel so sad nothing could cheer you up? Was it all of the time, most of the time, some of the time, a little of the time, or none of the time?".

   The responses themselves are on an ordinal scale, where 1 corresponds to "None of the Time", and 5 stands for "All of the time". Given the variable is ordinal, it goes without saying it has a discrete distribution. It is strongly skewed right; most employees report feeling that sad none of the time, and very few report feeling that sad all of the time.

4. ​

   Level 1 Variables:

   * WM_WFC2, which measures employee agreeance to the statement "The amount of time your job takes up makes it difficult to fulfill your family or personal responsibilities". Qualitative, ordinal, discrete data; skewed slightly to the right.
   * WM_CWHX1, which measures how much choice an employee perceives to have over when they take vacations or days off. Qualitative, ordinal, discrete data; skewed strongly to the left.

   Level 2 Variables:

   * WM_OCLI1, which measures agreeance to the existence of an expectation that employees take time away from family to get work done. Qualitative, ordinal, discrete data; bimodal, and not obviously skewed on the employee level; I will average this data for each work group to turn it into a Level 2 variable.
   * WM_OCLI2, which measures agreeance to the existence of an expectation that employees put their families or personal lives second to their jobs. Qualitative, ordinal, discrete data; bimodal, and skewed left; I will average this data for each work group to turn it into a Level 2 variable. This is similar to OCLI1, but I feel like the difference between OCLI1 and OCLI2 might tease out the role of agency in predicting employee emotional distress. 
   * WM_SICK, which measures how obligated an employee feels to come to work while sick. Qualitative, ordinal, discrete data; bimodal, and not obviously skewed at the employee level; I will average this data for each work group to turn it into a Level 2 variable.