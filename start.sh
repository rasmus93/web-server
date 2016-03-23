mkdir -p home/box/web
mkdir -p home/box/web/public
mkdir -p home/box/web/public/img
mkdir -p home/box/web/public/css
mkdir -p home/box/web/public/js
mkdir -p home/box/web/uploads
mkdir -p home/box/web/etc

cp nginx.conf home/box/web/etc
cp init.sh home/box/web/etc
cp hello.py home/box/web

cat > /home/box/web/etc/hello <<EOC
CONFIG = {
    'working_dir': '/home/box/web',
    'args': (
        '--bind=0.0.0.0:8080',
        '--workers=3',
        '--timeout=60',
        'hello:application',
    ),
}
EOC
sudo unlink /etc/gunicorn.d/hello
sudo ln -s /home/box/web/etc/hello /etc/gunicorn.d/hello

sudo bash /home/box/web/etc/init.sh
sudo /etc/init.d/gunicorn restart
