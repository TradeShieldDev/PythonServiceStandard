from sdk.api.health_api.health_check import HealthCheck
from typing import List

class HealthChecks:

    async def check_database():
        try:
            # Do a ORM get to a common table
            return True
        except:
            return False

    async def check_message_broker():
        try:
            # Check to make sure link to orchestrator is available
            return True
        except:
            return False
        
    async def check_avaialble_resources():
        try:
            # Check to make sure there is enough host resources available
            return True
        except:
            return False
        

    def generate_checks() -> List[HealthCheck]:

        return [
            HealthCheck("Database Connectivity", HealthChecks.check_database, timeout=2),
            HealthCheck("Message Broker", HealthChecks.check_message_broker, timeout=2),
            HealthCheck("Available Resources", HealthChecks.check_avaialble_resources, timeout=2)
        ]