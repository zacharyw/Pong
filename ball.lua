local class = require 'lib/middleclass'

Ball = class('Ball')

function Ball:initialize(x, y)
    self.x = x
    self.y = y

    self.yVel, self.xVel = getRandomVel()

    if self.yVel < 50 then
        self.yVel = -200
    else
        self.yVel = 200
    end

    if self.xVel < 50 then
        self.xVel = -200
    else
        self.xVel = 200
    end
    self.radius = love.window.getWidth() * .01
end

function Ball:draw()
    love.graphics.setColor(115, 255, 130)
    love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end

function Ball:update(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function getRandomVel()
    return math.random(0, 100), math.random(0, 100)
end

