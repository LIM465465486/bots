FROM python:3.4

ENV PYTHONUNBUFFERED 1

COPY ./etc /requirements

RUN pip install --upgrade pip
RUN pip install -r /requirements/requirements.txt

COPY . /bots
WORKDIR /bots

RUN pip install /bots
#RUN mkdir /usr/local/lib/python3.4/site-packages/bots/botssys
#RUN mkdir /usr/local/lib/python3.4/site-packages/bots/botssys/sqlitedb
#COPY ./src/bots/install/bots.ini /usr/local/lib/python3.4/site-packages/bots/config/
#COPY ./src/bots/install/settings.py /usr/local/lib/python3.4/site-packages/bots/config/
#COPY ./src/bots/install/botsdb /usr/local/lib/python3.4/site-packages/bots/botssys/sqlitedb/
RUN rm -Rf /usr/local/lib/python3.4/site-packages/bots/config
RUN rm -Rf /usr/local/lib/python3.4/site-packages/bots/usersys
RUN ln -s /bots/user_config/config /usr/local/lib/python3.4/site-packages/bots/config
RUN ln -s /bots/user_config/botssys /usr/local/lib/python3.4/site-packages/bots/botssys
RUN ln -s /bots/user_config/usersys /usr/local/lib/python3.4/site-packages/bots/usersys

ARG BOTS_ENV
RUN if [ "$BOTS_ENV" = "dev" ]; then \
    apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && echo 'root:pass' | chpasswd \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && mkdir /root/.ssh ; fi

#CMD if [ "$BOTS_ENV" = "dev" ]; then ["/usr/sbin/sshd"] ; fi
#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD [ "python", "-u", "/usr/local/bin/bots-webserver.py" ]
EXPOSE 8080
