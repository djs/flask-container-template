from application.app import init_celery

app = init_celery()
app.conf.imports += ("application.tasks.example",)
