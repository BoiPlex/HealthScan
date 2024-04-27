import requests

request = requests.get("http://127.0.0.1:7000/")
print(request.json())