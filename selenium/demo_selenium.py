from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from pathlib import Path
from bs4 import BeautifulSoup


try:
    ## setup driver
    current_path = Path(__file__).resolve().parent
    path = str(current_path) + r'\chromedriver-win64\chromedriver.exe'
    service = Service(path)
    chrome_options = Options()
    chrome_options.add_argument('--headless')
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    ## get html parser
    url = 'https://goal3.co/'
    driver.get(url)
    print(driver.title)
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')
    
    # pretty_print = soup.prettify()
    # print(soup)
    # print(pretty_print)
    
except Exception as e:
    print("Error: ", e)