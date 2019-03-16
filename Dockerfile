FROM jupyter/pyspark-notebook:6fb3eca57bd3

RUN conda install --quiet --yes \
    'tensorflow=1.12*' \
    'keras=2.2*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN python3 -c "import tensorflow"
RUN if ! [ -e /home/$NB_USER/.jupyter/jupyter_notebook_config.py ]; then jupyter notebook --generate-config; fi

RUN echo 'c.NotebookApp.token = ""' >> /home/$NB_USER/.jupyter/jupyter_notebook_config.py
