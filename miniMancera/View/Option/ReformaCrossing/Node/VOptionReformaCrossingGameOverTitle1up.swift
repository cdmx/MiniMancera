import SpriteKit

class VOptionReformaCrossingGameOverTitle1up:SKLabelNode
{
    private let kPositionY:CGFloat = 180
    private let kFontSize:CGFloat = 12
    
    override init()
    {
        super.init()
        text = String.localizedReformaCrossing(key:"VOptionReformaCrossingGameOverTitle1up_label")
        fontName = UIFont.kFontRegular
        fontSize = kFontSize
        fontColor = SKColor.white
        zPosition = MOptionReformaCrossingZPosition.GameOverTitle1up.rawValue
        
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
