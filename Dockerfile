FROM python:3.10-slim-bookworm

# تحديث القوائم وتثبيت Git
RUN apt-get update && apt-get install -y git

# نسخ المستودع
RUN git clone https://github.com/ZThon-Bot/ZTele.git /root/zlzl

WORKDIR /root/zlzl

# تثبيت المتطلبات
RUN pip install --upgrade pip && pip install -r requirements.txt

# تشغيل البوت (تأكد من الأمر الصحيح)
CMD ["python", "main.py"]
