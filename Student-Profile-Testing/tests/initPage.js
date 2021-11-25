
const {By,Key,Builder} = require("selenium-webdriver");
require("geckodriver");

async function title(){
 
    var searchString = "Automation testing with Selenium and JavaScript";

    //To wait for browser to build and launch properly
    let driver = await new Builder().forBrowser("firefox").build();

     //To fetch http://google.com from the browser with our code.
     await driver.get("http://localhost:8080/Student-Profile-Servlet/");
         
     
     //Verify the page title and print it
     var title = await driver.getTitle();
     console.log('Title is:',title);

     if(title.localeCompare("login")==0)
     console.log("Success");
     
     await driver.quit();

}

async function loginrightrecords(){
 
    var searchString = "Automation testing with Selenium and JavaScript";

    //To wait for browser to build and launch properly
    let driver = await new Builder().forBrowser("firefox").build();

     //To fetch http://google.com from the browser with our code.
     await driver.get("http://localhost:8080/Student-Profile-Servlet/");
         
     
     
     var email="cb.en.u4cse17001@cb.students.amrita.edu";
     var pwd="stud1";

     await driver.findElement(By.name("email")).sendKeys(email,Key.RETURN);
     await driver.findElement(By.name("pwd")).sendKeys(pwd,Key.RETURN);
     await driver.findElement(By.id("loginbtn")).click();
     await driver.get("http://localhost:8080/Student-Profile-Servlet/Login?email="+email+"&pwd="+pwd);
     newmail= await driver.findElement(By.id("usermail")).getText();
     
    if(newmail.localeCompare(email)==0)
     console.log("Success");

     //It is always a safe practice to quit the browser after execution
     await driver.quit();
     

}

async function loginadminrecords(){
 
    var searchString = "Automation testing with Selenium and JavaScript";

    //To wait for browser to build and launch properly
    let driver = await new Builder().forBrowser("firefox").build();

     //To fetch http://google.com from the browser with our code.
     await driver.get("http://localhost:8080/Student-Profile-Servlet/");
         
     
     
     var email="Naren@cb.amrita.edu";
     var pwd="admin1";

     await driver.findElement(By.name("email")).sendKeys(email,Key.RETURN);
     await driver.findElement(By.name("pwd")).sendKeys(pwd,Key.RETURN);
     await driver.findElement(By.id("loginbtn")).click();
     await driver.get("http://localhost:8080/Student-Profile-Servlet/Login?email="+email+"&pwd="+pwd);
     newmail= await driver.findElement(By.id("adminid")).getText();
     
    if(newmail.localeCompare(email)==0)
     console.log("Success");

     //It is always a safe practice to quit the browser after execution
     await driver.quit();
     

}

async function loginwrongecords(){
 
    var searchString = "Automation testing with Selenium and JavaScript";

    //To wait for browser to build and launch properly
    let driver = await new Builder().forBrowser("firefox").build();

     //To fetch http://google.com from the browser with our code.
     await driver.get("http://localhost:8080/Student-Profile-Servlet/");
         
     
     
     var email="Narn@cb.amrita.edu";
     var pwd="admin1";

     await driver.findElement(By.name("email")).sendKeys(email,Key.RETURN);
     await driver.findElement(By.name("pwd")).sendKeys(pwd,Key.RETURN);
     await driver.findElement(By.id("loginbtn")).click();
     await driver.get("http://localhost:8080/Student-Profile-Servlet/Login?email="+email+"&pwd="+pwd);
     newmail= await driver.findElement(By.id("err-msg")).getText();
     
    if(newmail.localeCompare("Invalid Credentials")==0)
     console.log("Success");

     //It is always a safe practice to quit the browser after execution
     await driver.quit();
     

}

async function test_achievement_heading(){
    let driver = await new Builder().forBrowser("firefox").build();
     await driver.get("http://localhost:8080/Student-Profile-Servlet/");
     
     var email="cb.en.u4cse17001@cb.students.amrita.edu";
     var pwd="stud1";
     var heading = "Add Achievements";

     await driver.findElement(By.name("email")).sendKeys(email,Key.RETURN);
     await driver.findElement(By.name("pwd")).sendKeys(pwd,Key.RETURN);
     await driver.findElement(By.id("loginbtn")).click();
     await driver.get("http://localhost:8080/Student-Profile-Servlet/Login?email="+email+"&pwd="+pwd);
     await driver.get("http://localhost:8080/Student-Profile-Servlet/AchievementController");

     page_heading = await driver.findElement(By.id("achv_form")).getText();
     
    if(page_heading.localeCompare(heading)==0)
     console.log("Success");

     await driver.quit();
}

async function test_course_heading(){
    let driver = await new Builder().forBrowser("firefox").build();
     await driver.get("http://localhost:8080/Student-Profile-Servlet/");
     
     var email="cb.en.u4cse17001@cb.students.amrita.edu";
     var pwd="stud1";
     var heading = "Semester";

     await driver.findElement(By.name("email")).sendKeys(email,Key.RETURN);
     await driver.findElement(By.name("pwd")).sendKeys(pwd,Key.RETURN);
     await driver.findElement(By.id("loginbtn")).click();
     await driver.get("http://localhost:8080/Student-Profile-Servlet/Login?email="+email+"&pwd="+pwd);
     await driver.get("http://localhost:8080/Student-Profile-Servlet/CoursesController");

     page_heading = await driver.findElement(By.id("semester_no")).getText();
     
    if(page_heading.localeCompare(heading)==0)
     console.log("Success");

     await driver.quit();
}

async function main(){
    console.log("Title of the page");
    await title();
    console.log("Student Record - right record");
    await loginrightrecords();
    console.log("Admin Record - right record");
    await loginadminrecords();
    console.log("Achievement Test");
    await test_achievement_heading();
    console.log("Courses Test");
    await test_course_heading();
}
main();