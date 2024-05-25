docker run --rm -it --name keycloak -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -v ./themes/ietf:/opt/keycloak/themes/ietf \
  quay.io/keycloak/keycloak:24.0.3 start-dev --spi-theme-static-max-age=-1 --spi-theme-cache-themes=false --spi-theme-cache-templates=false