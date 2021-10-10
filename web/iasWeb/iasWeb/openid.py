# Classes/Methods to override default OIDC Views (Keycloak authentication)
from mozilla_django_oidc.views import OIDCLogoutView
from django.conf import settings
import logging

# Get an instance of a logger
logger = logging.getLogger(__name__)

def keycloak_logout(request):
    """ Ths method is used to retrieve logout endpoint to also end the
        keycloak session as well as the Django session.
    """
    logout_endpoint = "http://localhost:8080/auth/realms/ias/protocol/openid-connect/logout?redirect_uri=https%3A%2F%2Flocalhost"
    logger.warning(logout_endpoint)
    logger.warning(logout_endpoint)
    logger.warning(logout_endpoint)
    return logout_endpoint

class LogoutView(OIDCLogoutView):
    """ Extend standard logout view to include get method (called from URL)
    """
    def get(self, request):
        return self.post(request)