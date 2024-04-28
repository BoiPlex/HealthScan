from fastapi import FastAPI
import uvicorn
import time
from cv2 import VideoCapture, destroyWindow, imshow, imwrite, waitKey
from typing import Annotated, Any, Dict, AnyStr, List, Union
from deepface import DeepFace

app = FastAPI()

from fastapi.middleware.cors import CORSMiddleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get('/')
async def root():
  return "Backend running"

@app.get('/emotion')
async def emotion():
  cam_port = 0
  cam = VideoCapture(cam_port)
  result, image = cam.read()
  if result:
    imshow("Here", image)
    imwrite("scanned_faces/face.png", image)
    # time.sleep(5)
    # waitKey(0)
    destroyWindow("Here")
  else:
    print("No image!")
    return

  features = DeepFace.analyze(img_path="./scanned_faces/face.png", actions=["emotion"])
  return features[0]
  

# Match 2 faces
# result = DeepFace.verify(img1_path="./kpic1.jpg", img2_path="./glasses1.jpg")
# print(result['verified'])
# print(json.dumps(result, indent=2))

# Find face in db
# db_result = DeepFace.find(img_path="./kpic1.jpg", db_path=)

# Classify face
# features = DeepFace.analyze(img_path="./kpic1.jpg")
# print(json.dumps(features, indent=2))

# """
if __name__ == "__main__":
  uvicorn.run("main:app", host="127.0.0.1", port=7000, reload=True)
  pass
# """