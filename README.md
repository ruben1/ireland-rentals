## Project

This project makes use of Irish property and rental data to gather insights. The problem it tries to solve is showing insights about Ireland's housing market, particularly with the aim of giving a data-driven view on the current state and ongoing progress of new construction and rentals.

## Setup

### Architecture

The project is composed of a data warehouse, Redshift, that ingests raw data. DBT is used to compute the different staging and core tables. Metabase is deployed to query the data warehouse and expose a public dashboard. All cloud resources are provisioned with Terraform.

### DW schema and ingestion

Schema creation and raw data ingestion are done manually with the SQL included here. This is pending automating via workflow orchestration. Raw data comes from a private data lake not included in this project due to ownership rights, but that was built and gathered specifically for this project.

### TODOs

Some TODOs I'd like to add 
- Showing data based on maps
- More elaborated reports
- Proper VPC setup

## Public dashboard

The dashboard currently only showcases aggregated information of properties and rental tenancies per county

https://hh3a3suy2w.eu-west-1.awsapprunner.com/public/dashboard/e09c7e6b-3d23-4bc7-80f3-0dc97bbd2706

## Development

- The project first requires provisioning resources via Terraform
- Then running schema creation and raw data ingestion
- Then running DBT for staging and core tables
- Then configuring Metabase to read from the data warehouse and adding dashboards