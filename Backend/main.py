import json
from deepface import DeepFace

from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get('/')
async def root():
  return {'color': 'blue', 'x': 10}

@app.get('/test')
async def test():
  return {"test": True, "num": None}

@app.get('/test/{num}')
async def test(num: int):
  return {"test": True, "num": num}

# Match 2 faces
# result = DeepFace.verify(img1_path="./kpic1.jpg", img2_path="./glasses1.jpg")
# print(result['verified'])
# print(json.dumps(result, indent=2))

# Find face in db
# db_result = DeepFace.find(img_path="./kpic1.jpg", db_path=)

# Classify face
features = DeepFace.analyze(img_path="./kpic1.jpg")
print(json.dumps(features, indent=2))

# """
if __name__ == "__main__":
  # uvicorn.run(app, host="127.0.0.1", port=7000, reload=True)
  pass
# """