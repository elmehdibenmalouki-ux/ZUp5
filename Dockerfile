FROM python:3.9-slim-buster

# تثبيت Git أولاً
RUN apt-get update && apt-get install -y git

# ثم نسخ المستودع
RUN git clone https://github.com/ZThon-Bot/ZTele.git /root/zlzl

WORKDIR /root/zlzl

# بقية الأوامر (تثبيت المتطلبات، تشغيل البوت...)
RUN pip install -r requirements.txt
CMD ["python", "main.py"]  # شوف شنو كي命令 فالسورس الأصلي
