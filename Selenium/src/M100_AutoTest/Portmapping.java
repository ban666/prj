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
public class Portmapping {

	WebDriver driver;
	  private String baseUrl;
	  @BeforeMethod
	  public void beforeMethod() throws InterruptedException {
		  System.out.println("----AutoTestCase:Portmapping Config Start----\n\n"
	 		  		+ "Step 1:Login\n"
	 		  		+ "Step 2:Add Rule Set\n"
	 		  		+ "Step 3:Edit Rule\n"
	 		  		+ "Step 4:Delete Ruls\n"
	 		  		+ "Step 5:Logout\n"
	 				  );
		  driver = new FirefoxDriver();
		    baseUrl = "https://192.168.13.13:8443";
		    driver.get(baseUrl + "/");
		    Thread.sleep(2000);
	  }
	  @AfterMethod
	  public void afterMethod() {
		  System.out.println("----AutoTestCase:Portmapping Config End----\n");
	   
	   driver.quit();
	  }
	  @Test
	public void test6() throws InterruptedException {
		    //Login
		    driver.findElement(By.id("username")).clear();
		    driver.findElement(By.id("username")).sendKeys("admin");
		    driver.findElement(By.id("password")).clear();
		    driver.findElement(By.id("password")).sendKeys("admin");
		    driver.findElement(By.id("submit")).click();
		    
		    System.out.println("Step 1:Login Success\n");
			Thread.sleep(2000);
			
			//Add Rule
		    driver.findElement(By.id("n4")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.id("dis_PortMap")).click();
		    Thread.sleep(1000);
		    driver.findElement(By.id("btn_add")).click();
		    driver.findElement(By.id("pmname")).clear();
		    driver.findElement(By.id("pmname")).sendKeys("Autotest");
		    driver.findElement(By.cssSelector("input.combo-text.validatebox-text")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("//div[@value='udp']")).click();
		    driver.findElement(By.id("dip")).clear();
		    driver.findElement(By.id("dip")).sendKeys("1.1.1.1");
		    driver.findElement(By.id("tip")).clear();
		    driver.findElement(By.id("tip")).sendKeys("2.2.2.2");
		    driver.findElement(By.id("tport")).clear();
		    driver.findElement(By.id("tport")).sendKeys("655");
		    driver.findElement(By.linkText("提交")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[10]/div[2]/div[4]/a/span/span")).click();
		    Thread.sleep(2000);
		    System.out.println("Step 2:Add Rule Success\n");
		    
		    //Edit Rule
		    driver.findElement(By.name("ck")).click();
		    driver.findElement(By.id("btn_edit")).click();
		    driver.findElement(By.id("pmname")).clear();
		    driver.findElement(By.id("pmname")).sendKeys("Autotest1");
			Thread.sleep(2000);
		    driver.findElement(By.id("wansel2")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("id('wansel2_content')/div/span/input[1]")).click();
		    driver.findElement(By.xpath("//div[@value='eth0']")).click();		  
		    driver.findElement(By.id("dip")).clear();
		    driver.findElement(By.id("dip")).sendKeys("1.1.1.2");
		    driver.findElement(By.id("dportsel2")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.id("dport")).clear();
		    driver.findElement(By.id("dport")).sendKeys("665");
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("id('dportsel2_content')/div/span/span/span[1]")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.cssSelector("span.spinner-arrow-up.spinner-arrow-hover")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.id("tip")).clear();
		    driver.findElement(By.id("tip")).sendKeys("2.2.2.3");
		    driver.findElement(By.id("tport")).clear();
		    driver.findElement(By.id("tport")).sendKeys("655");
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("id('form_pm')/div/div[7]/span/span/span[1]")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("id('form_pm')/div/div[7]/span/span/span[2]")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.linkText("提交")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[10]/div[2]/div[4]/a/span/span")).click();
		    Thread.sleep(2000);
		    System.out.println("Step 3:Edit Rule Success\n");
		    
		    
		    
		    //Del Rule
		    driver.findElement(By.name("ck")).click();
		    driver.findElement(By.id("btn_del")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[10]/div[2]/div[4]/a[1]/span/span")).click();
		    Thread.sleep(2000);
		    driver.findElement(By.xpath("/html/body/div[10]/div[2]/div[4]/a/span/span")).click();
		    Thread.sleep(2000);
		    System.out.println("Step 4:Delete Rule Success\n");
		    
			//Log out 
		    driver.findElement(By.id("quit")).click();
		    driver.findElement(By.cssSelector("div.messager-button > a.l-btn")).click();
		    System.out.println("Step 5:Logout Success\n");
	  }
	  

}
