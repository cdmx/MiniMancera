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
        backgroundColor = SKColor.black
        player.position = CGPoint(x:100, y:100)
        
        addChild(player)
    }
}
