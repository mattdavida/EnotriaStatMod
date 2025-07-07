# ENOTRIA: The Last Song – Quality of Life Mod v2.0

Enhance your Enotria: The Last Song experience with infinite health, stamina, max inventory, infinite line casting, and full virtue control. This mod is designed to remove grind and let you focus on exploration, story, and experimentation.

## 🌟 Philosophy

This mod is built around **REMOVING LIMITATIONS**:
- Frustrated by dying or running out of stamina? Use `F9` for infinite health, `F6` for infinite stamina.
- Want to experiment with every item? Use `F7` for max inventory and weapon upgrades.
- Want to try every build? Use `F8` for max virtues, or set any virtue to any level with a console command.
- Want unlimited magic casting? Use `F5` for infinite line casts with no cooldowns.
- All features are **OPTIONAL** hotkeys or commands. Use what you want, ignore what you don't.

## 🎮 Main Features (Hotkeys)

### F5 = INFINITE LINE CASTS
- Removes all cooldowns from Line abilities (magic/skills)
- Cast any Line as fast as animation allows
- No need to damage enemies to reset cooldowns

### F6 = INFINITE STAMINA
- Sets stamina to 999,999 (max and current)
- Maxes out stamina regen and removes all stamina costs
- Run, dodge, and attack without ever running out

### F7 = MAX INVENTORY
- Maxes out all stackable and unique items in your inventory
- Estus shards set to 999 with level 20
- All weapons upgraded to level 10

### F8 = MAX VIRTUES
- Sets all virtues (Assassin, Bruiser, Battlemage, Elementalist, Trickster) to level 100

### F9 = INFINITE HEALTH & SKILL TREE UNLOCK
- Sets health to 999,999 (max and current)
- Sets inspiration to 9999 (unlocks entire skill tree)
- Become mostly unkillable for true exploration freedom

## 🖥️ Advanced Features (Console Commands)

### `stat_keybinds`
Shows all available hotkeys and their functions

### `stat_help`
Shows help and usage for all virtue commands

### `stat_level_up <virtue_name> <level>`
Set any virtue to any level instantly
- **Example:** `stat_level_up Bruiser 50`

## 📋 Installation

### Requirements
- [UE4SS (Unreal Engine 4 Scripting System)](https://github.com/UE4SS-RE/RE-UE4SS/releases)

### Installation Steps
1. **Install UE4SS:** Download and extract the latest UE4SS release into your game's Win64 folder:
   ```
   [Your Steam Path]\steamapps\common\Enotria\Enotria\Binaries\Win64\
   ```

2. **Download & Extract this Mod:** Extract the mod zip. You will see `Enotria/Scripts` and `shared/Utils` folders.

3. **Copy to Mods Folder:** Place the `Enotria` and `shared` folders into your Mods directory:
   ```
   ...\Win64\ue4ss\Mods\
   ```
   Your structure should look like:
   ```
   ...\Win64\ue4ss\Mods\Enotria\Scripts\main.lua
   ...\Win64\ue4ss\Mods\shared\Utils\Utils.lua
   ```

4. **Enable the Mod:** If required, add Enotria to your mods.txt file:
   ```
   ...\Win64\ue4ss\mods.txt
   ```
   Add this line:
   ```
   Enotria : 1
   ```

5. **Launch the Game:** Start Enotria: The Last Song. You'll see mod initialization messages in the UE4SS console.

## 🔧 Troubleshooting

- **If hotkeys don't work:** Check for mod initialization messages in the UE4SS console
- **If game crashes:** Double-check your folder structure and UE4SS version
- **If stats don't update:** Try fast traveling or reloading your character

## ⚠️ Performance & Stability

This mod uses efficient single-pass processing and works within UE4SS engine boundaries for maximum stability. The game may crash if commands are used excessively - this is a known limitation of Enotria's engine performance under modding loads.

### Recommended Usage
- Use features sparingly to avoid crashes
- Save your game before using mod features
- If experiencing crashes, use "burst mode": enable features → save → disable mod

## 🎖️ Version History

### v2.0 - Major Feature Update
- **NEW:** Infinite Line Casts (F5) - no cooldowns on magic abilities
- **NEW:** Weapon auto-upgrades to level 10 (F7)
- **NEW:** Max inspiration/skill tree unlock (F9)
- **IMPROVED:** Updated console commands (`stat_help`, `stat_level_up`)
- **IMPROVED:** Added `stat_keybinds` command to show all hotkeys
- **IMPROVED:** Enhanced error handling and code consistency

### v1.0 - Initial Release
- Infinite health (F9)
- Infinite stamina (F6)
- Max inventory (F7)
- Max virtues (F8)
- Console commands for granular virtue control

## 📞 Support

This mod uses UE4SS scripting to directly modify game stats. All features are designed to work within UE4SS limitations.

**Enjoy your enhanced Enotria: The Last Song experience!**
