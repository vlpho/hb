ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com"

LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"

RUN useradd user1
USER user1
# ici je ne suis plus root

#COPY heartbeat.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh ; \
#   echo coucou >test.txt
COPY --chown=user1:user1 heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ;

ARG hbs=3
ENV HEARTBEATSTEP $hbs

# information de port réseau utile
EXPOSE 1234/udp 4321/tcp

#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["coucou"]
# autre version sans ENTRYPOINT
CMD ["/entrypoint.sh","coucou"]

