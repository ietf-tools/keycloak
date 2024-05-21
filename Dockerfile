FROM quay.io/keycloak/keycloak:24.0.3 as builder
ENV KC_DB="postgres"
ENV KC_HEALTH_ENABLED="true"
ENV KC_METRICS_ENABLED="true"
ENV KC_HTTP_ENABLED="true"
ENV KC_PROXY_HEADERS="xforwarded"
RUN /opt/keycloak/bin/kc.sh build

FROM --platform=linux/amd64 quay.io/keycloak/keycloak:24.0.3
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
ENV KC_DB="postgres"
ENV KC_DB_SCHEMA="public"
ENV KC_HEALTH_ENABLED="true"
ENV KC_METRICS_ENABLED="true"
ENV KC_HTTP_ENABLED="true"
ENV KC_PROXY_HEADERS="xforwarded"

COPY . /opt/keycloak/

CMD ["start", "--optimized"]
