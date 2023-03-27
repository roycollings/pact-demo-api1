# Installation
It's best to do this in a virtual environment, but either way ....
```
pip install fastapi "uvicorn[standard]"
```

# Running the api
This will start the api and will automatically reload when you save changes.
```
uvicorn main:app --reload
```
- The api will be available on http://127.0.0.1:8000
- The Swagger / openapi docs are available at either http://127.0.0.1:8000/docs or http://127.0.0.1:8000/redoc

# Generating the openapi spec as a file
For PACT testing we need this as a file, so run this to generate it:
```
python ./generate_openapi.py
```

# TODO
Create github action to publish -> check -> deploy.
- https://github.com/pactflow/actions/tree/main/publish-pact-files
- https://github.com/pactflow/actions/tree/main/can-i-deploy
- https://github.com/pactflow/actions/tree/main/record-deployment