import asyncio

from typing import List
from datetime import datetime
from sdk.logging.logger import Logger

logger = Logger.get_instance()

class Scheduler:

    delay_in_seconds = None
    counter = 0

    def __init__(self, delay_in_seconds:int):
        self.delay_in_seconds = delay_in_seconds

    async def exec(self):
        self.counter += 1
        logger.info(f"Task is running at {datetime.utcnow()}. Counter [{self.counter}] every [{self.delay_in_seconds}] seconds")

    async def start(self):

        try:

            while True:
                await self.exec()
                await asyncio.sleep(self.delay_in_seconds)

        except asyncio.CancelledError:
            print("Task was cancelled")
