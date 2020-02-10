# -*- coding: utf-8 -*-
"""Public section, including homepage and signup."""
from flask import Blueprint
from application.tasks import example

blueprint = Blueprint("public", __name__, static_folder="../static")


@blueprint.route("/", methods=["GET", "POST"])
def home():
    return "Hello world!"


@blueprint.route("/task")
def task_route():
    res = example.add.delay(25, 6578)

    return "Task started! {}".format(res)
