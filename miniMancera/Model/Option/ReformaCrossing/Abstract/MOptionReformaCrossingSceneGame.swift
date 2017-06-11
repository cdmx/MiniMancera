import SpriteKit

class MOptionReformaCrossingSceneGame:SKScene
{
    private weak var model:MOptionReformaCrossing!
    private let player:MOptionReformaCrossingPlayer
    private let kSpawnFoeRate:TimeInterval = 1
    
    init(model:MOptionReformaCrossing)
    {
        self.model = model
        player = MOptionReformaCrossingPlayer(sceneSize:model.size)
        
        super.init(size:model.size)
        backgroundColor = SKColor.black
        
        let background:MOptionReformaCrossingBackground = MOptionReformaCrossingBackground(
            size:size)
        
        addChild(background)
        addChild(player)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        let actionSpawnFoe:SKAction = SKAction.run(spawnFoe)
        let actionDelay:SKAction = SKAction.wait(forDuration:kSpawnFoeRate)
        let actions:[SKAction] = [
            actionSpawnFoe,
            actionDelay]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        let actionRepeat:SKAction = SKAction.repeatForever(actionsSequence)
        
        run(actionRepeat)
    }
    
    //MARK: private
    
    private func spawnFoe()
    {
        let lane:MOptionReformaCrossingLaneProtocol = model.lane.randomLane()
        let foe:MOptionReformaCrossingFoe = MOptionReformaCrossingFoe.randomFoe(
            lane:lane,
            sceneSize:model.size)
        
        addChild(foe)
    }
}
