# sampling_data
Data Sampling Process

Command explanations in sampling.sh file

#!/bin/bash

#downloading weather_data.xls from source url and saving the file to 'data' folder

wget -P ./data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

#saving weather_2014 sheet inside the xlsx file to a separate csv file (weather_2014.csv) in the 'data' folder

in2csv ./data/weather_data.xlsx --sheet data/weather_data.xlsx --sheet "weather_2014" > data/weather_2014.csv

#saving sheet weather_2015 inside the xlsx file to a separate csv file (weather_2015.csv) in the 'data' folder

in2csv ./data/weather_data.xlsx --sheet data/weather_data.xlsx --sheet "weather_2015" > data/weather_2015.csv

#merge weather_2014.csv and weather_2015.csv to weather.csv and saving it to 'data' folder

csvstack data/weather_2014.csv data/weather_2015.csv > data/weather.csv

#delete the original xlsx file previously downloaded

rm data/weather_data.xlsx

#command for data sampling with rate of 0.3 and saving the result to sample_weather.csv file in the 'data' folder

cat data/weather.csv | sample -r 0.3  > data/sample_weather.csv
