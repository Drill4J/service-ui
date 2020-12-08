FROM mhart/alpine-node:14

LABEL maintainer="Andrei Varabyeu <andrei_varabyeu@epam.com>"
LABEL version=5.3.1

# Copy project to analyze with Drill4J JS utility
COPY /app /app

# Copy config for parsing utility
COPY /drill4js.config.json /drill4js.config.json

# Setup Report Portal service UI
ENV APP_DOWNLOAD_URL https://dl.bintray.com/epam/reportportal/5.3.1
ADD ${APP_DOWNLOAD_URL}/service-ui_linux_amd64 /service-ui

RUN mkdir /public
RUN chmod +x /service-ui

COPY /app/build /public
ENV RP_STATICS_PATH=/public

EXPOSE 8080

# Replace default JS agent host
CMD sed -i 's/jsagent:9404/'${JS_AGENT_HOST}'/g' /drill4js.config.json && \
# Run parsing utility
npx drill4js-cli@0.3.12 -c /drill4js.config.json -b ${RP_UI_BUILD_VERSION}  && \
# Run Report Portal service UI
/service-ui
