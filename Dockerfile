FROM java:8

ENV JIRA_VERSION 7.1.1

RUN \
  	apt-get update && \
  	apt-get install apt-transport-https &&\
  	echo "deb https://sdkrepo.atlassian.com/debian/ stable contrib" >>/etc/apt/sources.list && \
  	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B07804338C015B73 && \
  	apt-get update && \
  	apt-get install atlassian-plugin-sdk=6.2.4 && \
	apt-get clean

EXPOSE 2990

RUN atlas-run-standalone --product jira --version $JIRA_VERSION --bundled-plugins com.atlassian.jwt:jwt-plugin:1.1.0,com.atlassian.bundles:json-schema-validator-atlassian-bundle:1.0.4,com.atlassian.webhooks:atlassian-webhooks-plugin:1.0.6,com.atlassian.upm:atlassian-universal-plugin-manager-plugin:2.17.14-D20140902T224549,com.atlassian.plugins:atlassian-connect-plugin:1.1.4 --jvmargs -Datlassian.upm.on.demand=true

CMD atlas-run-standalone --product jira --version $JIRA_VERSION --bundled-plugins com.atlassian.jwt:jwt-plugin:1.1.0,com.atlassian.bundles:json-schema-validator-atlassian-bundle:1.0.4,com.atlassian.webhooks:atlassian-webhooks-plugin:1.0.6,com.atlassian.upm:atlassian-universal-plugin-manager-plugin:2.17.14-D20140902T224549,com.atlassian.plugins:atlassian-connect-plugin:1.1.4 --jvmargs -Datlassian.upm.on.demand=true
