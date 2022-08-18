UpMod
===

Minetest mod for testing various stuff in The Uplift
---

**nodes.lua** adds various nodes. Currently adds:
- Iron Bar Floor
- Nether Bricks
- Sea Lantern
- White Lamp

**overrides.lua** enhances various default nodes. Currently enhances the following default blocks; 
- Jungle Log

![alt text](https://github.com/mightpossibly/upmod/blob/main/allnodes.png)

**panes.lua** adds colored glass panes.

![alt text](https://github.com/mightpossibly/upmod/blob/main/screenshot.png)

Crafting
---------
Coloured glass panes are crafted from six glass nodes and the matching dye.
All other nodes are currently only available in Creative. Crafting recipes tba.

Known issues
---------
An engine bug causes textures that are semi-transparent (i.e. the textures for the glass panes) to flicker in-game. The only known work-around is to replace "pmod_plainglass.png"with "pmod_plainglass_noalpha.png". This removes the the flickering, but also makes the glass panes look less nice (as there is no longer a color tint).

Licenses and Attribution 
-----------------------

Code for this mod is released under MIT (https://opensource.org/licenses/MIT).

Code found in panes.lua is a fork of "abriglass" By Shara RedCat (https://github.com/Ezhh/abripanes)

Textures for this mod are released under CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/), attribution: mightpossibly.
