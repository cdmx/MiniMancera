import SpriteKit

class COptionWhistlesVsZombies:ControllerGame<MOptionWhistlesVsZombies>
{
    private weak var editingBase:MOptionWhistlesVsZombiesBaseItem?
    
    private var scene:VOptionWhistlesVsZombiesScene?
    {
        get
        {
            guard
                
                let view:SKView = self.view as? SKView
                
            else
            {
                return nil
            }
            
            let scene:VOptionWhistlesVsZombiesScene? = view.scene
                as? VOptionWhistlesVsZombiesScene
            
            return scene
        }
    }
    
    //MARK: public
    
    func editBase(editingBase:MOptionWhistlesVsZombiesBaseItem)
    {
        self.editingBase = editingBase
        scene?.menu.show()
    }
    
    func clearEditBase()
    {
        editingBase = nil
        scene?.menu.hide()
    }
    
    func selectWhistleEditBase(whistle:MOptionWhistlesVsZombiesMenuItem)
    {
        editingBase?.charged()
        editingBase = nil
        scene?.menu.hide()
    }
}
