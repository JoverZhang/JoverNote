#!/bin/bash
NAME='itsc' #应用的名称
DJANGODIR=/itsc #django项目的目录
SOCKFILE=/itsc/gunicorn.sock #使用这个sock来通信
USER=root #运行此应用的用户
NUM_WORKERS=2 #gunicorn使用的工作进程数
DJANGO_SETTINGS_MODULE=itsc.settings #django的配置文件
DJANGO_WSGI_MODULE=itsc.wsgi #wsgi模块
LOG_DIR=/itsc/logs #日志目录

echo "starting $NAME as `whoami`"

#激活python虚拟运行环境
cd $DJANGODIR
source itsc_env/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

#如果gunicorn.sock所在目录不存在则创建
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

#启动Django

exec itsc_env/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
    --name $NAME \
    --workers $NUM_WORKERS \
    --user=$USER --group=$GROUPS \
    --log-level=debug \
    --bind=unix:$SOCKFILE \
    --access-logfile=$LOG_DIR/gunicorn_access.log
