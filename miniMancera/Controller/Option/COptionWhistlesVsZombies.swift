import SpriteKit

class COptionWhistlesVsZombies:ControllerGame
{
    private weak var editingBase:MOptionWhistlesVsZombiesBaseItem?
    
    //MARK: public
    
    func editBase(editingBase:MOptionWhistlesVsZombiesBaseItem)
    {
        self.editingBase = editingBase
//        scene?.menu.show()
    }
    
    func clearEditBase()
    {
        editingBase = nil
//        scene?.menu.hide()
    }
    
    func selectWhistleEditBase(whistle:MOptionWhistlesVsZombiesMenuItem)
    {
        editingBase?.charged()
        editingBase = nil
//        scene?.menu.hide()
    }
}
