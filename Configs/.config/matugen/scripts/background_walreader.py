#!/usr/bin/env python3
import asyncio
import websockets
from pathlib import Path

COLOR_FILE = Path.home() / ".cache" / "wal" / "walreader.json"
PORT = 6767

current_websocket = None
prev_data = None

async def handler(websocket):
    global current_websocket, prev_data
    if current_websocket is not None:
        await current_websocket.close()
        print('[Wal Reader] Another client is trying to connect, dropped previous connection')
    
    current_websocket = websocket
    print('[Wal Reader] Client connected')

    prev_data = None
    try:
        while True:
            try:
                with open(COLOR_FILE, 'r', encoding='utf-8') as file:
                    data = file.read()
                    if prev_data != data:
                        prev_data = data
                        await websocket.send(data)
                        print(f'[Wal Reader] Sent: \n{data}')
            except FileNotFoundError:
                print('[Wal Reader] 🕆 Color file not found') 
            await asyncio.sleep(2)
    except websockets.ConnectionClosed:
        pass
    finally:
        if current_websocket is websocket:
            current_websocket = None
            prev_data = None
        print('[Wal Reader] 🕆 Client disconnected')

async def main():
    async with websockets.serve(handler, 'localhost', PORT):
        print(f'[Wal Reader] Server is running on ws://localhost:{PORT}, waiting for client')
        await asyncio.Future()

asyncio.run(main())