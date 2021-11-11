# Classes/Methods to override default OIDC Views (Keycloak authentication)
from mozilla_django_oidc.views import OIDCLogoutView
from django.conf import settings
from django.http.response import Http404, HttpResponseRedirect
from django.contrib.auth import logout


def keycloak_logout(request):
    """ Ths method is used to retrieve logout endpoint to also end the
        keycloak session as well as the Django session.
    """
    logout(request)
    logout_endpoint = settings.OIDC_OP_LOGOUT_ENDPOINT + "?redirect_uri=" + \
                      request.build_absolute_uri(settings.LOGOUT_REDIRECT_URL)
    return HttpResponseRedirect(logout_endpoint)


class LogoutView(OIDCLogoutView):
    """ Extend standard logout view to include get method (called from URL)
    """

    def get(self, request):
        return self.post(request)
