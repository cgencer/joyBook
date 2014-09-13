SKAdditions
===========

Sprite Kit Additions are a few enhancements to Sprite Kit engine by Apple.
To use them you need to copy the files into your project (drag the folder into Xcode Project structure) and import SKAdditions.h in .pch file.

What the additions offer:

##Macros to check for current device:##

`IS_IPAD`  
`IS_IPHONE5`

##DVScrollNode class.##

This is a class that allows to replicate UIScrollView in SpriteKit.
In order to use it, use `-initWithFrame` method and add your views to `contentView`  
The anchor point of the `contentView` is (0,1).  
You should also set `contentSize` property.

##Improved SKBButtonNode.##
This is a button class with enhanced code for pixel art games. The font scales without aliasing, which makes it beautiful to use with pixel art fonts at any scale.

##Shake category on SKNode##
This is an addition that allows to easily implement screenshake.

`[myNode shake:3]; // times to shake`  
`[myNode doubleScale]; // sets xScale and yScale to 2. Useful for iPad versions.`

##Texture filtering category on SKTextureAtlas.##
When developing games with pixel art you want to skip linear filtering, since it introduces unwanted bluring. You could either create a texture and then set its filtering mode to SKTextureFilteringNearest or use this category instead, like so:

`[myAtlas nearestTextureNamed:@"cube"];`

##Improved SKUMultilineLabelNode.##

This is a label node that renders multiline text. Again, useful for pixel art games since the font inside it is not getting antialiased or blurred when scaling or drawing.
You will need to set `myAnchor` property instead of `anchorPoint` property if you need it.


