from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello, paco"}

@app.get("/items/{item_id}")
def read_item(item_id: int, query_param: str = None):
    return {"item_id": item_id, "query_param": query_param}

@app.get("/convert/fahrenheit_to_celsius/{temperature}")
def convert_fahrenheit_to_celsius(temperature: float):
    celsius = (temperature - 32) * 5.0/9.0
    return {"celsius": celsius}

@app.get("/convert/celsius_to_fahrenheit/{temperature}")
def convert_celsius_to_fahrenheit(temperature: float):
    fahrenheit = (temperature * 9.0/5.0) + 32
    return {"fahrenheit": fahrenheit}
