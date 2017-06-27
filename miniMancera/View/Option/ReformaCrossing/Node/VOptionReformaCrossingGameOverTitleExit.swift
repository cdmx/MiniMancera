import SpriteKit

class VOptionReformaCrossingGameOverTitleExit:SKLabelNode
{
    private let kPositionY:CGFloat = 80
    private let kFontSize:CGFloat = 12
    
    override init()
    {
        super.init()
        text = String.localizedReformaCrossing(key:"VOptionReformaCrossingGameOverTitleExit_label")
        fontName = UIFont.kFontRegular
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionReformaCrossingZPosition.GameOverTitleExit.rawValue
        
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
