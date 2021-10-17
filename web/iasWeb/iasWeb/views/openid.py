# Classes/Methods to override default OIDC Views (Keycloak authentication)
from mozilla_django_oidc.views import OIDCLogoutView
from django.conf import settings
from django.http.response import Http404, HttpResponseRedirect
import logging

# Get an instance of a logger
logger = logging.getLogger(__name__)


def keycloak_logout(request):
    """ Ths method is used to retrieve logout endpoint to also end the
        keycloak session as well as the Django session.
    """
    logout_endpoint = settings.OIDC_OP_LOGOUT_ENDPOINT + "?redirect_uri=" + \
                      request.build_absolute_uri(settings.LOGOUT_REDIRECT_URL)
    logger.warning(logout_endpoint)
    return HttpResponseRedirect(logout_endpoint)


class LogoutView(OIDCLogoutView):
    """ Extend standard logout view to include get method (called from URL)
    """

    def get(self, request):
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        logger.warning("h")
        return self.post(request)
