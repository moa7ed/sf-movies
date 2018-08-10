# SF_Movie

I made a prototype for one of the shared projects `SF Movies`

## Project Requirements
Create a service that shows on a map where movies have been filmed in San Francisco. The user should be able to filter the view using autocompletion search.

## Puplic API used
The data is available on [Film Locations](https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am), the API returns around 1500 of data-objects in this structure:
  ``` 
  {
    "title",
    "release_year",
    "locations":"2550165",
    "fun_facts":"2419733",
    "production_company":"6331",
    "distributor":"1564"
  }
  ```
  Returned data is full of duplicate rows.
  
## Other APIs
- `geocoder gem` to retrieve location latitude and longitude
- `Google Maps` to show locations on maps

## Technologies
- Ruby 2.5.1
- Rails 5.0.1
- Bundler 1.16.3
- Postgre gem
- Heroku for deployment

## Installing
Install all above technologies
```
git clone $repo
cd sf-movies
rake db:migrate
rake filling_data:read_data_from_Socrata_SF_Data
rails s
```
`rake filling_data:read_data_from_Socrata_SF_Data` command to call File Locations API and fill Postgre database

## Testing
I am using the following gems:
- rspec-rails
- factory_bot_rails
- shoulda-matchers
- faker
- database_cleaner

##### To run tests 
```rspec```

##### What to test
- models
- controllers
- I skipped views testing, I thought it will be out of scope of backend position

## Deployment
`Heroku` seems fast and free to deploy simple rails project like this one. 
I used `Heroku` and connected it with the Github repo.
Every push to this repo start deployment on Heroku

## Servers
- only for production https://stormy-shelf-15213.herokuapp.com

## CI for running tests
It could be added simply to Heroku pipeline and could be connected to Github pushes, but I didn't add that as it costs money

## Scaling
I suggest using AWS to scale this app as follow:
- create `CodeDeploy` application connected to my Github Repo and also add  Deployment configuration
- Create `ASG` with a criteria for scaling the `EC2` instances with user data containing all packages needed by `EC2` instances to run rails application
- Add required scripts by `EC2` instances to the repo

I didn't do that as I afraid to exceeds free-tier limits.

## How to use front-end
- API reutrns some locations outside San Francasco, I filtered out these locations
- visit https://stormy-shelf-15213.herokuapp.com or https://stormy-shelf-15213.herokuapp.com/locations/index to show UI for the application
- Tha page contains a `map` displaying all locations
- click on any location to see list of movies regarding to this locations
- the page also contains list of filteration boxes with (`and`) condition which means it is better to search with one attribute at a time to find results
- all text fileds support autocomplete
- after add some values to the text fileds click on search