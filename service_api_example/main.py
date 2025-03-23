from src.api_loader import start_apis
from sdk.config.config_loader import ConfigManager
from sdk.logging.logger import Logger
from fastapi import FastAPI

import uvicorn

config:ConfigManager = ConfigManager.get_instance()
logger = Logger.get_instance()


# Setup the FastAPI application
def create_app() -> FastAPI:

    environment = config.get_json_section('environment', str)
    logger.info(f'Starting up application in [{environment}].')
    
    app = FastAPI()
    # Any global middlewares, exception handlers, etc. can be placed here.

    # Load all the APIs from our loader
    start_apis(app)
    
    return app


app = create_app()

if __name__ == "__main__":
    # For local development
    uvicorn.run(app, host="127.0.0.1", port=8181)