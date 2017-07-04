import SpriteKit

class VOptionWhistlesVsZombiesScene:ViewGameScene<MOptionWhistlesVsZombies>
{
    required init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        super.init(controller:controller)
        physicsWorld.gravity = CGVector.zero
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private

    private func factoryNodes()
    {
        let model:MOptionWhistlesVsZombies = controller.model
        
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        let board:VOptionWhistlesVsZombiesBoard = VOptionWhistlesVsZombiesBoard(
            controller:controller)
        model.board.view = board
        
        addChild(background)
        factoryBases()
        
        addChild(board)
    }
    
    private func factoryBases()
    {
        let bases:[MOptionWhistlesVsZombiesWhistleBase] = controller.model.whistle.bases
        
        for base:MOptionWhistlesVsZombiesWhistleBase in bases
        {
            let view:VOptionWhistlesVsZombiesBase = VOptionWhistlesVsZombiesBase(
                controller:controller,
                model:base)
            base.viewBase = view
            
            addChild(view)
        }
    }
    
    //MARK: public
    
    func addWhistle(base:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
            
            let view:VOptionWhistlesVsZombiesWhistle = VOptionWhistlesVsZombiesWhistle(
                controller:controller,
                model:base)
        
        else
        {
            return
        }
        
        base.viewWhistle = view
        
        addChild(view)
    }
    
    func addSonicBoomRelease(model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        let view:VOptionWhistlesVsZombiesSonicBoomRelease = VOptionWhistlesVsZombiesSonicBoomRelease(
            controller:controller,
            model:model)
        model.viewRelease = view
        
        addChild(view)
    }
}
