import SpriteKit

class VOptionWhistlesVsZombiesMenu:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private let animationAppear:SKAction
    private let animationDisappear:SKAction
    private let kAlpha:CGFloat = 0.8
    
    init(controller:COptionWhistlesVsZombies)
    {
        let backgroundColour:UIColor = UIColor(white:0, alpha:kAlpha)
        let size:CGSize = controller.model.size
        animationAppear = VOptionWhistlesVsZombiesMenu.factoryAnimationAppear()
        animationDisappear = VOptionWhistlesVsZombiesMenu.factoryAnimationDisappear()
        
        super.init(texture:nil, color:backgroundColour, size:size)
        alpha = 0
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
