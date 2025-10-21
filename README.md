# subway-mod-patcher
A tool for patching game files inside Subway Builder. This project is extremely rudimentary and probably not incredibly useful for writing anything but small patches.
**LINUX ONLY**

## Dependencies
- `jq`
- `npm`/`node`
- `curl`

## Usage
1. `cp .env.example .env`
1. Fill in the values inside `.env`
1. `./download-game.sh`
1. `./extract.sh` 
1. `./apply.sh`
1. `./repack.sh`
1. `./install.sh`


## Included patches
1. Modify desktop entry to avoid launching in xWayland
1. Hide title bar