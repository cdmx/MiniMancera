import SpriteKit

class VOptionWhistlesVsZombiesScene:ViewGame<MOptionWhistlesVsZombies, COptionWhistlesVsZombies>
{
    override init(controller:COptionWhistlesVsZombies)
    {
        super.init(controller:controller)
        
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        addChild(background)
        
        addBase()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func addBase()
    {
        let items:[MOptionWhistlesVsZombiesBaseItem] = controller.model.base.items
        
        for item:MOptionWhistlesVsZombiesBaseItem in items
        {
            let viewItem:VOptionWhistlesVsZombiesBase = VOptionWhistlesVsZombiesBase(
                controller:controller,
                model:item)
            
            addChild(viewItem)
        }
    }
}
