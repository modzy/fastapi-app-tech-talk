# FastAPI Model Serving Example

![Modzy Logo](./images/modzy-banner.png)

<div align="center">

![FastAPI Logo](./images/FastAPI_logo.png)

**This repository provides an example of a simple FastAPI wrapper around a Scikit-learn model that is containerized and served with Docker.**

![GitHub contributors](https://img.shields.io/github/contributors/modzy/fastapi-app-tech-talk?logo=GitHub&style=flat)
![GitHub last commit](https://img.shields.io/github/last-commit/modzy/fastapi-app-tech-talk?logo=GitHub&style=flat)
![GitHub issues](https://img.shields.io/github/issues-raw/modzy/fastapi-app-tech-talk?logo=github&style=flat)
![GitHub](https://img.shields.io/github/license/modzy/fastapi-app-tech-talk?logo=apache&style=flat)

</div>

## Getting Started

This repository provides an example of a simple FastAPI wrapper around a Scikit-learn model that is containerized and served with Docker. Below is a quick overview of the repository's contents:
* `app/`: Directory for our [FastAPI](https://fastapi.tiangolo.com/) application
* `model/`: Contains the training script and pickle file for our trained machine learning model
* `Dockerfile`: File we will use to build a Docker container image to deploy our FastAPI application
* `requirements.txt`: Python packages required to run the FastAPI app  

Begin using the application in this repository right away by ensuring you have the following prerequisites installed:
* Python>=3.7
* Docker

## Environment Setup

This section provides instructions for setting up your environment and installing dependencies you will need to execute the code in this repository.

Start by cloning this project into your directory and changing the directory:

```bash
git clone https://github.com/modzy/fastapi-app-tech-talk.git
cd fastapi-app-tech-talk
```

Next, in your Python environment (**must be v3.7 or greater**), create and activate a virtual environment with your preferred virtual environment tool (conda, pyenv, venv, etc.) These instructions will leverage Python's native [venv](https://docs.python.org/3/tutorial/venv.html) module.

```bash
python -m venv venv
```

Activate environment.

*For Linux or MacOS*:

```bash
source venv/bin/activate
```

*For Windows*:

```powershell
.\venv\Scripts\activate
```

Finally, use pip to install the python packages required to run the API:

```bash
pip install -r requirements.txt
```

You are all set! Continue following along to test out the API and containerize it with Docker.

## Run FastAPI app

Within the `app/` directory, you will find a [main.py](./app/main.py) file we use to define our FastAPI application. This simple API is an inference wrapper around the Scikit-learn model to predict Iris species.

To run the app, simply run this command in your terminal:

```bash
uvicorn app.main:app --reload
```

This will spin up your FastAPI application on http://127.0.0.1:8000. Navigate to this URL, where you should see a message that looks like the following:

```json
{"detail":"Not Found"}
```

This is expected since we did not implement a root function, which in this case is not needed.

Navigate to http://127.0.0.1:8000/docs to see the automatically generated Swagger API docs, which allow you to interact directly with the application.

## Containerize FastAPI app

Now that we have tested our FastAPI app, it is time to package our app in a container, which will allow us to deploy our API in scalable manner and provide access to our application.

To do so, simply build the Docker container image:

```bash
docker build -t fastapi-ml-model .
```

Next, spin up your container and port-forward the ports so you can again interact with your running container via the Swagger docs interactive UI.

```bash
docker run --rm -it -p 8000:80 fastapi-ml-model
```

Just as before when you ran the `uvicorn` command, you should see your application spin up inside of the Docker container. Again, navigate to http://127.0.0.1:8000/docs and see how you can make interactive API calls to a running container!






