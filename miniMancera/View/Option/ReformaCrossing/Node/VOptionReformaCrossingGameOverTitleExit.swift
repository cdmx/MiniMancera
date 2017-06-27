import SpriteKit

class VOptionReformaCrossingGameOverTitleExit:SKLabelNode
{
    private let kPositionY:CGFloat = 80
    private let kFontSize:CGFloat = 12
    
    init(model:MOptionReformaCrossingGameOverProtocol)
    {
        super.init()
        text = model.title
        fontName = UIFont.kFontRegular
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionReformaCrossingZPosition.GameOverTitle.rawValue
        
        positionStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func positionStart()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let width_2:CGFloat = sceneSize.width / 2.0
        
        position = CGPoint(x:width_2, y:kPositionY)
    }
}
