Discord : https://discord.gg/ASrdTD7DU9



Step 1 - Add item in qb-core/shared/items.lua

	['megaphone'] 			 	 = {['name'] = 'megaphone', 					['label'] = 'Megaphone', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'megaphone.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = ''},


Step 2 - Add the following code to dpemotes :

```lua
    ["megaphone"] = {"molly@megaphone", "megaphone_clip", "Megaphone", AnimationOptions =
    {
        Prop = "prop_megaphone_01",
        PropBone = 28422,
        PropPlacement = {0.050000, 0.054000, -0.0060, -71.885498, -13.088900, -16.0242},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
```
