FROM jupyter/tensorflow-notebook:c39518a3252f

RUN python3 -c "import tensorflow"
RUN if ! [ -e /home/$NB_USER/.jupyter/jupyter_notebook_config.py ]; then jupyter notebook --generate-config; fi

RUN echo 'c.NotebookApp.token = ""' >> /home/$NB_USER/.jupyter/jupyter_notebook_config.py
