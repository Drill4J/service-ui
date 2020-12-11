FROM mhart/alpine-node:14

LABEL maintainer="Andrei Varabyeu <andrei_varabyeu@epam.com>"
LABEL version=5.2.3

# Copy project to analyze with Drill4J JS utility
COPY /app /app

# Copy config for parsing utility
COPY /drill4js.config.json /drill4js.config.json

ENV APP_DOWNLOAD_URL https://dl.bintray.com/epam/reportportal/5.2.3

ADD ${APP_DOWNLOAD_URL}/service-ui_linux_amd64 /service-ui
ADD ${APP_DOWNLOAD_URL}/ui.tar.gz /

RUN mkdir /public
RUN chmod +x /service-ui
RUN tar -zxvf ui.tar.gz -C /public && rm -f ui.tar.gz

COPY /app/build /public
ENV RP_STATICS_PATH=/public

EXPOSE 8080

# Replace default JS agent host
CMD sed -i 's/jsagent:9404/'${JS_AGENT_HOST}'/g' /drill4js.config.json && \
# Run parsing utility
npx drill4js-cli@${JS_AST_PARSER_VERSION} -c /drill4js.config.json -b ${RP_UI_BUILD_VERSION}  && \
# Run Report Portal service UI
/service-ui
