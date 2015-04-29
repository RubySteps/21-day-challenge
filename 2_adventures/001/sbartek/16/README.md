# Proust Questionnaire

## Project description

In this project I implement a bit silly Proust Questionnaire:

http://en.wikipedia.org/wiki/Proust_Questionnaire

this way everyone can compare his answers with the ones given by
Proust.

I will try BDD using Minitest.

In order to run specs
    ruby spec/runner.rb

## Today

Finally done.

*Execute the following command* 

```
ruby proust_questionnaire.rb 
```

This wil prompt you for name, and ask questions from short
questionnaire. Then it will print your answers together with Proust
ones. 


## Next

* creating any user_questionnaire with anwers

## Future ideas


* Parse Prost Answers from web (using nokogiri?)
* Change classes into ActiveRecord clases to save answers
* Create web interface (rails?)
* Create stye in old style :)
* Auth users


## Progress

* Directory /doc include a photo of class model structure
* Archive prost.yaml with questions and answers of Proust
* Implements spec for classes Question and Questionnaire 
* Implements classes Question and Questionnaire
* Implements method for creating a questionnaire from a hash
* Implements spec for a user questionnaire.
* Implements spec for a class QuestionsAnswers and the class.
* Implements QuestionsAnswer class and UserQuestionnaire
* Reorganizes directory structure of classes into one similar to rails
* Implements spec for creating user_questionaire
  (answers to questionnaire) from hash
* Implements creating answers form hash
