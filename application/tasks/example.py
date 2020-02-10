# -*- coding: utf-8 -*-
from application.extensions import celery


@celery.task
def add(x, y):
    return x + y
