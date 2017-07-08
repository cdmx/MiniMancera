import UIKit

class VOptionWhistlesVsZombiesPoints:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var modelZombie:MOptionWhistlesVsZombiesZombieItem?
    private let kWidth:CGFloat = 140
    private let kHeight:CGFloat = 50
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        modelZombie:MOptionWhistlesVsZombiesZombieItem)
    {
        self.modelZombie = modelZombie
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
        
            let viewZombie:VOptionWhistlesVsZombiesZombie = modelZombie?.view
        
        else
        {
            return
        }
        
        position = viewZombie.position
    }
}
