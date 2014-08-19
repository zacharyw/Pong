local class = require 'lib/middleclass'

Paddle = class('Paddle')

function Paddle:initialize(x, y)
    self.x = x
    self.y = y
    self.speed = 300
    self.width = love.window.getWidth()*.03
    self.height = love.window.getHeight()*.2
end

function Paddle:draw()
    -- Scale the size of the paddle based on window size
    love.graphics.setColor(255, 115, 230)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:update(dt)
    self.width = love.window.getWidth()*.03
    self.height = love.window.getHeight()*.2

    if love.keyboard.isDown("down") then
        self.y = self.y + self.speed*dt
    end

    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed*dt
    end

    if self.y < 0 then
        self.y = 0
    end

    if (self.y + self.height) > love.window.getHeight() then
        self.y = love.window.getHeight() - self.height
    end
end

function Paddle:collides(ball)
    local ballRadius = ball.radius

    --Calculate if we are checking against the left or right paddle
    if ball.xVel < 0 then
        ballRadius = ballRadius * -1
    end

    if ((ball.x + ballRadius) >= self.x and (ball.x + ballRadius) <= (self.x + self.width)) and (ball.y >= self.y and ball.y <= (self.y + self.height)) then
        return true
    end
end