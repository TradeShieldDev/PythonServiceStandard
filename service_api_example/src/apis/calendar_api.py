from fastapi import APIRouter
import datetime

class CalendarAPI:
    
    def __init__(self):
        # Create a dedicated router for this API class
        self.router = APIRouter()

        # Add your route handlers here
        self.router.add_api_route(
            path="/",
            endpoint=self.get_root,
            methods=["GET"]
        )

    def get_root(self):
        return {"Date": f"Today is {datetime.date.today()}"}
