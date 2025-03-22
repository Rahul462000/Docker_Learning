FROM python:3.11-alpine AS multilanguage
#setting a working directory for the container
WORKDIR /python
#copy the dependencies from the requirements.txt file
COPY requirements.txt .
#installing  the dependencies
RUN pip install --target=/python/deps -r requirements.txt 

COPY . .

FROM gcr.io/distroless/python3-debian12

WORKDIR /multiStage

COPY --from=multilanguage /python /multiStage
COPY --from=multilanguage /python/deps .


ENV PYTHONPATH=/multiStage/deps

EXPOSE 5000

CMD ["main.py" ]
