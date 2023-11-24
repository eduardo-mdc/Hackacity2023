import json
import csv

# Specify the file containing the list of JSON file names
file_list_file = "files.txt"

# Read the list of JSON file names from the file
with open(file_list_file, 'r') as list_file:
    # Strip newline characters and create a list of file names
    json_files = [line.strip() for line in list_file]

# Initialize an empty list to store all JSON data
all_data = []

# Process each JSON file
for json_file in json_files:
    with open(json_file, 'r') as file:
        # Load JSON data
        data = json.load(file)
        # Extend the list with data from the current file
        all_data.extend(data)

# Define CSV file name
csv_file = "output.csv"

# Open CSV file for writing
with open(csv_file, 'w', newline='') as file:
    # Create a CSV writer
    writer = csv.writer(file)

    # Write the header
    writer.writerow(all_data[0].keys())

    # Write the data
    for entry in all_data:
        # Extract values for each key
        row = [field['value'] if 'value' in field else '' for field in entry.values()]
        writer.writerow(row)

print(f"CSV file '{csv_file}' created successfully.")
