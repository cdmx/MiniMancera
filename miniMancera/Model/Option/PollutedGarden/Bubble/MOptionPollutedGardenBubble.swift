import UIKit

class MOptionPollutedGardenBubble:MGameUpdate<MOptionPollutedGarden>
{
    private(set) var items:[MOptionPollutedGardenBubbleItem]
    private var itemTypes:[MOptionPollutedGardenBubbleItemType]!
    private var countTypes:UInt32
    private var lastSpawn:TimeInterval
    private let maxX:CGFloat
    private let maxY:CGFloat
    private let kAddYPos:CGFloat = 150
    private let kSpawnRate:TimeInterval = 0.1
    private let kSpawnProbability:UInt32 = 15
    
    override init()
    {
        let sceneSize:CGSize = MGame.sceneSize
        maxX = sceneSize.width
        maxY = sceneSize.height + kAddYPos
        items = []
        countTypes = 0
        lastSpawn = 0
        
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        for item:MOptionPollutedGardenBubbleItem in items
        {
            item.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
        
        trySpawn(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: private
    
    private func trySpawn(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        let deltaSpawn:TimeInterval = abs(elapsedTime - lastSpawn)
        
        if deltaSpawn > kSpawnRate
        {
            lastSpawn = elapsedTime
            let spawn:Bool = shouldSpawn()
            
            if spawn
            {
                spawnBubble(scene:scene)
            }
        }
    }
    
    private func spawnBubble(scene:ViewGameScene<MOptionPollutedGarden>)
    {
        let type:MOptionPollutedGardenBubbleItemType = randomType()
        let position:CGPoint = randomPosition(texture:type.texture)
        let item:MOptionPollutedGardenBubbleItem = MOptionPollutedGardenBubbleItem(
            type:type,
            position:position)
        items.append(item)
        
        guard
        
            let scene:VOptionPollutedGardenScene = scene as? VOptionPollutedGardenScene
        
        else
        {
            return
        }
    }
    
    private func shouldSpawn() -> Bool
    {
        let random:UInt32 = arc4random_uniform(kSpawnProbability)
        let spawn:Bool = random == 0
        
        return spawn
    }
    
    private func randomType() -> MOptionPollutedGardenBubbleItemType
    {
        let random:UInt32 = arc4random_uniform(countTypes)
        let randomInt:Int = Int(random)
        let type:MOptionPollutedGardenBubbleItemType = itemTypes[randomInt]
        
        return type
    }
    
    private func randomPosition(texture:MGameTexture) -> CGPoint
    {
        let width:CGFloat = texture.width
        let width_2:CGFloat = texture.width_2
        let remainWidth:UInt32 = UInt32(maxX - width)
        let randomX:UInt32 = arc4random_uniform(remainWidth)
        let randomXFloat:CGFloat = CGFloat(randomX)
        let positionX:CGFloat = randomXFloat + width_2
        let position:CGPoint = CGPoint(x:positionX, y:maxY)
        
        return position
    }
    
    //MARK: public
    
    func createTypes(textures:MOptionPollutedGardenTextures)
    {
        itemTypes = MOptionPollutedGardenBubble.factoryBubbles(
            textures:textures)
        countTypes = UInt32(itemTypes.count)
    }
}
