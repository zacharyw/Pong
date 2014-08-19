require 'Paddle'
require 'Ball'

function love.load()
    paddle1 = Paddle:new(.05 * love.window.getWidth(), love.window.getHeight()/2)
    paddle2 = Paddle:new(.92 * love.window.getWidth(), love.window.getHeight()/2)
    paddle1.y = paddle1.y - paddle1.height/2
    paddle2.y = paddle2.y - paddle2.height/2

    particleImage = love.graphics.newImage('particle.png')

    ball = Ball:new(love.window.getWidth()/2, love.window.getHeight()/2)

    p = love.graphics.newParticleSystem(particleImage, 5)

    p:setEmissionRate(100)
    p:setSpeed(300, 400)
    p:setLinearAcceleration(0, 0)
    p:setSizes(2, 1)
    p:setColors(255, 255, 255, 255, 58, 128, 255, 0)
    p:setPosition(400, 300)
    p:setEmitterLifetime(.4)
    p:setParticleLifetime(.4)
    p:setDirection(0)
    p:setSpread(360)
    p:setRadialAcceleration(-2000)
    p:setTangentialAcceleration(1000)
    p:setSizes(.06, .08, .1)
    p:stop()
end

function love.update(dt)
    paddle1:update(dt)
    paddle2:update(dt)
    ball:update(dt)

    p:update(dt)

    if paddle1:collides(ball) or paddle2:collides(ball) or ball.x < 0 or ball.x > love.window.getWidth() then
        p:setPosition(ball.x, ball.y)
        p:start()

        ball.xVel = -1 * ball.xVel

        if(ball.yVel == 0) then
            ball.yVel = 50
        end

    end

    if ball.y < 0 or ball.y > love.window.getHeight() then
        ball.yVel = -1 * ball.yVel
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    paddle1:draw()
    paddle2:draw()
    ball:draw()
    love.graphics.draw(p, 0, 0)
end

function load()
end