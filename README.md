# Enotria: The Last Song – Quality of Life Mod

This repository contains a UE4SS mod for Enotria: The Last Song, providing quality-of-life improvements such as infinite health, stamina, max inventory, and full virtue control. The mod is designed to remove grind and let you focus on exploration, story, and experimentation.

## Features

- **Infinite Stamina** (`F6`)
  - Sets stamina to 999,999 (max and current)
  - Maxes out stamina regen and removes all stamina costs
- **Max Inventory** (`F7`)
  - Maxes out all stackable and unique items
  - Estus shards set to 999 with level 20
- **Max Virtues** (`F8`)
  - Sets all virtues (Assassin, Bruiser, Battlemage, Elementalist, Trickster) to level 100
- **Infinite Health** (`F9`)
  - Sets health to 999,999 (max and current)
- **Console Commands**
  - `stat_mod_help`: Shows help and usage for all virtue commands
  - `stat_mod_level_up <virtue_name> <level>`: Set any virtue to any level instantly

## Installation

**Requirements:**
- [UE4SS (Unreal Engine 4 Scripting System)](https://github.com/UE4SS-RE/RE-UE4SS/releases)

**Steps:**
1. Download and extract the latest UE4SS release into your game's `Win64` folder:
   ```
   [Your Steam Path]\steamapps\common\Enotria\Enotria\Binaries\Win64\
   ```
2. Extract this mod. You will see `Enotria/Scripts` and `shared/Utils` folders.
3. Place the `Enotria` and `shared` folders into your `Mods` directory:
   ```
   ...\Win64\ue4ss\Mods\
   ...\Win64\ue4ss\Mods\Enotria\Scripts\main.lua
   ...\Win64\ue4ss\Mods\shared\Utils\Utils.lua
   ```
4. If required, add `Enotria` to your `mods.txt` file:
   ```
   ...\Win64\ue4ss\mods.txt
   Enotria : 1
   ```
5. Launch the game. Mod initialization messages will appear in the UE4SS console.

## Repository Structure

This repository only tracks the following directories:

```
Enotria/
shared/Utils/
```

All other mod folders and files are ignored via `.gitignore`.

## Troubleshooting

- If hotkeys don't work: Check for mod initialization messages in the UE4SS console.
- If the game crashes: Double-check your folder structure and UE4SS version.
- If stats don't update: Try fast traveling or reloading your character.

## Version History

- **v1.0** – Initial release
  - Infinite health (F9)
  - Infinite stamina (F6)
  - Max inventory (F7)
  - Max virtues (F8)
  - Console commands for granular virtue control

## Support

This mod uses UE4SS scripting to directly modify game stats. All features are designed to work within UE4SS limitations.

---

Enjoy your enhanced Enotria: The Last Song experience!
