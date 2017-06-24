import SpriteKit

class VOptionWhistlesVsZombiesMenu:SKSpriteNode
{
    private(set) weak var controller:COptionWhistlesVsZombies!
    private(set) weak var model:MOptionWhistlesVsZombiesMenu!
    private let animationAppear:SKAction
    private let animationDisappear:SKAction
    private let kAlpha:CGFloat = 0.85
    
    init(controller:COptionWhistlesVsZombies)
    {
        self.controller = controller
        model = controller.model.menu
        let backgroundColour:UIColor = UIColor(white:0, alpha:kAlpha)
        let size:CGSize = controller.model.size
        animationAppear = VOptionWhistlesVsZombiesMenu.factoryAnimationAppear()
        animationDisappear = VOptionWhistlesVsZombiesMenu.factoryAnimationDisappear()
        
        super.init(texture:nil, color:backgroundColour, size:size)
        alpha = 0
        position = model.position
        zPosition = MOptionWhistlesVsZombiesZPosition.Menu.rawValue
        isUserInteractionEnabled = true
        
        let labelTitle:SKLabelNode = VOptionWhistlesVsZombiesMenu.factoryTitle(menuSize:size)
        
        let menuCancel:VOptionWhistlesVsZombiesMenuCancel = VOptionWhistlesVsZombiesMenuCancel(
            controller:controller)
        
        addChild(labelTitle)
        addChild(menuCancel)
        
        factoryWhistles()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.clearEditBase()
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
