import SpriteKit

class VOptionWhistlesVsZombiesBoardWhistle:ViewGameNodeTouch<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesWhistleType!
    private weak var animationOutIn:SKAction!
    private let positionY:CGFloat
    private let kTitleFontSize:CGFloat = 20
    private let kDescrFontSize:CGFloat = 14
    private let kLabelsPositionX:CGFloat = -50
    private let kTitlePositionY:CGFloat = 0
    private let kDescrPositionY:CGFloat = -20
    
    init?(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesWhistleType,
        positionY:CGFloat)
    {
        guard
            
            let texture:MGameTexture = model.textureBoard
        
        else
        {
            return nil
        }
        
        animationOutIn = controller.model.actions.actionFadeOutIn
        self.model = model
        self.positionY = positionY
        super.init(
            controller:controller,
            texture:texture)
        addTitle()
        addDescr()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        position = CGPoint(x:0, y:positionY)
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        run(animationOutIn)
    }
    
    //MARK: private
    
    private func addTitle()
    {
        guard
            
            let title:String = model.titleBoard
            
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
            
            let descr:String = model.descrBoard
            
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
