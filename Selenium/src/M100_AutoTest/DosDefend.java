package M100_AutoTest;

import org.openqa.selenium.support.ui.Select;

import static org.junit.Assert.*;

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
public class DosDefend {

	WebDriver driver;
	  private String baseUrl;
	  @BeforeMethod
	  public void beforeMethod() throws InterruptedException {
		  System.out.println("----AutoTestCase:Dos Attack Defend Config Start----\n\n"
	 		  		+ "Step 1:Login\n"
	 		  		+ "Step 2:Defend Rules Set\n"
	 		  		+ "Step 3:Environment Restore\n"
	 		  		+ "Step 4:Logout\n"
	 				  );
		  driver = new FirefoxDriver();
		    baseUrl = "https://192.168.13.13:8443";
		    driver.get(baseUrl + "/");
		    Thread.sleep(2000);
	  }
	  @AfterMethod
	  public void afterMethod() {
		  System.out.println("----AutoTestCase:Dos Attack Defend Config End----\n");
	   
	   driver.quit();
	  }
	  @Test
	public void test4() throws InterruptedException {
		    //Login
		    driver.findElement(By.id("username")).clear();
		    driver.findElement(By.id("username")).sendKeys("admin");
		    driver.findElement(By.id("password")).clear();
		    driver.findElement(By.id("password")).sendKeys("admin");
		    driver.findElement(By.id("submit")).click();
		    
		    System.out.println("Step 1:Login Success\n");
			Thread.sleep(2000);
			
			//Dos Defend Set
		    driver.findElement(By.id("n4")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.id("dosSet")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.id("protectsel1")).click();
		    driver.findElement(By.id("icmpThreshold")).clear();
		    driver.findElement(By.id("icmpThreshold")).sendKeys("100");
		    driver.findElement(By.id("protectsel2")).click();
		    driver.findElement(By.id("udpThreshold")).clear();
		    driver.findElement(By.id("udpThreshold")).sendKeys("100");
		    driver.findElement(By.id("protectsel3")).click();
		    driver.findElement(By.id("tcpThreshold")).clear();
		    driver.findElement(By.id("tcpThreshold")).sendKeys("100");
		    driver.findElement(By.id("protectsel4")).click();
		    driver.findElement(By.id("protectsel5")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.linkText("�ύ")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[8]/div[2]/div[4]/a/span/span")).click();
		    System.out.println("Step 2:Defend Rules Set Success\n");
		    Thread.sleep(1000);
		    
		    //Env Restore
		    driver.findElement(By.id("dosSet")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.id("protectsel1")).click();
		    driver.findElement(By.id("protectsel2")).click();
		    driver.findElement(By.id("protectsel3")).click();
		    driver.findElement(By.id("protectsel4")).click();
		    driver.findElement(By.id("protectsel5")).click();
		    driver.findElement(By.linkText("�ύ")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[8]/div[2]/div[4]/a/span/span")).click();
		    System.out.println("Step 3:Environment Restore Success\n");
		    
			//Log out 
		    driver.findElement(By.id("quit")).click();
		    driver.findElement(By.cssSelector("div.messager-button > a.l-btn")).click();
		    System.out.println("Step 4:Logout Success\n");
	  }
	  

}
