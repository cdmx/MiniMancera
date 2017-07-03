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
            base.view = view
            
            addChild(view)
        }
    }
    
    //MARK: public
    
    func showBoard() -> VOptionWhistlesVsZombiesBoard
    {
        let animationFadeIn:SKAction = controller.model.actions.actionFadeIn
        let view:VOptionWhistlesVsZombiesBoard = VOptionWhistlesVsZombiesBoard(
            controller:controller)
        
        addChild(view)
        
        view.run(animationFadeIn)
        
        return view
    }
}
