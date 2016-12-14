  ## Elastic Search

  RUN apt-get update &&              \
      apt-get install -y             \
        apt-utils                    \
        elasticsearch                \
        elasticsearch

  EXPOSE 9200
  EXPOSE 9300
  EXPOSE 5601
