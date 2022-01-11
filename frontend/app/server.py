from flask import Flask, render_template, send_from_directory
import os


# BACKEND_URI = http://ipaddr:port/
ENV_BACKEND_URI = os.environ.get("ENV_BACKEND_URI")
POD_NAME = os.environ.get("POD_NAME")

app = Flask(__name__)


@app.route("/", methods=['GET'])
def get_data():
    """ Render main page and static content """

    return render_template("base.html", mytitle="NHL Stats", backend_uri=ENV_BACKEND_URI, pod_name=POD_NAME)


def main():
    app.run(host='0.0.0.0', port=80)


if __name__ == "__main__":
    main()