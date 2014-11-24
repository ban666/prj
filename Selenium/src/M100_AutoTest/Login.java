package M100_AutoTest;

import org.testng.annotations.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.AfterMethod;
import org.openqa.selenium.firefox.FirefoxDriver;

import com.thoughtworks.selenium.Selenium;
public class Login {

	WebDriver driver;
	  private String baseUrl;
	  @BeforeMethod
	  public void beforeMethod() throws InterruptedException {
		  
		  System.out.println("----AutoTestCase:Login Start----\n");	  
		  System.out.println("Step 1 Login\n"
		  		+ "Step 2 Logout\n"
				  );
		  		
		  driver = new FirefoxDriver();
		    baseUrl = "https://192.168.13.13:8443";
		    driver.get(baseUrl + "/");
		    Thread.sleep(2000);
	  }
	  @AfterMethod
	  public void afterMethod() {
		  System.out.println("----AutoTestCase:Login End----\n");
	   driver.quit();
	  }
	  @Test
	public void test1() throws InterruptedException {
		    //Login
		  int i=1;
		  while(i<5) {
		    System.out.println("Times:"+ i);  
		    driver.findElement(By.id("username")).clear();
		    driver.findElement(By.id("username")).sendKeys("admin");
		    driver.findElement(By.id("password")).clear();
		    driver.findElement(By.id("password")).sendKeys("admin");
		    driver.findElement(By.id("submit")).click();
		    
		    System.out.println("Step 1:Login Success\n");
			Thread.sleep(2000);
			 
			//Log out 
		    driver.findElement(By.id("quit")).click();
		    driver.findElement(By.cssSelector("div.messager-button > a.l-btn")).click();
		    System.out.println("Step 2:Logout Success\n");
		  i++;
		  }
	  }
	  

}