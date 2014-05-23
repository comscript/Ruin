# Ruin API guide

## require.rb
Thanks to our patented require_ALL_the_things(TM) technology, we may now require ALL the things. require.rb will require all ruby files in the src directory. It will then require all ruby files in the src subdirectories. It will then require all ruby files in the subdirectories of the src subdirectories, and so on. The idea is to put a file which has no dependencies into the src directory (such as entity.rb), then put its dependencies in a subfolder (such as entities).

(P.S. If you're requiring external libraries such as gosu and chipmunk, you can just add those to the top of require.rb in the traditional fashion.)

## Ruin

### initialize(w, h)
Create a new instance of Ruin with window dimensions w, h.
Ruin inherits Gosu::Window, so you can access all of Gosu::Window's functionality through ruin.

### addEntity(class_name, *params)
Add an entity to the ruin instance. This function instantiates the entity, passes the entity a reference to the ruin instance, and calls the entity's create() function, forwarding all of the *params.

### print(text, x, y, color=0xFFAA0000)
Print text to the screen. Great for debugging!

### ms_x() and ms_y()
Returns the absolute x/y position of the mouse in the game world. For example, if your character is at x = 1000 and your mouse is hovering over him, then ms_x will return 1000.

### _ms_x() and _ms_y()
Returns the relative x/y position of the mouse to the top-left corner of the screen. So if your character is at x = 1000, and your mouse is resting on top of him (he's currently in the center of a 800 x 600 screen) then _ms_x will return 400.

### show_cursor(show_cursor)
Passing true will turn the cursor on, whereas passing false will hide it.

## Entity

### initialize(ruin)
DON'T USE THIS! I find it annoying to create instances, pass the game to them, then pass _them_ to the _game_. Yeesh. To fix this, I've created the addEntity() method in Ruin, which will handle all this junk for you. Use the create() method to set up entities.

### create()
This is called when the entity is added to the game. Put all of your creation / setup code here.

### update()
Once this entity is added to an instance of Ruin, the update() method will be called every step of the game.

### draw()
Once this entity is added to an instance of Ruin, the draw() method will be called every time the screen needs to be drawn. Put your draw code here!

### render()
This is a convenience function which will draw the sprite at _x, _y. Call this only in the draw() method!

### sprite()
Returns the sprite for this entity. If you do not want to use render(), sprite.draw is a good way to get more control over your sprite rendering.

### sprite=(path, tileable=true)
Sets the sprite for this entity. It automatically looks in the img directory, so you only need to pass the name of your file. In the future, you will be able to pass the name of a subfolder of img/ and an animation will automatically be created from the images within the specified folder. 

(P.S. Ruby has syntactic sugar which lets you treat this function like an assignment. IE instead of writing sprite=("myimage.png"), you can write self.sprite = "myimage.png")

## Map

### create(width, height)
Create a new map of width by height blocks. Typically, you would call this via something along the lines of: ruin.addEntity(Map,1000,1000)

### block(x, y)
Use this to retrieve a block at a particular location! Ruby arrays wrap around, so @myarray[-1][0] gives you the value at @myarray[max,0]. Also, if @myarray[10] is nil, then @myarray[10][0] throws an error. This is irritating. The block(x,y) method will return nil if negative numbers are passed or if the x index doesn't exist. That way you can be sure that block(x,y) returns a block when it exists and nil when it doesn't! Yay!
