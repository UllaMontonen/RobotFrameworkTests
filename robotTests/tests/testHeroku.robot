*** Comments ***
Robotframerowk test cases for Heroku

To perform testing, you need the following installations on your own machine: Python and pip
Install robotframework on your machine using pip command: pip install robotframework
Install the SeleniumLibrary library: pip install robotframework-seleniumlibrary

Run the tests using the command: robot --name HerokuTest -d robotTests/reports robotTests/tests/testHeroku.robot
Or Or python -m robot --name HerokuTest -d robotTests/reports robotTests/tests/testHeroku.robot


*** Settings ***
Documentation       Deployment: Tests to check login and REST functions in project and entry

Library             SeleniumLibrary    15.0    5.0
Resource            ../Resources/resources.robot


*** Test Cases ***
Login to Heroku and GitHub Page
    [Tags]    login
    Open Browser and Navigate to GitHub Page
    Login With Heroku Test User Credentials
    Click Login Button
    Page Contain Heroku Test User's name

Adding a new project after logged in
    [Tags]    project   post
    Navigate to Projects Page
    Click Add Project Button
    Add Title to Project Input Section
    Click Save Button
    Page Contain Added Project

Editing an existing project title
    [Documentation]    Editing the title of the project
    [Tags]    project   put
    Click Edit Button
    Edit Project Title
    Click Save All Changes Button
    Page Contain Project Successful Edition

Adding a user to the project with role user
    [Documentation]    User will have the role user
    [Tags]    project   role
    # Navigate to Projects Page
    Click Edit Button
    Add Username to Project input section in Heroku
    Click Find Username Button
    Click Save All Changes Button
    Page Contain Project Successful Edition

Editing a user role from user to viewer
    [Tags]    project   role
    # Navigate to Projects Page
    Click Edit Button
    Choose the Second User from the List
    Choose the Viewer Role from the List
    # Sleep    1s
    Click Save All Changes Button
    Page Contain Project Successful Edition

Deleting the user from the project
    [Tags]    project   role
    # Navigate to Projects Page
    Click Edit Button
    Choose the Option to remove the Second User from the Project
    Click Save All Changes Button
    Page Contain Project Successful Edition

Checking that Project don't have other users
    [Tags]    project   role
    Click Edit Button
    Page Contain Does not have Other Users
    Click Cancel Button

Adding a new entry to RobotTest project
    [Tags]    entry   post
    Navigate to Entries Page
    Click Add Entry Button
    Choose Project for Added Entry
    Choose First Project Name from the List
    Add Comment to Entry Input Section
    Click Save Button
    Page Contain Added Project

Editing an existing entry
    [Documentation]    Editing entry's comment
    [Tags]    entry   put
    # Navigate to Entries Page
    Click Edit Button
    Edit Entry's comment
    Click Save Button
    Page Contain Entry Successful Saved

Deleting the first entry
    [Tags]    entry   delete
    # Navigate to Entries Page
    Click Delete Button
    Page Contain Entry Deletion Warning
    Click Delete Entry Button
    Wait Page Contain Successful Deletion

Deleting a project
    [Tags]    project   delete
    Navigate to Projects Page
    Click Delete Button
    Page Contain Project Deletion Warning
    Click Delete Project Button
    Wait Page Contain Project Successful Deletion

Testing logging out function
    [Tags]    logout
    Navigate to Logout Page
    Page Contain Successful Logout

Closing Browser
    Close Browser
