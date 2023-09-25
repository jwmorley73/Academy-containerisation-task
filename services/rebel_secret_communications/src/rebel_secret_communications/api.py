"""Defines an API for rebel agents to communicate over
"""

import fastapi
import fastapi.middleware.cors
import fastapi.middleware.trustedhost

from rebel_secret_communications import routers, network


fastapi_app = fastapi.FastAPI()

# Add routers
fastapi_app.include_router(routers.message_router)

# Add CORS middleware
fastapi_app.add_middleware(
    fastapi.middleware.cors.CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Add Security middleware to only allow default network requests (default network
# should be the docker network unless something wild is going on)
origins = [
    str(origin)
    for origin in network.get_network(network.get_default_network_ip()).hosts()
]
fastapi_app.add_middleware(
    fastapi.middleware.trustedhost.TrustedHostMiddleware,
    allowed_hosts=origins
)
