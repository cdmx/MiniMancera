import SpriteKit

class ViewGameNodeGameOverInfo:SKSpriteNode
{
    private let orientation:UIInterfaceOrientation
    private let kAddPositionY:CGFloat = -100
    private let kHeight:CGFloat = 50
    private let kTitlePositionY:CGFloat = 5
    private let kDescrPositionY:CGFloat = -10
    private let kFontTitleSize:CGFloat = 20
    private let kFontDescrSize:CGFloat = 12
    
    init(
        title:String,
        descr:String,
        zPosition:CGFloat,
        orientation:UIInterfaceOrientation = UIInterfaceOrientation.portrait)
    {
        self.orientation = orientation
        
        let width:CGFloat
        
        if orientation == UIInterfaceOrientation.portrait || orientation == UIInterfaceOrientation.portraitUpsideDown
        {
            width = MGame.sceneSize.width
        }
        else
        {
            width = MGame.sceneSize.height
        }
        
        let size:CGSize = CGSize(width:width, height:kHeight)
        
        super.init(
            texture:nil,
            color:UIColor.clear,
            size:size)
        self.zPosition = zPosition
        positionStart()
        factoryTitle(title:title)
        factoryDescr(descr:descr)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        let sceneSize:CGSize = orientationSceneSize()
        let width:CGFloat = sceneSize.width
        let height:CGFloat = sceneSize.height
        let width_2:CGFloat = width / 2.0
        let positionY:CGFloat = height + kAddPositionY
        position = CGPoint(x:width_2, y:positionY)
    }
    
    private func orientationSceneSize() -> CGSize
    {
        switch orientation
        {
        case UIInterfaceOrientation.portrait,
             UIInterfaceOrientation.portraitUpsideDown,
             UIInterfaceOrientation.unknown:
            
            return MGame.sceneSize
            
        case UIInterfaceOrientation.landscapeLeft,
             UIInterfaceOrientation.landscapeRight:
            
            let size:CGSize = CGSize(
                width:MGame.sceneSize.height,
                height:MGame.sceneSize.width)
            
            return size
        }
    }
    
    private func factoryTitle(title:String)
    {
        let label:SKLabelNode = SKLabelNode(text:title)
        label.fontName = UIFont.kFontBold
        label.fontSize = kFontTitleSize
        label.fontColor = SKColor.white
        label.zPosition = zPosition + 1
        label.position = CGPoint(x:0, y:kTitlePositionY)
        
        addChild(label)
    }
    
    private func factoryDescr(descr:String)
    {
        let label:SKLabelNode = SKLabelNode(text:descr)
        label.fontName = UIFont.kFontBold
        label.fontSize = kFontDescrSize
        label.fontColor = SKColor.white
        label.zPosition = zPosition + 1
        label.position = CGPoint(x:0, y:kDescrPositionY)
        
        addChild(label)
    }
}
