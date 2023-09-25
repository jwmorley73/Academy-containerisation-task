"""Entrypoint for when package is run as a package or for programic 
calling of `main`
"""

import uvicorn


def main(host: str = '0.0.0.0', port: int = 8001) -> None:
    """Entrypoint to launch api.

    Args:
        host (str, optional): Host to listen for api request on. 
            Defaults to '0.0.0.0'.
        port (int, optional): Port to listen for api requests on. 
            Defaults to 8001.
    """
    uvicorn.run('rebel_secret_communications.api:fastapi_app', host=host, port=port)


if __name__ == '__main__':
    main()
