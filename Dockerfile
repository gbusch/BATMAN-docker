FROM jupyter/pyspark-notebook:d4cbf2f80a2a

RUN pip3 install -r requirements.txt

RUN if ! [ -e /home/$NB_USER/.jupyter/jupyter_notebook_config.py ]; then jupyter notebook --generate-config; fi

RUN echo 'c.NotebookApp.token = ""' >> /home/$NB_USER/.jupyter/jupyter_notebook_config.py
RUN mlflow ui
