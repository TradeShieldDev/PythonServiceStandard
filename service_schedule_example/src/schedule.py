import asyncio

from typing import List
from datetime import datetime

class Scheduler:

    delay_in_seconds = None

    def __init__(self, delay_in_seconds:int):
        self.delay_in_seconds = delay_in_seconds

    async def exec(self):
        print(f"Task is running at {datetime.utcnow()}")

    async def start(self):

        while True:
            await self.exec()
            await asyncio.sleep(self.delay_in_seconds)  # 5 minutes in seconds
