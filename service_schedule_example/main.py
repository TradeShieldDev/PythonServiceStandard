import asyncio
import threading

from src.schedule import Scheduler
from sdk.config.config_loader import ConfigManager, DataType
from sdk.logging.logger import Logger
from src.config.sections import ConfigSections

config:ConfigManager = ConfigManager.get_instance()
logger = Logger.get_instance()

stop_event = threading.Event()

def key_press_listener():
    import keyboard
    keyboard.wait('esc')
    stop_event.set()


async def start():

    delay_in_seconds = config.get_ini_key_value(ConfigSections.ScheduleDetails, 'delay_in_seconds', 10, DataType.Integer)
    environment = config.get_ini_key_value(ConfigSections.General, 'environment', None)
    
    ## Get delay from config
    scheduler = Scheduler(delay_in_seconds)

    task = asyncio.create_task(scheduler.start())
    print(f"Started in [{environment}]. Press 'ESC' key to stop...")

    # Start the thread for listening to keyboard input
    listener_thread = threading.Thread(target=key_press_listener)
    listener_thread.start()

    # Loop until the stop event is set
    while not stop_event.is_set():
        await asyncio.sleep(0.1)

    task.cancel()
    await task  # Wait for the task to be cancelled

loop = asyncio.get_event_loop()

try:
    logger.info('Scheduler service is starting up...')
    loop.run_until_complete(start())

except Exception as ex:        
    logger.error(f"Oops! {ex.__class__} occurred. Scheduler service has stopped. Details: {ex}") 

finally:
    loop.close()
    logger.info('Scheduler service has stopped')



