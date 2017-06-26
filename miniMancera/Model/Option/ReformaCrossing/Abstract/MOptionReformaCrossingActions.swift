import SpriteKit

class MOptionReformaCrossingActions
{
    let kSpawn:String = "actionSpawn"
    
    init()
    {
        let actionSpawnFoe:SKAction = SKAction.run(spawnFoe)
        let actionDelay:SKAction = SKAction.wait(forDuration:kSpawnFoeRate)
        let actions:[SKAction] = [
            actionSpawnFoe,
            actionDelay]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        let actionRepeat:SKAction = SKAction.repeatForever(actionsSequence)
        
        run(actionRepeat, withKey:kActionSpawn)
    }
}
