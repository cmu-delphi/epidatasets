#!/bin/bash
# Get the data

# Clean and set up output dirs
rm -f intermediate/hist.csv
rm -f intermediate/hist_msg.csv
rm -fr updates.nosync
mkdir -p updates.nosync
mkdir -p intermediate/

# Get repo (~1 GB) if doesn't already exist
[ -d "Covid19Canada" ] || git clone --branch master git@github.com:ccodwg/Covid19Canada.git

# Get list of commit SHAs, one per line, that modified the `cases_timeseries_prov.csv` file.
# Must be run from within the repo containing the file. This is zcaiElvis/Covid19Canada, a fork of ccodwg/Covid19Canada made on Mar 13, 2022. Setting the `until` arg lets us query the original repo.
cd Covid19Canada/
git log --all --until='Mar 13 2022' --oneline --follow --pretty=format:"%h" timeseries_prov/cases_timeseries_prov.csv >> ../intermediate/hist.csv
# Get associated commit messages
git log --all --until='Mar 13 2022' --oneline --follow --pretty=format:"%s" timeseries_prov/cases_timeseries_prov.csv >> ../intermediate/hist_msg.csv
cd ..

# Run R scripts (non-interactively)
R CMD BATCH modify_csv.R
#R CMD BATCH proc_dat.R
