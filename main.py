# main.py
import json
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class GetItemsResponse(BaseModel):
    item_id: int

@app.get("/items/{item_id}")
async def read_item(item_id: int) -> GetItemsResponse:
    return {"item_id": item_id}

class SayHelloResponse(BaseModel):
    messsage: str

@app.get("/")
async def say_hello() -> SayHelloResponse:
    return {"message": "hello"}

# If you want to generate the swagger file on startup you can do this:
# @app.on_event("startup")
# def save_openapi_json():
#     openapi_data = app.openapi()
#     # Change "openapi.json" to desired filename
#     with open("openapi.json", "w") as file:
#         json.dump(openapi_data, file)