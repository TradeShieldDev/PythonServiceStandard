import asyncio
from src.schedule import Scheduler
from sdk.config.config_loader import ConfigType, ConfigManager
from sdk.logging.logger import Logger

config = ConfigManager.get_instance()
logger = Logger.get_instance()

def start():
    logger.info('Scheduler service is starting up...')

    ## Get delay from config
    scheduler = Scheduler(10)
    asyncio.run(scheduler.start())

    logger.info('Scheduler service has stopped.')

start()





