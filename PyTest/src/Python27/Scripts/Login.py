from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re

driver = webdriver.Firefox()
driver.implicitly_wait(30)
base_url = "https://192.168.13.13:8443/"
driver.get(base_url)
driver.find_element_by_id("username").clear()
driver.find_element_by_id("username").send_keys("admin")
driver.find_element_by_id("password").clear()
driver.find_element_by_id("password").send_keys("admin")
driver.find_element_by_id("submit").click()
driver.find_element_by_id("quit").click()
driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()
print 'pass'

