# django-ticket-35420
Test project for ticket #35420 (support for RSS stylesheets)

## How to run it

```
pip install -r requirements.txt  # ideally in a virtualenv
python manage.py migrate  # will magically create test data
python manage.py runserver
python -m webbrowser http://localhost:8000/  # or open the URL in your browser
```
