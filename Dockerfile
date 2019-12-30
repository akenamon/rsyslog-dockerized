FROM ubuntu:16.04
MAINTAINER viniciustorino@protonmail.com
LABEL Description="Rsyslog Containerized As An Remote Server"
RUN apt update && apt install -y rsyslog                                                                                                 
RUN sed -i 's,#module(load="imudp"),module(load="imudp"),' /etc/rsyslog.conf                                                             
RUN sed -i 's,#input(type="imudp" port="514"),input(type="imudp" port="514"),' etc/rsyslog.conf                                          
RUN sed -i 's,#module(load="imtcp"),module(load="imtcp"),' /etc/rsyslog.conf                                                             
RUN sed -i 's,#input(type="imtcp" port="514"),input(type="imtcp" port="514"),' etc/rsyslog.conf                                          
VOLUME [/var/log]                                                                                                            
EXPOSE 514                                                                                                                   
ENTRYPOINT ["/usr/sbin/rsyslogd" "-nd"] 
