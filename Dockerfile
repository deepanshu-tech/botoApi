FROM python

COPY . /app

# COPY ./req.txt .

# RUN pip install -r req.txt

COPY . .



RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install 
RUN aws configure set output json
# RUN apt update
# RUN apt upgrade
# RUN apt install awscli 
WORKDIR /app
# RUN chmod -R 755 config.sh
# RUN export AWS_ACCESS_KEY_ID=AKIAVLYDSOMUFK5YWYP6
# RUN export AWS_SECRET_ACCESS_KEY=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
# RUN export AWS_DEFAULT_REGION=us-east-1
RUN pip3 install boto3
RUN pip3 install flask
RUN pip3 install botocore
RUN pip3 install flask-cors
EXPOSE 5000

# CMD [ "./config.sh" ]
CMD ["python3","boto_api.py"]

