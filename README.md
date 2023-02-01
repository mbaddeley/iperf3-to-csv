# iperf3-to-csv
Simple script that creates .csv from iperf3 textual (not JSON) output

## Usage

The script can be used to pipe in output from the iperf3 client. It takes 4 params. The first three ($1 $2 $3) are the values for the first three columns (in this case we use "distance", "velocity" and "movement" but you can replace with whatever you want). $4 is the name of the output file.

Example:

`iperf3 -c localhost -t 5 | bash iperf3_to_csv.sh 200 20 random output_200_20_random.csv`
