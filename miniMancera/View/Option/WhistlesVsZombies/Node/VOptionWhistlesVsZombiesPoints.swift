import SpriteKit

class VOptionWhistlesVsZombiesPoints:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var modelZombie:MOptionWhistlesVsZombiesZombieItem?
    private weak var fadeAnimation:SKAction!
    private let kWidth:CGFloat = 100
    private let kHeight:CGFloat = 50
    private let kAddPositionY:CGFloat = 20
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        modelZombie:MOptionWhistlesVsZombiesZombieItem)
    {
        self.modelZombie = modelZombie
        fadeAnimation = controller.model.actions.actionFadeOut
        let size:CGSize = CGSize(
            width:kWidth,
            height:kHeight)
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionWhistlesVsZombiesZPosition.Points.rawValue)
        
        let coin:VOptionWhistlesVsZombiesPointsCoin = VOptionWhistlesVsZombiesPointsCoin(
            controller:controller)
        
        let amount:VOptionWhistlesVsZombiesPointsAmount = VOptionWhistlesVsZombiesPointsAmount(
            amount:modelZombie.type.coins)
        
        addChild(coin)
        addChild(amount)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
        
            let zombiePosition:CGPoint = modelZombie?.view?.position
        
        else
        {
            return
        }
        
        let positionX:CGFloat = zombiePosition.x
        let positionY:CGFloat = zombiePosition.y + kAddPositionY
        
        position = CGPoint(x:positionX, y:positionY)
    }
    
    //MARK: public
    
    func fade()
    {
        run(fadeAnimation)
    }
    
    func finished()
    {
        removeAllActions()
        removeFromParent()
    }
}
