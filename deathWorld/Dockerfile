FROM factoriotools/factorio
COPY config /config
ADD entrypoint.sh /death-world-entrypoint.sh
VOLUME /factorio

ENTRYPOINT ["/death-world-entrypoint.sh"]