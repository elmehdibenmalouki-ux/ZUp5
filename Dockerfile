FROM python:3.10-slim-bookworm

# تحديث الحزم وتثبيت git و wget و unzip (قد تحتاجها بعض السكربتات)
RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# تعيين متغير البيئة لتجنب مشاكل Python
ENV PYTHONUNBUFFERED=1

# نسخ ملف المتطلبات أولاً للاستفادة من الـ cache
COPY requirements.txt /app/requirements.txt

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r /app/requirements.txt

# نسخ بقية الملفات
COPY . /app

# تحديد دليل العمل
WORKDIR /app

# إعطاء صلاحيات التنفيذ لملف startup إذا كان موجوداً
RUN chmod +x startup || true

# الأمر الافتراضي للتشغيل (يمكن override من Railway)
CMD ["bash", "startup"]
