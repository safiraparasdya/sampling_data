#!/bin/bash

wget -P ./data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx
in2csv ./data/weather_data.xlsx --sheet data/weather_data.xlsx --sheet "weather_2014" > data/weather_2014.csv
in2csv ./data/weather_data.xlsx --sheet data/weather_data.xlsx --sheet "weather_2015" > data/weather_2015.csv
csvstack data/weather_2014.csv data/weather_2015.csv > data/weather.csv
rm data/weather_data.xlsx
cat data/weather.csv | sample -r 0.3  > data/sample_weather.csv

