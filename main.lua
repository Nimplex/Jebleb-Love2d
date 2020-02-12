function love.load()
  love.window.setTitle("Jebleb - Ctrl-Team(c)")
  score = {}
  score.len = ""
  button = {}
  button.x = love.graphics.getWidth()/2
  button.y = love.graphics.getHeight()/2
  button.size = 50

  point = {}
  point.x = love.graphics.getWidth()/2
  point.y = love.graphics.getHeight()/2
  point.size = 20
  font = love.graphics.newFont(40)
  menu_font = love.graphics.newFont(20)
  gameover = true
end
function love.update(dt)
  if clicked == true then 
    score.len = score.len + 1
    clicked = false
  end
end
function love.draw()
  if gameover ~=true then
    love.graphics.setColor(255,255,255)
    love.graphics.circle("fill", point.x , point.y, point.size)
    love.graphics.setFont(font)
    love.graphics.print("Score: "..score.len,love.graphics.getWidth()/2-50,0)
  else
    love.graphics.setColor(255,255,255)
    score = 0
    love.graphics.circle("fill", button.x , button.y-20, button.size)
    love.graphics.setColor(0,0,0)
    love.graphics.setFont(menu_font)
    love.graphics.print("Start",button.x-25,button.y-30)
    love.graphics.setColor(255,255,255)
    love.graphics.setFont(font)
    love.graphics.print("Jebleb",love.graphics.getWidth()/2-50,20)

    love.graphics.setColor(255,255,255)
    love.graphics.circle("fill", button.x , button.y+150, button.size)
    love.graphics.setColor(0,0,0)
    love.graphics.setFont(menu_font)
    love.graphics.print("Exit",button.x-25,button.y+140)
  end

end

function love.mousepressed(x,y,b,istouch)
  if b == 1 then
    if gameover == false then
      if distance(point.x,point.y,x,y) < point.size then
        math.randomseed(math.random(os.time(), 11928312938))
        clicked = true
        point.x = math.random(0,love.graphics.getWidth())
        point.y = math.random(0,love.graphics.getHeight())
      else
        gameover = true
      end
    end

    if gameover == true then 
      if distance(button.x,button.y-20,x,y) < button.size then
        gameover = false
      elseif distance(button.x,button.y+140,x,y) < button.size then
        love.window.close()
      end
    end
  end
end

function distance(x1,y1,x2,y2)
  return math.sqrt((y2-y1)^2 + (x2-x1)^2)
end