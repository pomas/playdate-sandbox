import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics
local playerSprite = nil


local kralicekMoves = 1
local kralicekLeft = gfx.image.new("Images/kralicekright")
local kralicekRight = gfx.image.new("Images/kralicekleft")
local kralicekRight2 = gfx.image.new("Images/kralicekright2")
assert( kralicekLeft )
assert( kralicekRight )
assert( kralicekRight2 )



function myGameSetUp()

    
    
    playerSprite = gfx.sprite.new( kralicekLeft )
    playerSprite:setImageDrawMode(playdate.graphics.kDrawModeWhiteTransparent)
    playerSprite:moveTo( 200, 120 ) 
    playerSprite:add()

    local backgroundImage = gfx.image.new( "Images/background" )
    assert( backgroundImage )
    --tady si zkoušim komentář

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
        if(kralicekMoves == 1) then 
            playerSprite:setImage(kralicekRight)
            kralicekMoves = 0
        else 
            playerSprite:setImage(kralicekRight2)
            kralicekMoves = 1
        end
        playerSprite:moveBy( 2, 0 )
    end
    if playdate.buttonIsPressed( playdate.kButtonDown ) then
        playerSprite:moveBy( 0, 2 )
    end
    if playdate.buttonIsPressed( playdate.kButtonLeft ) then
        playerSprite:setImage(kralicekLeft)
        playerSprite:moveBy( -2, 0 )
    end

    gfx.sprite.update()
    playdate.timer.updateTimers()

end