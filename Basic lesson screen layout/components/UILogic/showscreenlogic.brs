sub InitScreenStack()
    m.screenStack = []
end sub

'screen switching

sub ShowScreen(node as Object)
    prev = m.screenStack.Peek() ' take current screen from screen stack but don't delete it
    if prev <> invalid
        prev.visible = false ' hide current screen if it exist
    end if
    m.top.AppendChild(node) ' add new screen to scene
    ' show new screen
    node.visible = true
    node.SetFocus(true)
    m.screenStack.Push(node) ' add new screen to the screen stack
  end sub
  

sub CloseScreen(node as Object)
    if node = invalid OR (m.screenStack.Peek() <> invalid AND m.screenStack.Peek().IsSameNode(node))
        last = m.screenStack.Pop() ' remove screen from screenStack
        last.visible = false ' hide screen
        m.top.RemoveChild(last) ' remove screen from scene
  
        ' take previous screen and make it visible
        prev = m.screenStack.Peek()
        if prev <> invalid
            prev.visible = true
            prev.SetFocus(true)
        end if
    end if
  end sub

