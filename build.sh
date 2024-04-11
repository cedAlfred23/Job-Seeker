#!/usr/bin/env bash

#exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate

if [[ $CREATE_SUPERUSER ]];
then
  python xyzCompany/manage.py createsuperuser --no-input
fi