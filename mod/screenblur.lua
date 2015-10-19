-------------------------------------------------
--
-- screenblur.lua
--
-- Blurres a part or the whole screen
--
-------------------------------------------------

local ScreenBlur = {}


-------------------------------------------------
-- CONSTRUCTOR
-------------------------------------------------
function ScreenBlur:new( parent, xMin,yMin,xMax,yMax)
    local blur = display.newGroup()
    parent:insert( blur )

    blur.screenBounds =
    {
        xMin = xMin or 0,
        xMax = xMax or 100,
        yMin = yMin or 0,
        yMax = yMax or 100,
    }

    blur.images        = {}                                                           -- table where all blur images are stored in
    blur.steps         = 10                                                          -- number of images used for the blur effects
    blur.stepSize      = 4

    -- capture the screen portion
    for i=1,blur.steps do
        local capture = display.captureBounds( blur.screenBounds )
        blur:insert( capture )
        capture.x = 0
        capture.y = 0
        capture.isVisible = false   -- make the capture invisible so it does notget re-captured 
        table.insert( blur.images, capture )
    end

    -- make the captures visible again
    for i=1,blur.steps do
        blur.images[i].isVisible = true
        blur.images[i].alpha = 0.5
    end

    -----------------------------------------------------------------------------
    -- blur:PerformBlur()
    -----------------------------------------------------------------------------
    function blur:PerformBlur()
        local startAlpha    = 0.5
        local xStepAlpha    = 0.5 / #self.images
        local globalAlpha   = 0.5

        local cnt = 0
        
        for i = 1, self.steps, 2 do
            cnt = cnt + 1

            self.images[i].alpha    = (startAlpha - xStepAlpha * cnt) * globalAlpha
            self.images[i].x        = 0 + cnt*self.stepSize
            self.images[i].y        = 0
            self.images[i]:toBack( )

            self.images[i+1].alpha  = (startAlpha - xStepAlpha * cnt) * globalAlpha
            self.images[i+1].x      = 0 - cnt*self.stepSize
            self.images[i+1].y      = 0
            self.images[i+1]:toBack( )
        end
    end


    -----------------------------------------------------------------------------
    -- blur:Update()
    -- recapture the blur images
    -----------------------------------------------------------------------------
    function blur:Update()
        -- delete old captures
        for i=#self.images,1,-1 do
            self.images[i]:removeSelf()
            self.images[i] = nil
        end

        -- capture the screen portion
        for i=1,self.steps do
            local capture = display.captureBounds( self.screenBounds )
            self:insert( capture )
            capture.isVisible = false   -- make the capture invisible so it does notget re-captured 
            table.insert( self.images, capture )
        end

        -- make the captures visible again
        for i=1,self.steps do
            self.images[i].isVisible = true
            self.images[i].alpha = 0.5
        end

        self:PerformBlur()
    end


    -----------------------------------------------------------------------------
    -- blur:Show()
    -----------------------------------------------------------------------------
    function blur:Show()
        for i=1,#self.images do
            self.images[i].isVisible = true
        end
    end


    -----------------------------------------------------------------------------
    -- blur:Hide()
    -----------------------------------------------------------------------------
    function blur:Hide()
        for i=1,#self.images do
            self.images[i].isVisible = false
        end
    end
    

    -----------------------------------------------------------------------------
    -- blur:Remove()
    -----------------------------------------------------------------------------
    function blur:Remove()
        -- delete captures
        for i=#self.images,1,-1 do
            self.images[i]:removeSelf()
            self.images[i] = nil
        end

        self:removeSelf( )
        self = nil
    end


    blur:PerformBlur()

    return blur
end

return ScreenBlur