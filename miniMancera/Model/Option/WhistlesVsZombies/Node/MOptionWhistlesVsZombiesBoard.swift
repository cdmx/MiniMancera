import SpriteKit

class MOptionWhistlesVsZombiesBoard
{
    weak var view:VOptionWhistlesVsZombiesBoard!
    
    //MARK: public
    
    func show(model:MOptionWhistlesVsZombies)
    {
        let animation:SKAction = model.actions.actionFadeIn
        view.run(animation)
    }
    
    func hide(model:MOptionWhistlesVsZombies)
    {
        let animation:SKAction = model.actions.actionFadeOut
        view.run(animation)
    }
}
