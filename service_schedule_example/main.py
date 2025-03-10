import asyncio
from src.schedule import Scheduler


def start():
    ## Get delay from config
    scheduler = Scheduler(10)
    asyncio.run(scheduler.start())

start()





