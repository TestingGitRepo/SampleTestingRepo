*** Settings ***
Resource          Resource/Common.robot    #Resource | CommonLibraries/CommonLib.robot

*** Test Cases ***
TC1
    Log    "Hello"
    Open Browser    https://www.amazon.co.in    ie

TC2
    OpenBrowser    http://getbootstrap.com/docs/4.0/examples/checkout/    ie
    SeleniumLibrary.Input Text    //*[@id='firstName']    Anusha
    SeleniumLibrary.Input Text    //*[@id='lastName']    Krishna
    SeleniumLibrary.Input Text    //*[@id='username']    AnuKrish
    SeleniumLibrary.Input Text    //*[@id='email']    nia9247@gmail.com
    SeleniumLibrary.Input Text    //*[@id='address']    Aapelinkatu 6E
    Click Element    //*[@id='country']
    Click Element    //*[@id="country"]/option[2]
    Click Element    //*[@id='state']
    Click Element    //*[@id="state"]/option[2]
    SeleniumLibrary.Input Text    //*[@id='zip']    A32DZ
    SeleniumLibrary.Input Text    //*[@id='cc-name']    Anu
    SeleniumLibrary.Input Text    //*[@id='cc-number']    24353466
    SeleniumLibrary.Input Text    //*[@id='cc-expiration']    24/09/2018
    SeleniumLibrary.Input Text    //*[@id='cc-cvv']    7766
    Click Element    //*[@type='submit' and @class="btn btn-primary btn-lg btn-block"]

TC3
    Open Browser    http://getbootstrap.com/docs/4.0/examples/    gc    alias=main
    Click Link    //body/header/div/ul/li[4]/a
    Select Window    locator=CURRENT
    #Sleep    5s
    Title should be    https://themes.getbootstrap.com/
    ${var1}=    Get Location
    Log    ${var1}
    Input Text    //*[@placeholder='Search' and @type='search']    Bootstrap
    Click Element    //i[@class="bootstrap-themes-icon-search"]
    ${var1}=    Get Location
    Log    ${var1}
    Select Window    locator=CURRENT
    Sleep    5s
    #Switch Browser    main

TC4
    Open Browser    https://themes.getbootstrap.com/    ff
    Input Text    //*[@placeholder='Search' and @type='search']    Bootstrap
    ${var1}=    Get Location
    Log    ${var1}
    ${search_button}=    //i[@class="bootstrap-themes-icon-search"]
    Press Key    ${search_button}    \\13
    #Click Element    //i[@class="bootstrap-themes-icon-search"]
    ${var1}=    Get Location
    Log    ${var1}
    Click Element    //*[@id="content"]/ul/li[2]/div/div[2]/div[1]/a
    ${var1}=    Get Location
    Log    ${var1}

DragNDrop
    Open Browser    http://marceljuenemann.github.io/angular-drag-and-drop-lists/demo/#/simple    gc
    Maximize Browser Window
    #Drag And Drop    //body/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div/div[2]/ul/li[2]    //body/div[2]/div[2]/div[2]/div[1]/div[1]/div[2]/div/div[2]/ul/li[1]
    Comment    Mouse Down    //body/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div/div[2]/ul/li[2]
    Comment    Mouse Up    //body/div[2]/div[2]/div[2]/div[1]/div[1]/div[2]/div/div[2]/ul/li[1]
    Drag And Drop By Offset    //body/div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div/div[2]/ul/li[2]    50    -10

TestDnD
    Selenium2Library.Open Browser    http://www.google.com    ie
    #Drag And Drop    //*[@id="draggable"]    //*[@id="droppable"]
    Comment    Drag and Drop by Offset    //*[@id="draggable"]    50    0
    Comment    Element Text Should Be \ \ \ \    xpath=//div[@id='droppable']/p    Dropped!
    Comment    wait until element is visible    Dropped!

ChainCreate&Release
    Open Browser    http://jqueryui.com/droppable/    ff
    Drag and Drop    //*[@id="draggable"]    //*[@id="droppable"]

Excel_TC
    Test Initialization    1    ${testsheetname}
    Comment    Open Browser    https://www.amazon.in/    ff    #If we are cheking web apps
    Comment    Click Element    //*[@id="nav-link-yourAccount"]
    Comment    Select Window    title=Amazon Sign In
    Comment    Input Text    //*[@id="ap_email"]    ${IN_Username}
    Comment    Click Button    //*[@id="continue"]
    Comment    Input Text    //*[@id="ap_password"]    ${IN_Password}
    Comment    Click Element    //*[@id="signInSubmit"]
    Comment    Run    D:\\Workspace\\RobotFramework\\SampleTests\\SampleTestProject\\Testdata\\Run.vbs
    Comment    Create File    D:\\Workspace\\RobotFramework\\SampleTests\\SampleTestProject\\Testdata\\TestFile.txt    ${IN_Username}\r\n${IN_Password}    encoding=UTF-8
    Comment    GetValuesFromNotepad
    Comment    ${ret} =    Grep File    D:\\Workspace\\RobotFramework\\SampleTests\\SampleTestProject\\Testdata\\TestFile.txt    @gmail.com
    Comment    Log    ${ret}
    AutoItLibrary.Run    ${IN_Path}
    Comment    Wait for Active Window    Window Title=worksoft certify    TimeOut=10
    Comment    Control Set Text    strText=admin
    Sleep    10s
    Sikuli Library.Input Text    \    ${IN_Username}
    Sikuli Library.Input Text    \    ${IN_Password}

OpenDesktopApp
    Comment    Run    D:\\Workspace\\RobotFramework\\SampleTests\\SampleTestProject\\Testdata\\Run.vbs
    Comment    Create File    D:\\Workspace\\RobotFramework\\SampleTests\\SampleTestProject\\Testdata\\TestFile.txt    ${IN_Username}    encoding=UTF-8
    Comment    GetValuesFromNotepad
    AutoItLibrary.Run    C:\\Program Files (x86)\\Worksoft\\Certify\\Client\\Worksoft.Certify.exe

SampleExcelDesktop
    Test Initialization    1    ${testsheetname}
    AutoItLibrary.Run    ${IN_Path}
    Wait For Active Window    Worksoft Certify Login
    AutoItLibrary.Control Set Text    Worksoft Certify Login    ${EMPTY}    WindowsForms10.EDIT.app.0.2a45bdb_r20_ad11    ${IN_Username}
    AutoItLibrary.ControlFocus    Worksoft Certify Login    ${EMPTY}    WindowsForms10.EDIT.app.0.2a45bdb_r20_ad11
    AutoItLibrary.Control Set Text    Worksoft Certify Login    ${EMPTY}    WindowsForms10.EDIT.app.0.2a45bdb_r20_ad12    ${IN_Password}
