import SpriteKit

class VOptionWhistlesVsZombiesMenuWhistle:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private weak var modelMenu:MOptionWhistlesVsZombiesMenu!
    private weak var model:MOptionWhistlesVsZombiesMenuItem!
    private let kTitleFontSize:CGFloat = 20
    private let kDescrFontSize:CGFloat = 14
    private let kLabelsPositionX:CGFloat = -50
    private let kTitlePositionY:CGFloat = 0
    private let kDescrPositionY:CGFloat = -20
    
    init(
        controller:COptionWhistlesVsZombies,
        modelMenu:MOptionWhistlesVsZombiesMenu,
        model:MOptionWhistlesVsZombiesMenuItem)
    {
        self.controller = controller
        self.modelMenu = modelMenu
        self.model = model
        
        super.init(texture:model.texture, color:UIColor.clear, size:model.textureSize)
        position = CGPoint(x:model.positionX, y:model.positionY)
        isUserInteractionEnabled = true
        
        addTitle()
        addDescr()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        run(modelMenu.whistleActionAnimation)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.selectWhistleForBase(whistle:model)
    }
    
    //MARK: private
    
    private func addTitle()
    {
        guard
            
            let title:String = model.title
        
        else
        {
            return
        }
        
        let label:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontBold)
        label.text = title
        label.fontSize = kTitleFontSize
        label.fontColor = SKColor.white
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        label.position = CGPoint(x:kLabelsPositionX, y:kTitlePositionY)
        
        addChild(label)
    }
    
    private func addDescr()
    {
        guard
            
            let descr:String = model.descr
            
        else
        {
            return
        }
        
        let label:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontRegular)
        label.text = descr
        label.fontSize = kDescrFontSize
        label.fontColor = SKColor.white
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        label.position = CGPoint(x:kLabelsPositionX, y:kDescrPositionY)
        
        addChild(label)
    }
}
