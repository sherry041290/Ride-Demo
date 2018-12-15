*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url_letkodeit}    https://sso.teachable.com/secure/42299/users/sign_in?clean_login=true&reset_purchase_session=1
${url_robotframework}    http://robotframework.org/#examples
@{login_info}     test@email.com    abcabc
&{Login_dic}      Username=test@email.com    Password=abcabc    # Dictionary of login

*** Test Cases ***
Testcase1
    SeleniumLibrary.Open Browser    ${url_robotframework}    edge
    Close Browser

TestLogin
    [Setup]    GotoLoginPage
    Login
    Log To Console    %{username} run the test on %{os}
    [Teardown]    Close Browser

Testcase2
    [Tags]    sherry
    Open Browser    http://google.com    chrome
    Close All Browsers
    Log To Console    Test2 done

Testcase3
    [Tags]    sherry
    Open Browser    http://kenh14

*** Keywords ***
Login
    Input Text    id=user_email    @{login_info}[0]
    Input Password    id=user_password    &{login_dic}[Password]
    Click Button    name=commit

GotoLoginPage
    Open Browser    ${url_letkodeit}    chrome
