FROM continuumio/anaconda3

RUN apt-get update && apt-get install -y \
	libsm6 libxext6 libxrender-dev nginx supervisor

RUN conda install -c conda-forge uwsgi
RUN conda install -c conda-forge libiconv
    
RUN useradd --no-create-home nginx

EXPOSE 5000 8888

RUN mkdir /model
RUN mkdir /model/log
	
COPY app_model.py /model
COPY model.pkl /model
COPY start.sh /model

COPY nginx.conf /etc/nginx/
COPY flask-site-nginx.conf /etc/nginx/conf.d/
COPY uwsgi.ini /etc/uwsgi/
COPY supervisord.conf /etc/

CMD ["/model/start.sh"]