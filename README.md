# linux-goodies
Linux files and scripts

# Powerline fonts setup
sudo apt-get install fonts-powerline

# Transcendence project
### AKA SSN (Sociological Social Network)

[![Build Status](https://travis-ci.org/ram0973/37_transcendence_1.svg?branch=master)](https://travis-ci.org/ram0973/37_transcendence_1)
[![Maintainability](https://api.codeclimate.com/v1/badges/85562fb4af688d096860/maintainability)](https://codeclimate.com/github/ram0973/37_transcendence_1/maintainability)
[![codecov](https://codecov.io/gh/ram0973/37_transcendence_1/branch/master/graph/badge.svg)](https://codecov.io/gh/ram0973/37_transcendence_1)

<details><summary>Project creation steps</summary>

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

**Auth app and user info page with TDD**
```bash
python manage.py startapp auth
```

vagrant up

$ sudo apt-get update
$ sudo apt-get dist-upgrade
$ sudo reboot



https://docs.docker.com/install/linux/docker-ce/debian/#upgrade-docker-ce

https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user

sudo systemctl enable docker

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo curl -L https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

docker-compose exec web /bin/sh -c "python manage.py collectstatic --noinput"
docker-compose exec web /bin/sh -c "python manage.py migrate --noinput"
docker-compose exec web /bin/sh -c "python createsuperuser --username admin --email admin@test.com --noinput"

Made tests module in auth,

vagrant plugin install vagrant-docker-compose

# vagrant plugin install vagrant-vbguest
</details>

vagrant@ubuntu1804:~$ netstat -nlt
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:5432          0.0.0.0:*               LISTEN
tcp6       0      0 :::80                   :::*                    LISTEN
tcp6       0      0 :::22                   :::*                    LISTEN
vagrant@ubuntu1804:~$
https://blog.bigbinary.com/2016/01/23/configure-postgresql-to-allow-remote-connection.html
sudo nano /etc/postgresql/10/main/postgresql.conf
listen_addresses = 'localhost' with listen_addresses = '*'

host    all             all             127.0.0.1/32            md5

sed -i "/^#listen_addresses = 'localhost'/i listen_addresses = '*'" /etc/postgresql/10/main/postgresql.conf
sudo bash -c 'echo "host    all             all             192.168.8.8        md5" >> /etc/postgresql/10/main/pg_hba.conf'
sudo systemctl restart postgresql

pip3 install https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v3.1/pip/pgadmin4-3.1-py2.py3-none-any.whl

# Project Goals

The code is written for educational purposes. Training course for
web-developers - [DEVMAN.org](https://devman.org)

sudo docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres:10.4 --name pgsql10.4
deb http://ftp.debian.org/debian stretch-backports main
sudo apt-get -t stretch-backports install python3

TODO: rewrite user de


RUN python manage.py runserver 0.0.0.0:8000
pgadmin4: 127.0.0.1 - 2345 - vagrant - vagrant

Info: psql ssn
\d - list table names
select * from auth_user; - show users
