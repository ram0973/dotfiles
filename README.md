# linux-goodies
Linux files and scripts

# Powerline fonts setup
sudo apt-get install fonts-powerline

# Transcendence project
### AKA SSN (Sociological Social Network)

[![Build Status](https://travis-ci.org/ram0973/37_transcendence_1.svg?branch=master)](https://travis-ci.org/ram0973/37_transcendence_1)
[![Maintainability](https://api.codeclimate.com/v1/badges/85562fb4af688d096860/maintainability)](https://codeclimate.com/github/ram0973/37_transcendence_1/maintainability)
[![codecov](https://codecov.io/gh/ram0973/37_transcendence_1/branch/master/graph/badge.svg)](https://codecov.io/gh/ram0973/37_transcendence_1)

<details><summary>Project creation history (just remainder)</summary>

** Start project **

```bash
$ pip install django
$ django-admin startproject ssn
$ cd ssn
$ python manage.py runserver
```
Opened http://127.0.0.1/ - Django is running ok.

**Django-configurations integration**:
```bash
pip install django-configurations
pip install dj-database-url
```

Changed settings.py as here:
https://github.com/jazzband/django-configurations/blob/templates/1.8.x/project_name/settings.py

DB Paths remainder:
PostgreSQL postgres://USER:PASSWORD@HOST:PORT/NAME
SQLite sqlite:///PATH

Added DOTENV in Common config and ALLOWED_HOSTS in Prod config (to test Prod config):
```python
DOTENV = str(BASE_DIR / '.env')
ALLOWED_HOSTS = ['localhost', '127.0.0.1', '[::1]']
```
Then
```bash
export DJANGO_CONFIGURATION=Dev
export DJANGO_SETTINGS_MODULE=ssn.settings
```

**Database creation, migration, seed**

Near manage.py created .env with DJANGO_SECRET_KEY variable, then:
```bash
python manage.py migrate
python manage.py createsuperuser
```

**Static files setup**:

Added public directory with 'static' and 'media' folders inside, then
in urls.py:
```python
if os.getenv('DJANGO_CONFIGURATION') == 'Dev':
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
```
In settings.py:
```python
PUBLIC_DIR = BASE_DIR / 'public'
STATIC_ROOT = PUBLIC_DIR / 'static'
MEDIA_ROOT = PUBLIC_DIR / 'media'
```
Then ran the collectstatic management command:
```bash
$ python manage.py collectstatic
$ pip freeze >requirements.txt
```
**Sentry integration**
```bash
pip install raven --upgrade
```
Copied client key from: Sentry project - Data - Client Keys to .env file as
SENTRY_DSN=project_secret_sentry_dsn (DSN means Data Source Name)
then in settings.py:
```python
INSTALLED_APPS = (
    'raven.contrib.django.raven_compat',
)
...
RAVEN_CONFIG = {
    'dsn': values.Value(environ_name='SENTRY_DSN'),
    # Release based on the git info.
    'release': raven.fetch_git_sha(str(BASE_DIR)),
}
```
Then added raven middleware and logging to sentry.
https://docs.sentry.io/clients/python/integrations/django/

Then Sentry config tested:
```bash
python manage.py raven test
```
In the project on Sentry.io got a message:
This is a test message generated using ``raven test``

**Local tests coverage and CI**

Added local tests coverage support with settings in .coveragerc:
```bash
$ pip install coverage
# If you want to show the results in the command line, run:
$ coverage report
# For more readable reports:
$ coverage html
```
Added Continuous Integration with https://travis-ci.org:
1) Created repository (imported from GitHub)
2) Created .travis.yml, test database (postgresql) url stored in .env
3) On every git commit the application run tests on Travis

**Auth app and user info page**
```bash
python manage.py startapp auth
```
</details>
This is Sociological Social Network project, with options that will be implemented, step by step: 

registration, profiles, wall, private messages, API. And most important - a robot that will emulate user actions.

Step I. (Current):
1) Created project with development environment based on Vagrant.
1) Added user vinfo view ( /users/admin/ shows info about user "admin");
2) Registered with Sentry and configured the logging of errors in it.

# Install
In development, with Vagrant:
(Windows)
1) Install [Virtualbox](https://www.virtualbox.org/)
2) Install [Vagrant](https://www.vagrantup.com/)
(Linux apt-based)
```bash
sudo apt-get install virtualbox && sudo apt-get install vagrant
3) Enter following commands:
```bash
$ git clone https://github.com/ram0973/37_transcendence_1/
$ cd 37_transcendence_1
$ vagrant up
$ vagrant ssh
$ cd /opt/ssn
$ export DJANGO_CONFIGURATION=Dev
$ export DJANGO_SETTINGS_MODULE=ssn.settings
$ make initapp
```
# Run
In development, with Vagrant:
```bash
$ cd 37_transcendence_1
$ vagrant up
$ vagrant ssh
$ cd /opt/ssn
$ make runserver
```
Open http://localhost:8080/ in your favorite browser

# Tests
1) CI is done automatically by TravisCI, upon every git push
2) pytest: just run source venv/bin/activate && pytest

# Database inspection with pgadmin4:
Install [pgadmin4](https://www.pgadmin.org/)
Open http://localhost:2345/

User vagrant password vagrant

# Extra Info: Play with Postgresql
```bash
$ psql ssn
```
```psql
ssn=# \d # list table names
ssn=# select * from auth_user; # show users
```

# Project Goals

The code is written for educational purposes. Training course for
web-developers - [DEVMAN.org](https://devman.org)
