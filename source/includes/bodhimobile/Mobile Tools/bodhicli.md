# Access the API using Bodhi command line

In this lab exercise we are going to work with the type system using Bodhi CLI.

At the end of this lab you will have accomplished the following:  
1. Made a query against the API to display all types in the system  
2. List the properties of a type  
3. Create a new type  
4. Quicky create a data file to populate the type 5. Post data to the type  

To use the following examples you must set up your project.json file as described in the set up instructions for the Bodhi CLI.

bodhi-types --help  
bodhi-types ls  
bodhi-types get team_member  
bodhi-types lp team_member  
bodhi-types new survey --namespace  
bodhi-types set-prop survey name  
bodhi-types set-prop survey name -S  
bodhi-types set-prop survey survey_date -T  
bodhi-types set-prop survey survey_rating -I  
bodhi-types set-prop survey survey_comments -S  
bodhi-types post survey  
bodhi-types get survey  
bodhi-types gen-instance survey  
