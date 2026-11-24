BALL_SIZE=20
BALL_X=100
BALL_Y=100
ball_dx=1000
ball_dy=300

rec1_y=100
rec2_y=100
rec1_dy=100
rec2_dy=100


love.draw = function()
  love.graphics.clear(0.3,0.1,1)
  love.graphics.rectangle("fill",BALL_X,BALL_Y, BALL_SIZE ,BALL_SIZE )
  love.graphics.rectangle("fill",0,rec1_y ,20,100)
  love.graphics.rectangle("fill",780,rec2_y,20,100)
  love.graphics.print("00", 200, 50)
  love.graphics.print("00",600 ,50)  

  for i = 1,love.graphics.getHeight() ,30 do
    love.graphics.rectangle("fill",love.graphics.getWidth()/2,i,10,15)
  end

end

love.update=function(dt)
  w=love.graphics.getWidth()
  h=love.graphics.getHeight()
  
  local ball_nx=BALL_X+ball_dx*dt
  if ball_nx<0 or ball_nx+ BALL_SIZE > w then
    ball_dx= -ball_dx
  else
    BALL_X=ball_nx
  end

  local ball_ny=BALL_Y+ball_dy*dt
  if ball_ny<0 or ball_ny+ BALL_SIZE > h then 
    ball_dy= -ball_dy
  else
    BALL_Y=ball_ny
  end

  
  speed=500  
  
  if love.keyboard.isDown("a") then 
    rec1_dy=-speed
  elseif love.keyboard.isDown("z") then
    rec1_dy=speed
  else 
    rec1_dy=0
  end

  if love.keyboard.isDown("up") then
    rec2_dy=-speed
  elseif love.keyboard.isDown("down") then
    rec2_dy=speed
  else
    rec2_dy=0
  end



  local rec1_ny=rec1_y+rec1_dy*dt
  local rec2_ny=rec2_y+rec2_dy*dt

   if rec1_ny<0 or rec1_ny+100 >h then
     rec1_dy=-rec1_dy
   else
     rec1_y=rec1_ny
   end


  if rec2_ny<0 or rec2_ny +100 >h then
    rec2_dy=-rec2_dy
  else
    rec2_y=rec2_ny
  end 
 
end



