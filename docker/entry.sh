#!/bin/bash

echo "Starting GitHub Runner configuration and execution..."
echo "URL_ORGANIZATION: ${URL_ORGANIZATION}"

# Install dependencies
sudo ./bin/installdependencies.sh

# Create the runner and start the configuration experience
echo "Configuring the GitHub Runner with the provided URL and token..."
./config.sh --url  ${URL_ORGANIZATION} --token ${RUNNER_TOKEN} \
  --name "runner-devops-01" \
  --runnergroup "hosted" \
  --labels "devops,docker" \
  --work "_work" \
  --unattended

#Last step, run it!
echo "Running the GitHub Runner..."
./run.sh