from fastapi import APIRouter, Query

class CalculatorAPI:
    
    def __init__(self):
        # Create a dedicated router for this API class
        self.router = APIRouter()

        # Define all operation endpoints
        self.router.add_api_route(
            path="/sum",
            endpoint=self.sum_numbers,
            methods=["GET"]
        )
        self.router.add_api_route(
            path="/subtract",
            endpoint=self.subtract_numbers,
            methods=["GET"]
        )
        self.router.add_api_route(
            path="/multiply",
            endpoint=self.multiply_numbers,
            methods=["GET"]
        )
        self.router.add_api_route(
            path="/divide",
            endpoint=self.divide_numbers,
            methods=["GET"]
        )

    def sum_numbers(self, number_one: int = Query(...), number_two: int = Query(...)):
        result = number_one + number_two
        return {"Sum": result}

    def subtract_numbers(self, number_one: int = Query(...), number_two: int = Query(...)):
        result = number_one - number_two
        return {"Subtract": result}

    def multiply_numbers(self, number_one: int = Query(...), number_two: int = Query(...)):
        result = number_one * number_two
        return {"Multiply": result}

    def divide_numbers(self, number_one: int = Query(...), number_two: int = Query(...)):
        if number_two == 0:
            return {"error": "Division by zero is not allowed"}
        result = number_one / number_two
        return {"Divide": result}
