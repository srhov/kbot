# kbot

A simple Telegram bot built with Go and Cobra CLI.

## Features
- Echoes back any message sent to it on Telegram.
- Easy to run as a CLI application.

## Requirements
- Go 1.18 or newer
- A Telegram bot token (from @BotFather)

## Setup
1. Clone this repository.
2. Install dependencies:
   ```sh
   go mod tidy
   ```
3. Set your Telegram bot token as an environment variable:
   ```sh
   export TELE_TOKEN=your_telegram_bot_token
   ```

## Usage
To start the bot:
```sh
cd kbot
make run
```
Or run directly:
```sh
go run main.go kbot
```

### Commands
- `kbot` or `kbot start`: Starts the Telegram bot.
- `kbot version`: Shows the application version.

## Project Structure
- `cmd/`: Cobra commands for the CLI.
- `main.go`: Entry point for the application.

## License
MIT
