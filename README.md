# README

This project has a DOCKERFILE, so you could use both files to execute the environment

- docker-compose up --build

Algorithm
 - The algorithm used for this project is the next:

1. Receive the long_term.
3. Verify if the url was already searched, if yes we increment the visited column of Website model.
2. Create a Website (Model) Record with the long_url and with the visited column in 1 (to record the number of times this URL was searched).
3. With an after_create we get the ID of the record which is unique and transform it to BASE64.
4. Save this BASE64 as short_url.
5. Return the short_url.