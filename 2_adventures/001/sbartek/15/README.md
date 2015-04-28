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

* Implements creating answers form hash

*Execute the following command* in order to generate questionnare of
 Proust and to see his answers.

```
ruby proust_questionnaire.rb 
```

## Next

* creating any user_questionnaire with anwers

## Future ideas

* Terminal interface
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
