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
public class VlinkConfig {

	WebDriver driver;
	  private String baseUrl;
	  @BeforeMethod
	  public void beforeMethod() throws InterruptedException {
		  System.out.println("----AutoTestCase:Virtual Link Config Start----\n\n"
	 		  		+ "Step 1:Login\n"
	 		  		+ "Step 2:Virtual Link Add\n"
	 		  		+ "Step 3:Virtual Link Edit\n"
	 		  		+ "Step 4:Virtual Link Delete\n"
	 		  		+ "Step 5:Logout\n"
	 				  );
		  driver = new FirefoxDriver();
		    baseUrl = "https://192.168.13.13:8443";
		    driver.get(baseUrl + "/");
		    Thread.sleep(2000);
	  }
	  @AfterMethod
	  public void afterMethod() {
		  System.out.println("----AutoTestCase:Virtual Link Config End----\n");
	   
	   driver.quit();
	  }
	  @Test
	public void test3() throws InterruptedException {
		    //Login
		    driver.findElement(By.id("username")).clear();
		    driver.findElement(By.id("username")).sendKeys("admin");
		    driver.findElement(By.id("password")).clear();
		    driver.findElement(By.id("password")).sendKeys("admin");
		    driver.findElement(By.id("submit")).click();
		    
		    System.out.println("Step 1:Login Success\n");
			Thread.sleep(2000);
			
			
			driver.findElement(By.id("n3")).click();
		    driver.findElement(By.linkText("虚拟链路带宽")).click();
		    Thread.sleep(2000);
		    //Add virtual link
		    driver.findElement(By.id("btn_add")).click();
		    driver.findElement(By.id("linkname")).clear();
		    driver.findElement(By.id("linkname")).sendKeys("AutoTest");
		    driver.findElement(By.xpath("(//input[@type='text'])[3]")).click();
            driver.findElement(By.xpath("/html/body/div[8]/div/div[2]")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.xpath("(//input[@type='text'])[4]")).click();
		    driver.findElement(By.xpath("/html/body/div[9]/div/div")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.xpath("(//input[@type='text'])[5]")).click();
		    driver.findElement(By.xpath("/html/body/div[10]/div/div")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.id("upwidth")).clear();
		    driver.findElement(By.id("upwidth")).sendKeys("20");
		    driver.findElement(By.id("downwidth")).clear();
		    driver.findElement(By.id("downwidth")).sendKeys("20");
		    driver.findElement(By.linkText("确认")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[17]/div[2]/div[4]/a/span/span")).click();
		    System.out.println("Step 2:Virtual Link Add Success\n");
		  
		    //Edit virtual link
		    driver.findElement(By.name("ck")).click();
		    driver.findElement(By.id("btn_edit")).click();
		    driver.findElement(By.id("linkname")).clear();
		    driver.findElement(By.id("linkname")).sendKeys("AutoTest1");
		    driver.findElement(By.xpath("(//input[@type='text'])[3]")).click();
            driver.findElement(By.xpath("/html/body/div[8]/div/div[1]")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.xpath("(//input[@type='text'])[4]")).click();
		    driver.findElement(By.xpath("/html/body/div[9]/div/div")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.xpath("(//input[@type='text'])[5]")).click();
		    driver.findElement(By.xpath("/html/body/div[10]/div/div")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.id("upwidth")).clear();
		    driver.findElement(By.id("upwidth")).sendKeys("21");
		    driver.findElement(By.id("downwidth")).clear();
		    driver.findElement(By.id("downwidth")).sendKeys("21");
		    driver.findElement(By.linkText("确认")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[17]/div[2]/div[4]/a/span/span")).click();
		    System.out.println("Step 3:Virtual Link Edit Success\n");
		    
		    //Del virtual link
		    driver.findElement(By.name("ck")).click();
		    driver.findElement(By.id("btn_del")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[17]/div[2]/div[4]/a/span/span")).click();
		    System.out.println("Step 4:Virtual Link Delete Success\n");
		    
			//Log out 
		    driver.findElement(By.id("quit")).click();
		    driver.findElement(By.cssSelector("div.messager-button > a.l-btn")).click();
		    System.out.println("Step 5:Logout Success\n");
	  }
	  

}
