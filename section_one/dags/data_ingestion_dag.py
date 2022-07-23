from airflow import DAG
from airflow.operators.python import PythonOperator
import os
from datetime import datetime
from ingest_script import download_dataset, concat_dataset #to import functions for ingesting datasets

dataset_files = ['dataset1.csv','dataset2.csv']
dataset_url = f"https://raw.githubusercontent.com/ameeraadam/Data-Engineer-Tech-Challenge/main"

default_args = {
    "owner": "airflow"
}

AIRFLOW_HOME = os.environ.get('AIRFLOW_HOME', '/opt/airflow') #to define the home path of airflow in docker container

with DAG(
    dag_id = f'data_ingestion_dag',
    default_args = default_args,
    description = f'data pipeline for GovTech DE tech assessment',
    schedule_interval="0 1 * * *", #to schedule for a daily 1AM run
    start_date=datetime(2022,7,22),
    catchup=False,
    tags=['data_ingestion_dag']
) as dag:
    csv_staging_file = f'{AIRFLOW_HOME}/dataset_staging.csv'

    download_dataset_task = PythonOperator(
        task_id=f"download_dataset_task",
        python_callable=download_dataset,
        op_kwargs = {
            'source_files' : dataset_files,
            'source_url' : dataset_url
        }
    )

    concat_dataset_task = PythonOperator(
        task_id=f"concat_dataset_task",
        python_callable=concat_dataset,
        op_kwargs = {
            'csv_raw_files' : dataset_files,
            'csv_staging' : csv_staging_file
        }
    )

    download_dataset_task >> concat_dataset_task