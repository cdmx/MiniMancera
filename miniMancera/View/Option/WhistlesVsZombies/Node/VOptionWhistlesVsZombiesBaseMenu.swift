import SpriteKit

class VOptionWhistlesVsZombiesBaseMenu:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private let kAlpha:CGFloat = 0.8
    
    init(controller:COptionWhistlesVsZombies)
    {
        let backgroundColour:UIColor = UIColor(white:0, alpha:kAlpha)
        let size:CGSize = controller.model.size
        
        super.init(texture:nil, color:backgroundColour, size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
