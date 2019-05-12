# Cooler Communities – notes
 
## Intake 
[] Requirement Instead of using the language "commit to" please use "choose to." 
[] Select category tab, answer questions, save category data for that tab. 
[] Web interface or a text-based entry 
[] Add entry on mobile phone 
[] Not have spam answers 
[] Limited open text responses 
*[] Community filter(?)
[] Options are various environmentally friendly actions 
[] Commitment follow up steps 
[] Email recorded for follow up

## Logic 
[] Calculate choice(s) by type 
[] Calculate total choice(s) by user

## Visualization 
[] Live user CO2 total commit 
[] Visualization of community choice(s) 
[] Live running total of all choice(s) 
[] Sub group choice(s) visualization 
[] Ability to show choice(s) has been achieved 
[] Town admin receives data from community
[] Producing an attendee's list of choice(s) summary that can be printed at the event, and or [] emailed. 

## Choices
[] Attendees make choice(s) that in combination drive towards an event CO2 reduction goal.
[] Community Level Target for each of 10 categories 

## Kiosk/Stations

### Example Solar station activities: 
[] Project Sunroof or other options set up to check potential at Kiosk / Computer 
[] Opportunity to learn about options pamphlets and experts 
[] One way kiosk or mobile selection to make a choice(s) (box = question) 
[] Questions ask and capture the net difference, not before and after 
[] Adjustment (slider) of certain variables in question (i.e. kw) will adjust point total 
[] Will you commit to installing a solar panel this year? 
[] Choose to An Assessment = 1,175 points 
[] Choose to Purchase a Solar Array (7kw) = 5,875 points

### Example Yard & Landscaping station questions: 
[] 	Display average emissions for (mowers, lawns, fertilizer) and provide background 
[] 	Share opportunities at booth to take next steps (assessments, mower swaps etc.) 
[] 	One way kiosk or mobile selection to make a choice(s) (box = question) 
[] 	Questions ask and capture the net difference, not before and after 
[] 	Adjustment (slider) of certain variables (i.e. fertilize applications) will adjust point total 
  Will you commit to?
    Choose to replace gas mower with manual or electric = 396 points 
    Choose to lower frequency of mowing (#) times a year = 400 points 
    Choose to replace gas equipment for rake or electric blower = 194 points
    Choose to reduce lawn footprint (size diff) = (C02 unit per Square ft) 
    Choose to reduce use of fertilizer (2) (applications per point) 
    Choose to get a free low maintenance lawn assessment = 137 points

=======================================================================
## App Flow

## Architecture
Server framework: Rails
API = Rails posgreSQL database
Survey logic uses Surveyjs.io library produces styled survey front end
The survey definition from Surveyjs embed option produces the survey front end in JSON format
The surveyJSON data will be separated by category, each category populating one of the 10 tabbed views
Each tabbed category view will have a button to save the responses of that view
JSON data responses are captured via POST request to the Rails API
 
### V2
App can digest any survy definition (surveyJSON) from Surveyjs.io
Parses the JSON into tabs corresponding to definition

## Admin panel
Edit Survey on Survey.js site 
Paste newly defined JSON into Javascript variable
Survey.js creates JSON version of Survey data
Admin can edit the JSON data with free acct at surveyjs.io
We provide an admin interface to upload a new JSON survey

### User Registration
Eventbrite CSV download, to be imported, creating User accounts
User registration onsite at an event

### Landing Page
Welcome
Explanations
Instructions

## Concord Community website colors, approximated
maroon: #932762
blue: #D2BDD4
green: #547F28

### User Panel
Account info
Survey history

### User Starts a Survey
When a registered User starts the Survey.
A full instance of Survey is created
A full uncompleted Survey has all 10 categories, 39 questions, 39 blank responses

User completes questions, 
  Javascript captures responses, 
    Javascript posts data to /responses, upon each completed answer
    Survey is saved
    Questions selected are saved
    Responses are saved
 
Edit Javascript to parse the stored JSON response data and POST it to the Rails API
PostgreSQL database
  User can create multiple surveys, but logic will direct to most recent, uncomplete survey
  Tabs along the left of the app correspond to the 10 categories, with clickable Noun project images
  Uncomplete survey will show completed sections by grayed out / completed color
  Uncomplete survey will present uncompleted sections by color

### Category tabs
Each left side tab corresponds to a Category
Ruby parses that JSON data, programatically creating an instance of Survey in Rails database
Ruby parses that JSON data, programatically creating an instance of Survey
As User completes questions on an individual category tab, Javascript POSTs user response data to the Rails db

               blank survey         tab selected      tab unsaved       tab saved 
<img>          visible w/clear bg
TAB
BORDER
SAVE-BUTTON

### category image icons


=======================================================================

Partial completion of a subset of chosen categories
Update of existing Survey based on user_id


## Data visualization
Survey data feeds aggregate math
Javascript reads from Rails API to show data viz
Boxes update upon save of an individual Category tab
Boxes update upon save of a Survey

## Summarize choices 
[] Tally aggregate choices
[] Commitments by Category
[] Commitments by Community
[] Commitments by User (person)
[] Commitments by Group (?) Community total for this Category? 

[] Provide summarized data via printout / email 
[] Thank you screen 
[] Thank you email

## Export data to AirTable, Google Sheet, CSV download for admins only
[] Optional: sync of data with Airtable or Google Sheets 
[] Kiosks or mobile interface at event
[] Admin CSV download, from within "Admin Panel"

 
=======================================================================
## Tasks
[] Mock up of two action areas by Thursday
[] separate surveyJSON by category
[] how to show a single category in a view


[] future: parse surveyJSON into Rails seed file

[] show category in view
[] connect the surveyJSON.json (survey definition) to the database model
[] display a Solar category in a tab view

[] figure out the results.json, get the keys needed
[] thank you / summary email data
[] community summary data visualizations

[] display sections based on user selections

[] figure out the results.json, get the keys needed
[] connect the json to the database model
[] change category selection to multiple checkboxes (instead of radio buttons)
 
[] process surveyJSON into an instance of Survey object
[] process each key of surveyJSON into an array of Question objects, each with a category_id of that key
[] process the user's responses by creating unique rows

[] commitment summary
[] set up user authentication with Devise
[] thank you / summary email data
[] community summary data visualizations
 
[x] Ruby on Rails app 
[x] Devise for user logins 
[x] JavaScript library Survey.js to intake responses from users and POST data to Rails backend.
[x] Survey JSON: json format definition of survey questions and choices, from Survey.js library
[x] change survey keys to camelCased with convention
[x] set up user authentication with Devise

===============================================================================

190511
[] refactor Rails data model to CSV from AirTable
 
[] Edit AirTable to create the content: questions, response_types, responses, points
[] Export AirTable to CSV
[] Edit Surveyjs to create the survey using values from AirTable CSV
  question_key
  question_text
  question_type
  response(s)
  conditional logic (where applicable)

[] Embed surveyJSON (variable from Surveyjs) into Javascript: survey.js

[] Write a Ruby method to import AirTable CSV into surveyJSON


[] Rails db imports and stores questions

[] Response model 
- takes in params from user survey results
- handles boolean answer
- handles integer answer
- handles text answer
- handles array answer
- handles points for each type of answer

make a lookup table for points


import questions from AirTable doc

modify Rails database

[] incorporate multi-selects, booleans, slider value
[] implement js slider nouslide widget in surveyjs
[] 
