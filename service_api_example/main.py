import asyncio
from src.api_service import ApiService


def start():
    ## Get delay from config
    api_service = ApiService()
    asyncio.run(api_service.start())

start()





