import UIKit

class MHomeItem
{
    let note:DNote
    let background:MCreateBackgroundProtocol
    let duration:TimeInterval
    private let fontItem:MCreateFontItem
    private let fontSize:CGFloat
    
    init(
        note:DNote,
        background:MCreateBackgroundProtocol,
        fontItem:MCreateFontItem,
        fontSize:CGFloat)
    {
        self.note = note
        self.background = background
        self.fontItem = fontItem
        self.fontSize = fontSize
        
        var duration:TimeInterval = 0
        
        if let noteFrames:[DNoteFrame] = note.frames?.array as? [DNoteFrame]
        {
            for noteFrame:DNoteFrame in noteFrames
            {
                duration += noteFrame.duration
            }
        }
        
        self.duration = duration
    }
    
    //MARK: public
    
    func font() -> UIFont
    {
        let currentFont = fontItem.font(size:fontSize)
        
        return currentFont
    }
    
    func editFrames() -> [MCreateFrame]
    {
        var frames:[MCreateFrame] = []
        
        guard
        
            let noteFrames:[DNoteFrame] = note.frames?.array as? [DNoteFrame]
        
        else
        {
            return frames
        }
        
        for noteFrame:DNoteFrame in noteFrames
        {
            let frame:MCreateFrame = MCreateFrame(noteFrame:noteFrame)
            frames.append(frame)
        }
        
        return frames
    }
}
