FROM jupyter/pyspark-notebook:d4cbf2f80a2a

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

RUN mkdir -p /mlflow && chown -R jovyan:users /mlflow/

RUN if ! [ -e /home/$NB_USER/.jupyter/jupyter_notebook_config.py ]; then jupyter notebook --generate-config; fi

RUN echo 'c.NotebookApp.token = ""' >> /home/$NB_USER/.jupyter/jupyter_notebook_config.py
