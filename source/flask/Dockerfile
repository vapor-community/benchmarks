FROM python

WORKDIR /code

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "gunicorn", "--chdir", "/code", "--bind", "0.0.0.0:9000", "main:app" ]
