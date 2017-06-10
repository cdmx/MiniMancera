import UIKit

class MHome
{
    let actions:[MHomeProtocol]
    private(set) var items:[MHomeItem]
    private weak var controller:CHome?
    
    init()
    {
        let actionDelete:MHomeDelete = MHomeDelete()
        let actionEdit:MHomeEdit = MHomeEdit()
        let actionShare:MHomeShare = MHomeShare()
        
        items = []
        actions = [
            actionDelete,
            actionEdit,
            actionShare]
    }
    
    //MARK: private
    
    private func asyncReload()
    {
        DManager.sharedInstance?.fetchData(
            entityName:DNote.entityName)
        { [weak self] (data) in
            
            guard
            
                let notes:[DNote] = data as? [DNote]
            
            else
            {
                self?.notesLoaded()
                
                return
            }
            
            self?.parseNotes(notes:notes)
        }
    }
    
    private func parseNotes(notes:[DNote])
    {
        let backgrounds:[MCreateBackgroundProtocol] = MCreate.factoryBackground()
        let fonts:MCreateFont = MCreateFont()
        var items:[MHomeItem] = []
        
        for note:DNote in notes
        {
            let selectedBackground:Int = Int(note.selectedBackground)
            let selectedFont:Int = Int(note.selectedFont)
            let fontSize:CGFloat = CGFloat(note.fontSize)
            let background:MCreateBackgroundProtocol = backgrounds[selectedBackground]
            let fontItem:MCreateFontItem = fonts.fonts[selectedFont]
            
            let item:MHomeItem = MHomeItem(
                note:note,
                background:background,
                fontItem:fontItem,
                fontSize:fontSize)
            items.append(item)
        }
        
        items.sort
        { (itemA:MHomeItem, itemB:MHomeItem) -> Bool in
            
            return itemA.note.created > itemB.note.created
        }
        
        self.items = items
        
        notesLoaded()
    }
    
    private func notesLoaded()
    {
        controller?.notesLoaded()
    }
    
    private func asyncDeleteNote(item:MHomeItem)
    {
        DManager.sharedInstance?.delete(data:item.note)
        { [weak self] in
            
            DManager.sharedInstance?.save()
            self?.asyncReload()
        }
    }
    
    //MARK: public
    
    func reload(controller:CHome)
    {
        self.controller = controller
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncReload()
        }
    }
    
    func deleteNote(controller:CHome, item:MHomeItem)
    {
        self.controller = controller
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.asyncDeleteNote(item:item)
        }
    }
}
