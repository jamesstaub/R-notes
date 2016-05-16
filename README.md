cheat sheets
================
http://www.sr.bham.ac.uk/~ajrs/R/r-function_list.html#general
https://r-dir.com/reference/crib-sheets.html

Data types
==========
summarized notes from
http://www.statmethods.net/input/datatypes.html
https://www.edx.org/course/programming-r-data-science-microsoft-dat209x
https://www.datacamp.com/community/tutorials/functions-in-r-a-tutorial


Singles
-------
Logical `TRUE` or `FALSE`
Single numbers `4`
Characters `"abc"`

vector
------

"Vectors can be thought of as contiguous cells containing data. Cells are accessed through indexing operations such as x[5]."
vectors have a single data type (integer, character, logical etc...)

if you try to create a mixed type vector, R will take the most general data type of the set and convert each element to that type.

given vector `a`
`a <- c(1,2,5.3,6,-2,4) # numeric vector`

Refer to elements of a vector using subscripts
`a[c(2,4)]`
returns:
`[1] 2 6`



factor
------
a statistical data type used to store categorical variables

The difference between a categorical variable and a continuous variable is that a categorical variable can belong to a limited number of categories.
 a categorical variable is the variable 'Gender'. A human individual can either be "Male" or "Female"

has a prespecified set of levels (passable values)

create a factor from a vector
`gender_vector <- c("Male", "Female", "Female", "Male", "Male")`
`gender_vector_factor <- factor(gender_vector)`
`# Levels: Female Male `

Generate Factor Levels with `gl()`
Generate factors by specifying the pattern of their levels.
`In[39]: gl(2, 3, labels= c('this', 'that'))
Out[39]: [1] this this this that that that
Levels: this that`



matrix
------
`matrix(c(1, 2, 3, 4)+pi, nrow=2)`

All columns in a matrix must have the same mode(numeric, character, etc.) and the same length.

"matrices are the data type for cross-referencing values (all same data type)""



dataframe
----------
A data frame is more general than a matrix, in that different columns can have different modes (numeric, character, factor, etc.).


c ross reference allows different data types, but typically all columns should be the same length.

`data.frame( fruit=c("apple", "orange", "banana"), price=c(1.5, 2, 3.33))`

arrays
------


lists
------
most general object type, elements can take any form.
