#!/bin/bash

# Set the port on which the server will listen
PORT=9000

handle_request() {
  REQUEST=$1

  # Define the index page response
  INDEX_HTML=$(<index.html)
  INDEX_RESPONSE="HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n$INDEX_HTML"
  if [ -f health.html ]; then
    HEALTH_HTML=$(<health.html)
    HEALTH_RESPONSE="HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n$HEALTH_HTML"
  else
    ERROR_HTML=$(<404.html)
    HEALTH_RESPONSE="HTTP/1.1 500 Internal Server Error\r\nContent-Type: text/html\r\n\r\n$ERROR_HTML "
  fi

  if [[ "$REQUEST" == *"GET / "* ]]; then
    RESPONSE=$INDEX_RESPONSE
  elif [[ "$REQUEST" == *"GET /health "* ]]; then
    RESPONSE=$HEALTH_RESPONSE
  else
    RESPONSE="HTTP/1.1 404 Not Found\r\nContent-Type: text/plain\r\n\r\n404 Not Found"
  fi

  echo -e "$RESPONSE" | nc -l -p $PORT -q 1
}

echo "Webserver is lestining on port ${PORT}"
while true; do
  REQUEST=$(nc -l -p $PORT -q 1)
  handle_request "$REQUEST"
done
