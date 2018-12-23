import os
from python_terraform import *
tf = Terraform(working_dir='/home/ubuntu')

os.environ['RDS_DB_NAME'] = tf.output('RDS_DB_NAME')
if 'RDS_DB_NAME' in os.environ:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': tf.output('RDS_DB_NAME'),
            'USER': tf.output('RDS_USERNAME'),
            'PASSWORD': tf.output('RDS_PASSWORD'),
            'HOST': tf.output('RDS_HOSTNAME'),
            'PORT': tf.output('RDS_PORT'),
        }
    }
print(DATABASES)
