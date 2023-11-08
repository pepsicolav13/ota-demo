FROM nginx

RUN apt update && apt install -y python3 dnsutils iproute2
ENV NAME=bob
ADD hello.py .

CMD ["python3", "hello.py"]
