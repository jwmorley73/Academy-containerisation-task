# Build stage
FROM python:3.11 as BUILD

# Set build directory
WORKDIR build

# Install Dependancies
RUN python3 -m venv .venv
COPY requirements.txt requirements.txt
RUN ./.venv/bin/python -m pip install -r requirements.txt

# Install project
COPY src src
COPY pyproject.toml pyproject.toml
RUN ./.venv/bin/python -m pip install .


# Deploy stage
FROM python:3.11 as DEPLOY

# Create user
RUN useradd --create-home --shell /bin/bash mainuser

# Set the working directory and switch to the user
WORKDIR /home/mainuser
USER mainuser

# Copy python virtual envionment from build stage
COPY --from=BUILD --chown=mainuser /build/.venv ./.venv


EXPOSE 8000
ENTRYPOINT ["./.venv/bin/python", "-m", "rebel_communications"]
