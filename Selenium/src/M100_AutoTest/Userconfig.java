package M100_AutoTest;

import java.util.Iterator;
import java.util.Set;

import org.testng.annotations.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.AfterMethod;
import org.openqa.selenium.firefox.FirefoxDriver;

import com.thoughtworks.selenium.Selenium;
public class Userconfig {

	WebDriver driver;
	  private String baseUrl;
	  @BeforeMethod
	  public void beforeMethod() throws InterruptedException {
 		  System.out.println("----AutoTestCase:TimeGroup Config Start----\n\n"
 		  		+ "Step 1:Login\n"
 		  		+ "Step 2:TimeGroup Add\n"
 		  		+ "Step 3:TimeGroup Edit\n"
 		  		+ "Step 4:TimeGroup Delete\n"
 		  		+ "Step 5:Logout\n"
 				  );	  
		  driver = new FirefoxDriver();
		    baseUrl = "https://192.168.13.13:8443";
		    driver.get(baseUrl + "/");
		    Thread.sleep(2000);
	  }
	  @AfterMethod
	  public void afterMethod() {
		  System.out.println("----AutoTestCase:TimeGroup Config End----\n");
	   
	   driver.quit();
	  }
	  @Test
	public void test2() throws InterruptedException {
		    //Login
		    driver.findElement(By.id("username")).clear();
		    driver.findElement(By.id("username")).sendKeys("admin");
		    driver.findElement(By.id("password")).clear();
		    driver.findElement(By.id("password")).sendKeys("admin");
		    driver.findElement(By.id("submit")).click();
		    
		    System.out.println("Step 1:Login Success\n");
			Thread.sleep(2000);
			
			
			driver.findElement(By.id("n2")).click();
			driver.findElement(By.linkText("�û�����")).click();
			driver.findElement(By.id("btn_add")).click();
			driver.findElement(By.id("btn_user_add")).click();
			driver.findElement(By.id("username")).clear();
			driver.findElement(By.id("username")).sendKeys("Autotest1");
			driver.findElement(By.id("userip")).clear();
		    driver.findElement(By.id("userip")).sendKeys("192.168.2.55");
			driver.findElement(By.cssSelector("#dlg_btn_user > a.link_btn")).click();
			driver.findElement(By.cssSelector("div.messager-button > a.l-btn")).click();
		    System.out.println("Step 4:TimeGroup Delete Success\n");
		     
			//Log out 
		    driver.findElement(By.id("quit")).click();
		    driver.findElement(By.cssSelector("div.messager-button > a.l-btn")).click();
		    System.out.println("Step 5:Logout Success\n");
	  }
	  

}
