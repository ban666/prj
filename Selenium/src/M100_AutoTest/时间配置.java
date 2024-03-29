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
public class 时间配置 {

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
			Thread.sleep(1000);

		    driver.findElement(By.linkText("时间组")).click();
		    Thread.sleep(1000);
		    
		  //Add TimeGroup Rule 
		    driver.findElement(By.id("btn_add")).click();
		    Thread.sleep(2000);
		    
		    driver.findElement(By.id("timename")).clear();
		    driver.findElement(By.id("timename")).sendKeys("Autotest1");
		    driver.findElement(By.id("timedesc")).clear();
		    driver.findElement(By.id("timedesc")).sendKeys("Autotest1");
		    driver.findElement(By.xpath("(//input[@name='week'])[2]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[3]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[4]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[5]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[6]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[2]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[3]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[4]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[5]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[6]")).click();
		    driver.findElement(By.id("from1")).clear();
		    driver.findElement(By.id("from1")).sendKeys("08:59:59");
		    driver.findElement(By.id("to1")).clear();
		    driver.findElement(By.id("to1")).sendKeys("11:59:59");
		    driver.findElement(By.id("from2")).clear();
		    driver.findElement(By.id("from2")).sendKeys("13:59:59");
		    driver.findElement(By.id("to2")).clear();
		    driver.findElement(By.id("to2")).sendKeys("17:59:59");
		    driver.findElement(By.linkText("提交")).click();
		    Thread.sleep(5000);
		    
		    driver.findElement(By.xpath("/html/body/div[8]/div[2]/div[4]/a/span")).click();
		    Thread.sleep(5000);
		    
		    System.out.println("Step 2:TimeGroup Add Success\n");
		    
		  //Edit TimGroup Rule
		    driver.findElement(By.cssSelector("#datagrid-row-r4-2-1 > td > div.datagrid-cell.datagrid-cell-c4-timename")).click();
		    driver.findElement(By.id("btn_edit")).click();
		    Thread.sleep(2000);
		    
		    driver.findElement(By.id("timename")).clear();
		    driver.findElement(By.id("timename")).sendKeys("Autotest2");
		    driver.findElement(By.id("timedesc")).clear();
		    driver.findElement(By.id("timedesc")).sendKeys("Autotest2");
		    driver.findElement(By.xpath("(//input[@name='week'])[2]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[3]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[4]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[5]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[6]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[2]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[3]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[4]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[5]")).click();
		    driver.findElement(By.xpath("(//input[@name='week'])[6]")).click();
		    driver.findElement(By.id("from1")).clear();
		    driver.findElement(By.id("from1")).sendKeys("09:00:00");
		    driver.findElement(By.id("to1")).clear();
		    driver.findElement(By.id("to1")).sendKeys("12:00:00");
		    driver.findElement(By.id("from2")).clear();
		    driver.findElement(By.id("from2")).sendKeys("14:00:00");
		    driver.findElement(By.id("to2")).clear();
		    driver.findElement(By.id("to2")).sendKeys("18:00:00");
		    driver.findElement(By.linkText("提交")).click();
		    Thread.sleep(5000);
		    
		    driver.findElement(By.xpath("/html/body/div[8]/div[2]/div[4]/a/span")).click();
		    Thread.sleep(5000);
		    
		    System.out.println("Step 3:TimeGroup Edit Success\n");
		    
		    //Del Config
		    driver.findElement(By.cssSelector("#datagrid-row-r4-2-1 > td > div.datagrid-cell.datagrid-cell-c4-timename")).click();
		    driver.findElement(By.id("btn_del")).click();
		    Thread.sleep(5000);
		    
		    driver.findElement(By.className("l-btn-left")).click();
		    Thread.sleep(6000);
		    
		    System.out.println("Step 4:TimeGroup Delete Success\n");
		     
			//Log out 
		    driver.findElement(By.id("quit")).click();
		    driver.findElement(By.cssSelector("div.messager-button > a.l-btn")).click();
		    System.out.println("Step 5:Logout Success\n");
	  }
	  

}
