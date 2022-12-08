# start from Python 3.9 base container image
FROM python:3.9

# Create working directory for FastAPI app 
WORKDIR /code

# COPY requirements file into /code directory within container
COPY ./requirements.txt /code/requirements.txt

# Pip install requirements
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy FastAPI app into container and model directory into container
COPY ./app /code/app
COPY ./model /code/model

# Kick off app on port 80
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
