"""
Django settings for iasWeb project.

Generated by 'django-admin startproject' using Django 3.2.7.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.2/ref/settings/
"""

from pathlib import Path
import os
# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["django", "django"]

MEDIA_ROOT = 'files'

OIDC_RP_SIGN_ALGO = "RS256"
OIDC_RP_IDP_SIGN_KEY = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjj41ze7U8uotytWf8gYpjEvlW0yZ1XHQNUVTTJ1l+WTy1K5aiFR2rLihH2fziEIcFufBketcLIiofz0+mFbgmwDSTpyd1eQNCA/hKYFNXUOF+4fSP1y1eAh10vJQH8oj75bvwsVxMvuAFYCGXG5nvFlX3rHEEmknlTV9QnXVli5eTvWRDsclZk3qcM6UKzq8pAcVDVnU2io1IyV6h65wIaIi6hP5Xruj20YfPqrKa21bHKfx9n7asR7cQ8qUtoJDqS7nDKFe1/a8nDUst8AHxaFMNEIiJKM2INHHp06al4qojWFTANn8Yx0Ql6rxkAPYZ3fC7lfkyYfBzc3q28Yt/QIDAQAB
-----END PUBLIC KEY-----"""
OIDC_OP_JWKS_ENDPOINT = "https://keycloak/auth/realms/ias/protocol/openid-connect/certs"

OIDC_RP_CLIENT_ID = "django"
OIDC_RP_CLIENT_SECRET = os.environ.get('OIDC_CLIENT_SECRET')
OIDC_VERIFY_SSL = False

OIDC_OP_AUTHORIZATION_ENDPOINT = "https://keycloak/auth/realms/ias/protocol/openid-connect/auth"
OIDC_OP_TOKEN_ENDPOINT = "https://keycloak/auth/realms/ias/protocol/openid-connect/token"
OIDC_OP_USER_ENDPOINT = "https://keycloak/auth/realms/ias/protocol/openid-connect/userinfo"

OIDC_OP_LOGOUT_URL_METHOD = "iasWeb.views.openid.keycloak_logout"
OIDC_OP_LOGOUT_ENDPOINT = "https://keycloak/auth/realms/ias/protocol/openid-connect/logout"
LOGIN_REDIRECT_URL = "https://django"
LOGOUT_REDIRECT_URL = "https://django"
LOGIN_URL = 'https://django/oidc/authenticate'
# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'mozilla_django_oidc',  # Load after auth
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'backend.apps.BackendConfig',
    'frontend.apps.FrontendConfig',
]

AUTHENTICATION_BACKENDS = (
    'iasWeb.auth.KeycloakOIDCAuthenticationBackend',
)

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'mozilla_django_oidc.middleware.SessionRefresh',
]

ROOT_URLCONF = 'iasWeb.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'iasWeb.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_DB'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': os.environ.get('POSTGRES_HOST'),
        'PORT': os.environ.get('POSTGRES_PORT')
    }
}


# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'