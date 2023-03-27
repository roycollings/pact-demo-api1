from fastapi.openapi.utils import get_openapi
from main import app
import json


with open('oas/openapi.json', 'w') as f:
    json.dump(get_openapi(
        title=app.title,
        version=app.version,
        # openapi_version=app.openapi_version,
        openapi_version="swagger:2.0",
        description=app.description,
        routes=app.routes,
    ), f)