sub Init()
    'for creating a place for the content
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    'parsing the feed 
    file = CreateObject("roSGNode", "FileSection")
        if file.Open("pkg:/addvideos/source/json/questions.json") then
            fileContent = file.ReadFullContent()
            file.Close()
            if fileContent <> invalid then 
                jsonContent = ParseJson(fileContent)
            else
                print "Error parsing file"
            end if
        else
            print "Error opening file"
        end if
    rootChildren = []
    rows = {}
    value = json.Lookup(jsonContent)
    row = {}
    row.questions = value
    row.children = []
    itemData = GetItemData(value)
    row.children.Push(itemData)
    contentNode = Createobject("roSGNode", "ContentNode")
    m.top.content = contentNode
end sub
function GetItemData(video as Object) as Object
    item = {}
    ' populate some standard content metadata fields to put stuff on our content
    item.question = video.question
    item.options = video.options
    item.answer = video.answer
    return item
end function