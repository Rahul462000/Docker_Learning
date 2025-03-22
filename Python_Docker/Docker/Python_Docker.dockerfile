FROM python:3.11-alpine
#setting a working directory for the container
WORKDIR /python
#copy the dependencies from the requirements.txt file
COPY requirements.txt .
#installing  the dependencies
RUN pip install -r requirements.txt 

COPY . .

ENV port=5000

EXPOSE 5000

CMD [ "python","main.py" ]
