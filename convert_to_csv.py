# Author: Ethan Ong
"""
The code written in this file was used to initially clean and parse
data from the Leiden Weibo Corpus Website.
"""

import csv

# The commented out code below converts the data from a txt file into a csv
""" Note: 
+ Too many rows to be opened in Excel
+ Commented out after initial file conversion
"""
# with open('parsed_messages.txt', 'r', encoding='utf-8') as in_file:
#     stripped = (line.strip() for line in in_file)
#     lines = (line.split(",") for line in stripped if line)
#     with open('parsed_messages.csv', 'w', encoding='utf-8') as out_file:
#         writer = csv.writer(out_file, lineterminator = '\n')
#         writer.writerows(lines)