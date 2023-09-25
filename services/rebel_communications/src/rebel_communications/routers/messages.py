"""Defines the methods for the `/messages/` endpoint

Raises:
    fastapi.HTTPException: If the message for a message uuid is not found

Returns:
    fastapi.routing.APIRouter: Router to be included within a fastapi api
"""
import typing

import fastapi
import fastapi.routing

from rebel_communications import database


message_router = fastapi.routing.APIRouter(prefix="/messages")


@message_router.get("/")
async def get_messages() -> typing.List[str]:
    """Returns a list of message ids.

    Returns:
        List[str]: List of message ids
    """
    return database.messages.keys()

@message_router.get("/{uuid:str}")
async def get_message(uuid: str) -> str:
    """Return a message content for the message id.

    Returns a 404 error if the message is not found.

    Returns:
        str: Message content if found.
    """
    message = database.messages.get(uuid)

    if message is None:
        raise fastapi.HTTPException(
            404, f"No message was found for the message uuid: {uuid}."
        )
    return message
