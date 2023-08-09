# README

## Lunch and Learn Baby
Lunch and Learn is backend application built with Ruby on Rails. It is a student project from Turing's Backend Module 3 program.
It is an API based application that allows users to search for recipes based on an input country. From there they can learn more about the country by watching YouTube videos or finding books about said country. Users will be able to add favorites to their personal list of recipe faves. 
This app follows RESTful API conventions.
<br><br>
   <img src="https://greatdemo.com/wp-content/uploads/2020/10/Lunch-and-Learn-e1625259161847.png" width="600" height="400">
### Learning Goals
The learning goals of this project were to 
- expose and API that aggregates data from multiple external APIs
- expose an API that requires an authentication token
- implement basic authentication
- expose an API for CRUD functionality
- determine completion criteria based on the needs of other developers
- test both API consumption and exposure
- make use of at least one mocking tool (I used VCR)
### Setup
1. fork and clone repo
2. install gem packages `bundle install` `bundle exec figaro install`
3. set up database `rails db:create`
4. get your API keys 
  - [https://restcountries.com/#api-endpoints-v3-all]
  - [https://developer.edamam.com/edamam-recipe-api]
  - [https://cloud.google.com/apis]
  - [https://unsplash.com/developers]
  and add them to the `application.yml` file created after installing figaro
### Endpoints
 - GET /api/v1/recipes?country=
 - GET /api/v1/learning_resources?country=
 - POST /api/v1/users
 - POST /api/v1/favorites
 - GET //api/vi/favorites?api_key=
``
#### Versions
 - Ruby 3.2.2
 - Rails 7.0.6

#### Built With
* ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
* ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
* ![Postman Badge](https://img.shields.io/badge/Postman-FF6C37?logo=postman&logoColor=fff&style=for-the-badge)

#### Project Requirements and Wireframes 
[https://backend.turing.edu/module3/projects/lunch_and_learn/requirements]
#### Contributing  [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/sicknacco/lend-a-toolza-be/issues)
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.
If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!
### Author
- Crow Rising [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/CrowRising) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/crowrising/)