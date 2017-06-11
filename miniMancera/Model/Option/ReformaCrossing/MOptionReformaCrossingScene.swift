import SpriteKit

class MOptionReformaCrossingScene:SKScene
{
    let player:MOptionReformaCrossingPlayer
    
    override init(size:CGSize)
    {
        player = MOptionReformaCrossingPlayer(imageNamed:"assetReformaCrossingPlayer0")
        
        super.init(size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        backgroundColor = SKColor.white
        player.position = CGPoint(x:view.bounds.size.width / 2, y:view.bounds.size.height / 2)
        
        addChild(player)
        
    }
}
