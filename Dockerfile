FROM centos
WORKDIR /root
COPY k_server k_server
COPY conf.toml conf.toml
copy shell.sh shell.sh
EXPOSE 7777
ENTRYPOINT ["./shell.sh"]