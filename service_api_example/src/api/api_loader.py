from fastapi import FastAPI

from sdk.logging.logger import Logger
from src.api.apis.calendar_api import CalendarAPI
from src.api.apis.calculator_api import CalculatorAPI
from sdk.api.health_api.health_api import create_health_router
from src.api.health_checks import HealthChecks

logger = Logger.get_instance()

# Register all the required API's
def start_apis(app: FastAPI) -> None:    
    # Initialize your API classes and attach them to the main app.
    logger.info('Loading all the API''s configured in the application...')

    # ------------------------ Health API Setup -------------------------- #
    health_router = create_health_router(HealthChecks.generate_checks())
    app.include_router(health_router)
    # -------------------------------------------------------------------- #

    # Add Calendar API
    calendar_api = CalendarAPI()
    app.include_router(calendar_api.router, prefix="/calendar", tags=["example"])
    
    # Add Calculator API
    calculator_api = CalculatorAPI()
    app.include_router(calculator_api.router, prefix="/calculator", tags=["example"])

