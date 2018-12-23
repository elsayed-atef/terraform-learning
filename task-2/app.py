import os
import psycopg2
from python_terraform import *
from flask import Flask

tf = Terraform(working_dir='/home/ubuntu')

os.environ['RDS_DB_NAME'] = tf.output('RDS_DB_NAME')
if 'RDS_DB_NAME' in os.environ:
    DATABASES = {
        'default': {
            'NAME': tf.output('RDS_DB_NAME'),
            'USER': tf.output('RDS_USERNAME'),
            'PASSWORD': tf.output('RDS_PASSWORD'),
            'HOST': tf.output('RDS_HOSTNAME'),
            'PORT': tf.output('RDS_PORT'),
        }
    }



def database():
     conn = psycopg2.connect(dbname=DATABASES["default"]["NAME"] , host=DATABASES["default"]["HOST"] , password=DATABASES["default"]["PASSWORD"], user=DATABASES["default"]["USER"] , port=DATABASES["default"]["PORT"] )
     cur = conn.cursor()
     cur.execute("SELECT num FROM visit  where ID = 1;")
     value = cur.fetchone()
     value = int(value[0])
     cur.execute("UPDATE visit set num = %s where ID = 1",[value +1])
     conn.commit()
     cur.close()
     conn.close()
     return value


app = Flask(__name__)
@app.route("/")
def main():
     value = database()
     return "Welcome Visitor  " + str (value)
if __name__ == "__main__":
    app.run(host='0.0.0.0')
