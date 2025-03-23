from fastapi import FastAPI

from sdk.logging.logger import Logger
from src.apis.calendar_api import CalendarAPI
from src.apis.calculator_api import CalculatorAPI

logger = Logger.get_instance()

# Register all the required API's
def start_apis(app: FastAPI) -> None:    
    # Initialize your API classes and attach them to the main app.
    logger.info('Loading all the API''s configured in the application...')

    # Add Calendar API
    calendar_api = CalendarAPI()
    app.include_router(calendar_api.router, prefix="/calendar", tags=["example"])
    
    # Add Calculator API
    calculator_api = CalculatorAPI()
    app.include_router(calculator_api.router, prefix="/calculator", tags=["example"])


    # If you have more APIs, you can keep adding them:
    # another_api = AnotherAPI()
    # app.include_router(another_api.router, prefix="/another", tags=["another"])

    # Optionally, do other startup steps here, like DB connections, logging config, etc.
