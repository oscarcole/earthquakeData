# earthquakeData
Exploring a dataset on earthquake data from 1995 - 2023

## What was done to clean the data?

- Corrected all misspellings under the location column
- Removed 'title' column from dataset, redundant data
- Adjusted datetime to a date format

## Understanding the columns

- magnitude: Magnitude of the earthquake. 
- date_time: Date and time when the earthquake occurred.
- cdi: Community Internet Intensity Map,  provides a measure of how strongly people felt an earthquake at various locations. This data is subjective and based on human perception. 
- mmi: Modified Mercalli Intensity Scale (often abbreviated as "MMI") is another way to measure the intensity of shaking during an earthquake. The MMI scale goes from I (not felt) to XII (total destruction). It provides a standardized way to describe the intensity of shaking in different areas based on observed effects on structures and the environment. 
- alert: Typically refers to an early warning system or alert regarding potential hazards, especially for earthquakes. 
- tsunami: Indicates whether the earthquake has the potential to generate a tsunami. 1 means possibility of tsunami being generated, 0 indicates no significant tsunami. 
- sig: Provides a measure of the earthquake's significance based on its size and other factors. A higher "sig" value typically indicates a more significant earthquake in terms of its potential impact. 
- net: Seismic network or the agency that reported the earthquake. 
- nst: Number of seismic stations contributing to the magnitude determination. 
- dmin: Minimum distance to the nearest station recording the earthquake. 
- gap: Gap, in degrees, between azimuthally adjacent seismic stations. 
- magType: Type of magnitude calculation method used (e.g., mb, Mw).
- depth: Depth of the earthquake hypocenter below the Earth's surface. 
- latitude: Geographic latitude of the earthquake epicenter.
- longitude: Geographic longitude of the earthquake epicenter. 
- location: Specific area in which the earthquake occurred. 
- continent: Continent in which the earthquake occurred. 
- country: Country in which the earthquake occurred. 


### Questions to query the dataset:

- What is the average, maximum, and minimum magnitude of earthquakes in the dataset? 
- How many earthquakes of magnitude greater than 8 occurred in the dataset? 
- How many earthquakes of magnitude 7 or higher occurred in each country? 
- How many earthquakes of magnitude 6 or higher occurred in each country? 
- How many earthquakes occurred each year in the dataset? 
- Which month saw the highest number of earthquakes?
- Are there any noticeable trends or patterns in earthquake occurrences over the years? 
- How many earthquakes were reported with a CDI (Did You Feel It?) intensity above a certain threshold (e.g., CDI > 5)? 
- How many earthquakes with an alert were reported, and how many of them led to tsunamis? 
- How many earthquakes occurred in each alert zone that had tsunamis? 
- Which countries or continents experienced the highest number of earthquakes? 
- What are the coordinates (latitude and longitude) of the earthquake with the highest magnitude? 
- Are there any patterns in earthquake depths across different continents or countries? 
- Which seismic network (net) reported the most earthquakes in the dataset? 
- How many earthquakes were reported by each seismic network? 
- Is there a correlation between the number of earthquakes reported by a network and the magnitude of those earthquakes? 
- How many earthquakes had a significant value (sig) above a certain threshold? 
- What is the amount of seismic stations that reported an earthquake that was at or above orange alert status?
- What is the amount of earthquakes that happen in every 100' depth? 



data found here: https://www.kaggle.com/datasets/warcoder/earthquake-dataset/code
