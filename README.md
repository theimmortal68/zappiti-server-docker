## Description
Docker container to install and run Zappiti Server app as local Cloud using your PC, Unraid, or custom NAS solution. Your files used for the collection are saved only on your machine.

## Advantages
 - Does not require a fast Internet connection on the Zappiti drive. You can manage and edit everything from Zappiti 4K HDR / Zappiti Player 4K or from a PC or Mac computer.
 - You do not have to leave a computer running at all times.
 - Possibility to explore and edit its collections on several Zappiti media players but also from a tablet / smartphone (iOS uo Android) or a computer (Mac / PC).
 - Zappiti Server updates are automatic and transparent.
 - All technical information is retrieved via Mediainfo including ratio, frame rate, video resolution, main audio codec, maximum number of channels, video codec, video container, subtitles and languages.

Warning! Some technical info can be proposed by default on ISO files.

Warning! The export function on Zappiti Cloud is currently non-functional. The Zappiti developers are working on a solution. Until it is fixed, there is no way to transfer collections from the cloud to your local server. You will have to create new collections on the local server.

## Usage

Here is an example snippet to help you get started creating a container.

```bash
docker run -d \
  --name=zappiti-server\
  -e PUID=99 \
  -e PGID=100 \
  -e TZ=America/New_York \
  -p 8777:8777/tcp \
  -p 8777:8777/udp \
  -v /path/to/appdata/bin:/app/bin \
  -v /path/to/appdata/data:/app/data \
  --restart unless-stopped \
  theimmortal/zappiti-server:latest
```

## Parameters

| Parameter | Function |
| :----: | --- |
| `-p 8777/tcp` | Port for web frontend |
| `-p 8777/udp` | Port for Zappiti Video autodiscovery |
| `-v /app/bin` | Path to application dependencies |
| `-v /app/data` | Path to application data |

