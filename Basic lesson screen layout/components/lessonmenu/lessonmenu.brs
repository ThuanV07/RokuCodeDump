

sub Init()
  'Initialize main menu components
  m.test = m.top.findNode("test")
  m.MMImage       = m.top.findNode("MMImage")
  m.background  = m.top.findNode("Background")
  m.ButtonGroup = m.top.findNode("ButtonGroup")
  m.Details     = m.top.findNode("Details")
  m.Title       = m.top.findNode("Title")
  m.Video       = m.top.findNode("Video")
  m.Warning     = m.top.findNode("WarningDialog")
  m.Exiter      = m.top.findNode("Exiter")
  'initialize text screen components 
  m.pg1 = m.top.findNode("pg1")
  m.pg2 = m.top.findNode("pg2")
  m.textscreenbg = m.top.findNode("textscreenbg")
  setContent() 'video
  m.ButtonGroup.setFocus(true) 'menuing
  m.ButtonGroup.observeField("buttonSelected","onButtonSelected")
  InitScreenStack()
  

 ' m.screenStack = [] intialize screen stack Code currently doesn't work
end sub



sub onButtonSelected()
  'Play the video when the first button is selected
  if m.ButtonGroup.buttonSelected = 0
    m.Video.visible = "true"
    m.Video.control = "play"
    m.Video.setFocus(true)
  
  else if m.ButtonGroup.buttonSelected = 1
    hidemainmenu()
    displaytextscreen()

  else if m.ButtonGroup.buttonSelected = 2
    'display the quiz screen
    hidemainmenu()

  else
    'Exit button pressed'
    m.Exiter.control = "RUN"
  end if
end sub



'Set your information here
sub setContent()

  'Change the image
  'ContentNode = CreateObject("roSGNode", "ContentNode")
  'ContentNode.streamFormat = "mp4"

  m.MMImage.uri = "pkg:/images/placeholder.png"
  ContentNode = CreateObject("roSGNode", "ContentNode")
  ContentNode.streamFormat = "mp4"
  ContentNode.url = "https://video.ted.com/talks/podcast/DanGilbert_2004_480.mp4"
  ContentNode.ShortDescriptionLine1 = "Can we create new life out of our digital universe?"
  ContentNode.Description = "Lesson Description"
  ContentNode.StarRating = 80
  ContentNode.Length = 1972
  ContentNode.Title = "Spanish video name"
  ContentNode.subtitleConfig = {Trackname: "pkg:/source/CraigVenter.srt" }



  m.Video.content = ContentNode

  'Change the buttons
  Buttons = ["Play Video", "Text Version", "Practice", "Exit to Other Lessons"]
  m.ButtonGroup.buttons = Buttons

  
  m.Title.text = "Spanish Lesson #"
  m.Details.text =  "You will learn the basics of Spanish beginning with the alphabet and simple phrases in this lesson"

end sub

'switch to the video screen when the practice button is pressed

' Called when a key on the remote is pressed
function onKeyEvent(key as String, press as Boolean) as Boolean
  print "in SimpleVideoScene.xml onKeyEvent ";key;" "; press
  if press then
    if key = "back"
      print "------ [back pressed] ------"
      if m.Warning.visible
        m.Warning.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      else if m.Video.visible
        m.Video.control = "stop"
        m.Video.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      else if m.pg1.visible
        showmainmenu()
        hidetextscreen()
        m.ButtonGroup.setFocus(true)
        return true
      else if not m.MMImage.visible
        showmainmenu()
        return true
      else
        return false
      end if
    else if key = "OK"
      print "------- [ok pressed] -------"
      if m.Warning.visible
        m.Warning.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      end if
    else if key = "instantreplay"
      print "------- [instant replay pressed] -------"
    else
      return false
    end if
  end if
  return false
end function






function GetCurrentScreen()
  return m.screenStack.Peek()
end function

sub hidemainmenu()
  m.MMimage.visible = "false"
  m.ButtonGroup.visible = "false"
  m.Details.visible = "false"
  m.Title.visible = "false"
  m.background.visible = "false"
end sub

sub showmainmenu()
  m.MMimage.visible = "true"
  m.ButtonGroup.visible = "true"
  m.Details.visible = "true"
  m.Title.visible = "true"
  m.background.visible = "true"
  
end sub


sub displaytextscreen()
  m.pg1.visible = "true"
  m.pg2.visible = "true"
  m.textscreenbg.visible = "true"
end sub

sub hidetextscreen()
  m.pg1.visible = "false"
  m.pg2.visible = "false"
  m.textscreenbg.visible = "false"
end sub

sub displayquizscreen()

end sub

sub hidequizscreen()

end sub