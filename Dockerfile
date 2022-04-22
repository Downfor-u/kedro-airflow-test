ARG BASE_IMAGE=apache/airflow:2.2.3-python3.7
FROM $BASE_IMAGE
USER root

ARG PREFIX_PATH=/home/airflow/.local/lib/python3.7/site-packages

RUN pip install --upgrade pip


User airflow


COPY ./new_kedro_project-0.1-py3-none-any.whl /opt/airflow/new_kedro_project-0.1-py3-none-any.whl
COPY ./conf /opt/airflow/conf
COPY ./airflow_dags /opt/airflow/dags
COPY ./airflow_logs /opt/airflow/logs

RUN pip install --user /opt/airflow/new_kedro_project-0.1-py3-none-any.whl