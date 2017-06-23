import SpriteKit

class VOptionWhistlesVsZombiesMenu:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private let animationAppear:SKAction
    private let animationDisappear:SKAction
    private let kAlpha:CGFloat = 0.7
    
    init(controller:COptionWhistlesVsZombies)
    {
        let backgroundColour:UIColor = UIColor(white:0, alpha:kAlpha)
        let size:CGSize = controller.model.size
        animationAppear = VOptionWhistlesVsZombiesMenu.factoryAnimationAppear()
        animationDisappear = VOptionWhistlesVsZombiesMenu.factoryAnimationDisappear()
        
        let model:MOptionWhistlesVsZombiesMenu = controller.model.menu
        
        super.init(texture:nil, color:backgroundColour, size:size)
        alpha = 0
        position = model.position
        zPosition = MOptionWhistlesVsZombiesZPosition.Menu.rawValue
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        hide()
    }
    
    //MARK: public
    
    func show()
    {
        run(animationAppear)
    }
    
    func hide()
    {
        run(animationDisappear)
    }
}
