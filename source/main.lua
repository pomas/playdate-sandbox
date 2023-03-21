import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics
local playerSprite = nil


function myGameSetUp()

    local playerImage = gfx.image.new("Images/playerImage")
    assert( playerImage )

    playerSprite = gfx.sprite.new( playerImage )
    playerSprite:moveTo( 200, 120 ) 
    playerSprite:add()

    local backgroundImage = gfx.image.new( "Images/background" )
    assert( backgroundImage )

    gfx.sprite.setBackgroundDrawingCallback(
            function( x, y, width, height )
                backgroundImage:draw( 0, 0 )
            end
    )

end

myGameSetUp()

function playdate.update()


    if playdate.buttonIsPressed( playdate.kButtonUp ) then
        playerSprite:moveBy( 0, -2 )
    end
    if playdate.buttonIsPressed( playdate.kButtonRight ) then
        playerSprite:moveBy( 2, 0 )
    end
    if playdate.buttonIsPressed( playdate.kButtonDown ) then
        playerSprite:moveBy( 0, 2 )
    end
    if playdate.buttonIsPressed( playdate.kButtonLeft ) then
        playerSprite:moveBy( -2, 0 )
    end

    gfx.sprite.update()
    playdate.timer.updateTimers()

end