import UIKit

class MCreate
{
    let content:[MCreateContentProtocol]
    let font:MCreateFont
    let backgrounds:[MCreateBackgroundProtocol]
    var frames:[MCreateFrame]
    var selectedFrame:Int
    var selectedBackground:Int
    private weak var controller:CCreate?
    
    private class func factoryContent() -> [MCreateContentProtocol]
    {
        let contentTimeline:MCreateContentTimeline = MCreateContentTimeline()
        let contentCard:MCreateContentCard = MCreateContentCard()
        let contentDuration:MCreateContentDuration = MCreateContentDuration()
        let contentFontName:MCreateContentFontName = MCreateContentFontName()
        let contentFontSize:MCreateContentFontSize = MCreateContentFontSize()
        let contentBackground:MCreateContentBackground = MCreateContentBackground()
        
        let content:[MCreateContentProtocol] = [
            contentTimeline,
            contentCard,
            contentDuration,
            contentFontSize,
            contentFontName,
            contentBackground]
        
        return content
    }
    
    class func factoryBackground() -> [MCreateBackgroundProtocol]
    {
        let backgroundSweetDreams:MCreateBackgroundSweetDreams = MCreateBackgroundSweetDreams()
        let backgroundSevenSeas:MCreateBackgroundSevenSeas = MCreateBackgroundSevenSeas()
        let backgroundPurpleOrange:MCreateBackgroundPurpleOrange = MCreateBackgroundPurpleOrange()
        let backgroundPurpleGreen:MCreateBackgroundPurpleGreen = MCreateBackgroundPurpleGreen()
        let backgroundGreenOrange:MCreateBackgroundGreenOrange = MCreateBackgroundGreenOrange()
        let backgroundYellowGreen:MCreateBackgroundYellowGreen = MCreateBackgroundYellowGreen()
        let backgroundYellowOrange:MCreateBackgroundYellowOrange = MCreateBackgroundYellowOrange()
        let backgroundBlueNight:MCreateBackgroundBlueNight = MCreateBackgroundBlueNight()
        let backgroundShades:MCreateBackgroundShades = MCreateBackgroundShades()
        
        let background:[MCreateBackgroundProtocol] = [
            backgroundSweetDreams,
            backgroundSevenSeas,
            backgroundPurpleOrange,
            backgroundPurpleGreen,
            backgroundGreenOrange,
            backgroundYellowGreen,
            backgroundYellowOrange,
            backgroundBlueNight,
            backgroundShades]
        
        return background
    }
    
    init()
    {
        selectedFrame = 0
        selectedBackground = 0
        frames = []
        content = MCreate.factoryContent()
        backgrounds = MCreate.factoryBackground()
        font = MCreateFont()
        addFrame()
    }
    
    init(modelHomeItem:MHomeItem)
    {
        selectedFrame = 0
        selectedBackground = Int(modelHomeItem.note.selectedBackground)
        frames = modelHomeItem.editFrames()
        content = MCreate.factoryContent()
        backgrounds = MCreate.factoryBackground()
        font = MCreateFont()
        font.selectedFont = Int(modelHomeItem.note.selectedFont)
        font.fontSize = CGFloat(modelHomeItem.note.fontSize)
    }
    
    private func createFrames(note:DNote)
    {
        if frames.count > 0
        {
            let frame:MCreateFrame = frames.removeFirst()
            
            DManager.sharedInstance?.createData(
                entityName:DNoteFrame.entityName)
            { [weak self] (data) in
                
                guard
                
                    let noteFrame:DNoteFrame = data as? DNoteFrame
                
                else
                {
                    return
                }
                
                noteFrame.duration = frame.duration
                noteFrame.text = frame.text
                note.addToFrames(noteFrame)
                
                self?.createFrames(note:note)
            }
        }
        else
        {
            noteSaved()
        }
    }
    
    private func noteSaved()
    {
        DManager.sharedInstance?.save
        { [weak self] in
            
            self?.controller?.noteSaved()
        }
    }
    
    private func deletePreviousFrames(note:DNote)
    {
        guard
        
            let countFrames:Int = note.frames?.count
        
        else
        {
            return
        }
        
        if countFrames > 0
        {
            guard
            
                let noteFrame:DNoteFrame = note.frames?.lastObject as? DNoteFrame
            
            else
            {
                return
            }
            
            note.removeFromFrames(noteFrame)
            
            DManager.sharedInstance?.delete(data:noteFrame)
            { [weak self] in
                
                self?.deletePreviousFrames(note:note)
            }
        }
        else
        {
            createFrames(note:note)
        }
    }
    
    //MARK: public
    
    func addFrame()
    {
        let count:Int = frames.count
        let newFrame:MCreateFrame = MCreateFrame()
        frames.append(newFrame)
        selectedFrame = count
    }
    
    func selectedFrameModel() -> MCreateFrame
    {
        let item:MCreateFrame = frames[selectedFrame]
        
        return item
    }
    
    func selectedBackgroundModel() -> MCreateBackgroundProtocol
    {
        let background:MCreateBackgroundProtocol = backgrounds[selectedBackground]
        
        return background
    }
    
    func save(controller:CCreate)
    {
        self.controller = controller
        
        let created:TimeInterval = Date().timeIntervalSince1970
        
        DManager.sharedInstance?.createData(
            entityName:DNote.entityName)
        { [weak self] (data) in
            
            guard
            
                let note:DNote = data as? DNote,
                let font:MCreateFont = self?.font,
                let selectedBackground:Int = self?.selectedBackground
            
            else
            {
                return
            }
            
            note.created = created
            note.fontSize = Float(font.fontSize)
            note.selectedFont = Int16(font.selectedFont)
            note.selectedBackground = Int16(selectedBackground)
            
            self?.createFrames(note:note)
        }
    }
    
    func saveEdition(controller:CCreate, note:DNote)
    {
        self.controller = controller
        note.fontSize = Float(font.fontSize)
        note.selectedFont = Int16(font.selectedFont)
        note.selectedBackground = Int16(selectedBackground)
        deletePreviousFrames(note:note)
    }
}
