import SpriteKit

class ViewGameNodeGameOverTitleExit:SKLabelNode
{
    private let orientation:UIInterfaceOrientation
    private let kPositionY:CGFloat = 80
    private let kFontSize:CGFloat = 12
    
    init(
        text:String,
        zPosition:CGFloat,
        orientation:UIInterfaceOrientation = UIInterfaceOrientation.portrait)
    {
        self.orientation = orientation
        
        super.init()
        self.text = text
        self.zPosition = zPosition
        fontName = UIFont.kFontRegular
        fontSize = kFontSize
        fontColor = SKColor.white
        
        positionStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        let width:CGFloat = orientationSceneWidth()
        let width_2:CGFloat = width / 2.0
        
        position = CGPoint(x:width_2, y:kPositionY)
    }
    
    private func orientationSceneWidth() -> CGFloat
    {
        switch orientation
        {
        case UIInterfaceOrientation.portrait,
             UIInterfaceOrientation.portraitUpsideDown,
             UIInterfaceOrientation.unknown:
            
            return MGame.sceneSize.width
            
        case UIInterfaceOrientation.landscapeLeft,
             UIInterfaceOrientation.landscapeRight:
            
            return MGame.sceneSize.height
        }
    }
}
