Showcase : [CFX](https://forum.cfx.re/t/free-megaphone-script/5049366/)

Step 1 - Add items in ESX or QBCore depending on your framework. Check the folder called items

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
