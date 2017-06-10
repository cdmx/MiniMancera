import Foundation

class MCreateFrame
{
    var text:String
    var duration:TimeInterval
    let selected:MCreateSelected
    private let kDefaultDuration:TimeInterval = 5
    
    init()
    {
        text = NSLocalizedString("MCreateFrame_defaultText", comment:"")
        duration = kDefaultDuration
        selected = MCreateSelected()
    }
    
    init(noteFrame:DNoteFrame)
    {
        if let text:String = noteFrame.text
        {
            self.text = text
        }
        else
        {
            text = NSLocalizedString("MCreateFrame_defaultText", comment:"")
        }
        
        duration = noteFrame.duration
        selected = MCreateSelected()
    }
}
