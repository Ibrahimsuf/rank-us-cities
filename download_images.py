import wikipediaapi
import requests
from bs4 import BeautifulSoup
import os

# Function to download an image from a URL
def download_image(url, file_name):
    response = requests.get(url)
    if response.status_code == 200:
        with open(file_name, 'wb') as file:
            file.write(response.content)

# Initialize Wikipedia API
wiki = wikipediaapi.Wikipedia('en')

# List of the largest 50 metropolitan areas in the US
metropolitan_areas = [
    "New York City metropolitan area",
    "Los Angeles metropolitan area",
    "Chicago metropolitan area",
    "Dallas–Fort Worth metroplex",
    "Houston metropolitan area",
    "Washington metropolitan area",
    "Miami metropolitan area",
    "Philadelphia metropolitan area",
    "Atlanta metropolitan area",
    "Boston metropolitan area",
    "San Francisco Bay Area",
    "Phoenix metropolitan area",
    "Riverside–San Bernardino–Ontario metropolitan area",
    "Detroit metropolitan area",
    "Seattle metropolitan area",
    "Minneapolis–Saint Paul metropolitan area",
    "San Diego metropolitan area",
    "Tampa Bay Area",
    "Denver metropolitan area",
    "St. Louis metropolitan area",
    "Baltimore metropolitan area",
    "Charlotte metropolitan area",
    "Orlando metropolitan area",
    "San Antonio metropolitan area",
    "Portland metropolitan area",
    "Pittsburgh metropolitan area",
    "Sacramento metropolitan area",
    "Las Vegas metropolitan area",
    "Austin metropolitan area",
    "Cincinnati metropolitan area",
    "Kansas City metropolitan area",
    "Columbus metropolitan area",
    "Indianapolis metropolitan area",
    "Cleveland metropolitan area",
    "San Jose metropolitan area",
    "Nashville metropolitan area",
    "Virginia Beach–Norfolk–Newport News metropolitan area",
    "Providence metropolitan area",
    "Milwaukee metropolitan area",
    "Jacksonville metropolitan area",
    "Oklahoma City metropolitan area",
    "Memphis metropolitan area",
    "Louisville metropolitan area",
    "Richmond metropolitan area",
    "New Orleans metropolitan area",
    "Hartford metropolitan area",
    "Salt Lake City metropolitan area",
    "Birmingham metropolitan area",
    "Buffalo metropolitan area",
    "Raleigh metropolitan area"
]

# Create a directory to save images
os.makedirs('city_images', exist_ok=True)

# Iterate over each metropolitan area
for metro_area in metropolitan_areas:
    # Get the Wikipedia page
    page = wiki.page(metro_area)
    
    # If the page exists
    if page.exists():
        # Parse the page content using BeautifulSoup
        soup = BeautifulSoup(page.text, 'html.parser')
        
        # Extract the first image URL (main city image)
        img_tag = soup.find('img')
        if img_tag and img_tag.get('src'):
            img_url = 'https:' + img_tag['src']
            city_name = metro_area.split(" metropolitan area")[0]
            file_name = os.path.join('city_images', f"{city_name}.jpg")
            
            # Download the image
            download_image(img_url, file_name)
            print(f"Downloaded image for {city_name}")

    else:
        print(f"Wikipedia page does not exist for {metro_area}")

print("Image download process completed.")
