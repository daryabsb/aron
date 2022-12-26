from flaskwebgui import FlaskUI
from app.wsgi import application as app

if __name__ == "__main__":
    # FlaskUI(app=app, server="django").run()
    def saybye():
        print("on_exit bye")

    FlaskUI(

        server="django",
        server_kwargs={
            "app": app,
            "port": 8000,
        },
        width=800,
        height=600,
        on_shutdown=saybye,
    ).run()
