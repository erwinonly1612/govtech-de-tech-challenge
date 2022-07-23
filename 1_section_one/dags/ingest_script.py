import pandas as pd
import logging
import numpy as np
import os

AIRFLOW_HOME = os.environ.get('AIRFLOW_HOME', '/opt/airflow')

def download_dataset(source_url, source_files):
    """downloads datasets from govtech data engineering assessment source_url.
    dataset names are in source_files.

    Args:
        source_url: the URL of the dataset.
        source_files: the dataset names.
    """
    logging.info(AIRFLOW_HOME)
    for dataset_file in source_files:
        dataset_file_url = f"{source_url}/{dataset_file}"
        csv_raw_file = f'{AIRFLOW_HOME}/{dataset_file}'
        logging.info(csv_raw_file)
        df = pd.read_csv(dataset_file_url)
        logging.info(df.head())
        df.to_csv(csv_raw_file, index=False)



def concat_dataset(csv_raw_files, csv_staging):
    """cleans and concatenate multiple datasets and output it into one csv file.

    Args:
        csv_raw_files: the source path of the csv datasets.
        csv_staging: the destination path of the concatenated csv file output.      
    """
    output_df = pd.DataFrame()
    for csv_raw in csv_raw_files:
        raw_df = pd.read_csv(csv_raw)
        output_df = pd.concat([raw_df,output_df])
    logging.info(output_df.head())
    logging.info(output_df.info())
    logging.info(csv_staging)

    # to remove records with blank name
    output_df = output_df[output_df['name'].notnull()]

    # to remove salutations from name
    salutations = ['Mr. ', 'Mrs. ', 'Dr. ', ' DDS', ' DVM', ' MD', ' PhD']
    for salutation in salutations:
        output_df['name'] = output_df['name'].str.replace(salutation, '')
    
    # split name into first_name and last_name with the first occurence of blank space as a delimiter
    output_df['first_name'] = output_df['name'].str.split(' ', 1).str[0]
    output_df['last_name'] = output_df['name'].str.split(' ', 1).str[1]

    # to convert price into float, so that prepended zero will be removed
    output_df['price'] = pd.to_numeric(output_df['price'])
    
    # to create a field 'above_100', which is true if the price is strictly greater than 100
    output_df['above_100'] = np.where(output_df['price']>100,True, False)
    logging.info(len(output_df))
    output_df.to_csv(csv_staging, index=False)

