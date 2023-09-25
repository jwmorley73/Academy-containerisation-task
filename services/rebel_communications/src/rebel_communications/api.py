"""Defines an API for rebel agents to communicate over
"""

import fastapi
import fastapi.middleware.cors

from rebel_communications import routers


fastapi_app = fastapi.FastAPI()

# Add routers
fastapi_app.include_router(routers.message_router)

# Add CORS middleware
fastapi_app.add_middleware(
    fastapi.middleware.cors.CORSMiddleware,
    allow_origins=['*'],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)
