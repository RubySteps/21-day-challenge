#ISBN Validator

ISBN's (International Standard Book Numbers) are 10 digit identifiers for books. Given the correct sequence of digits, one book can be identified out of millions of others thanks to this ISBN. But when is an ISBN not just a random slurry of digits? 
___
Given the following constraints of the ISBN number, this function returns **True** if a number is a valid ISBN.

*To verify an ISBN*:

Obtain the sum of 10 times the first digit, 9 times the second digit, 8 times the third digit... all the way till you add 1 times the last digit. If the sum leaves no remainder when divided by 11 the code is a valid ISBN.

*For example*:

0-7475-3269-9 is Valid because

(10 * 0) + (9 * 7) + (8 * 4) + (7 * 7) + (6 * 5) + (5 * 3) + (4 * 2) + (3 * 6) + (2 * 9) + (1 * 9) = 242 which can be divided by 11 and have no remainder.

For the cases where the last digit has to equal to ten, the last digit is written as X. For example 156881111X.

*taken from daily programmer via reddit*

