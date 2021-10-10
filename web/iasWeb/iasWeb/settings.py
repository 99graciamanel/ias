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
SECRET_KEY = 'django-insecure-a+(vy!(c(bo3m0ll9og4^f+0u84+$nx&^r9-j5na(7751)r_6&'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

MEDIA_ROOT = 'files'

OIDC_RP_SIGN_ALGO = "RS256"
OIDC_RP_IDP_SIGN_KEY = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoptT3QonwbDUxzj+/pAk7JGBPq55cgOelTsZ82aUrWxJbIPhCW6vqCfXFkahpDd2PYQbmz6CJwtRJjzBoTWW7tjukgYVur3zIHRyKm/GUaE9/zRPqTCLY4IOyFWgfxkeNt8JtREHTB9D2BvrNxUEatTxleskgK8w/HT85lO2nbSgN7fFvABpdXBDMBInWnMlzfyOMuODslXKa1K87coJDgWFil7CAmrlGSbTfma8CZL2GimDqUcWi4RjGbahZJ7Bb/xXgj2T2hw0KzI6afJXYGvVUrG+m8RYrZKAWZQz3XjwzPmqH/x6INdEzEf0U9CYzAQF9PVfcZaT4++q7gB3hQIDAQAB
-----END PUBLIC KEY-----"""
OIDC_OP_JWKS_ENDPOINT = "http://keycloak:8080/auth/realms/ias/protocol/openid-connect/certs"

OIDC_RP_CLIENT_ID = "django"
OIDC_RP_CLIENT_SECRET = "1e236955-34a7-41d6-af06-af155d5fe251"

OIDC_OP_AUTHORIZATION_ENDPOINT = "http://keycloak:8080/auth/realms/ias/protocol/openid-connect/auth"
OIDC_OP_TOKEN_ENDPOINT = "http://keycloak:8080/auth/realms/ias/protocol/openid-connect/token"
OIDC_OP_USER_ENDPOINT = "http://keycloak:8080/auth/realms/ias/protocol/openid-connect/userinfo"

OIDC_OP_LOGOUT_URL_METHOD = "openid.keycloak_logout"
OIDC_OP_LOGOUT_ENDPOINT = "http://localhost:8080/auth/realms/ias/protocol/openid-connect/logout"
LOGIN_REDIRECT_URL = "https://localhost"
LOGOUT_REDIRECT_URL = "https://localhost"

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
