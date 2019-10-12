 # Chatroom

Real-time chat application built using the Ruby on Rails framework.

## Prerequisite

* Ruby version: **2.6.3**

* Rails version: **6.0.0**

* Supported OS: macOS, Linux

* Configurations: 4GB RAM

## Installation

+ [Ruby on Rails](https://guides.rubyonrails.org/v6.0/getting_started.html)

+ [PostgresSQL](https://www.postgresql.org/docs/9.3/tutorial-install.html)

+ [Redis](https://redis.io/topics/quickstart)

## Build resource

From the **root** of the app directory, run
```bash
# This sets up the library installation with database creation and migration
./init.sh
```

After running the init script, start the server by running

```bash
foreman start
```

In web browser open [http://localhost:5000]()

## To Create a Docker Image

From the **root** of the app directory, run the following command

```bash
sudo docker build . -t rails-chatroom
```

After building the image execute the following command to run the application

```bash
docker run -i -t rails-chatroom
```

## Tech stack

- [Ruby on Rails v6.0.0]() -> Web framework
- [PostgresSQL 9.6]() ->  Database
- [Redis 5.0.5]() -> Caching
- [Sidekiq 5.2]() -> Message broker and background jobs
- [ActionCable]() -> Enabling web sockets

## References

[https://iridakos.com/tutorials/2019/04/04/creating-chat-application-rails-websockets.html](https://iridakos.com/tutorials/2019/04/04/creating-chat-application-rails-websockets.html)



[https://www.youtube.com/watch?v=PaJB2tZdSII]



(https://www.youtube.com/watch?v=PaJB2tZdSII)