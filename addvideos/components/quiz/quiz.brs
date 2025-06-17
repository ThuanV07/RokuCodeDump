
' 1st function that runs for the scene component on channel startup
sub init()
  m.top.label = m.top.findNode("questions")
  m.ButtonGroup = m.top.findNode("ButtonGroup")
  m.top.setFocus = "true"
  m.points = 0
  currentIndex = 0
  m.ButtonGroup.setFocus(true) 'menuing
  m.ButtonGroup.observeField("buttonSelected","onButtonSelected")
  


end sub
  
  'When right and left are pressed index changes  
  function changeIndex(key as String, press as Boolean)
    if press then
      if key = "right" then
      currentIndex = currentIndex + 1
      else if key = "left" then
        currentIndex = currentIndex - 1
      end if
    end if

  end function


  
sub OnContentSet() 
    content = m.top.itemContent
    ' set poster uri if content is valid
    if content <> invalid 
        m.top.FindNode("buttongroup") = content.label
    end if
    
end sub

'Answering the question and check correctness
  sub onSelectedChoice()
    if m.buttonGroup.selectedButton = 0 then

    else if m.buttonGroup.selectedButton = 1 then
    
    else if m.buttonGroup.selectedButton = 2 then

    else if m.buttonGroup.selectedButton = 3 then
    
    else 
      points = points + 1

    end if
  end sub
