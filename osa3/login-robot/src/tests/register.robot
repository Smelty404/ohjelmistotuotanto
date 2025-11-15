*** Settings ***
Resource  resource.robot
Test Setup  Create User And Input Login Command

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  pontso  maikki123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  maikki123
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Credentials  po  maikki123
    Output Should Contain  username must be at least 3 characters

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  ඞඞඞ  maikki123
    Output Should Contain  username must only contain characters a-z

Register With Valid Username And Too Short Password
    Input Credentials  pontso  maikki
    Output Should Contain  password must be at least 8 characters long

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  pontso  maikkimaikki
    Output Should Contain  password can't only contain letters

*** Keywords ***
Create User And Input Login Command
    Create User  kalle  kalle123
    Input New Command