import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloor
{
    let maxPositionX:CGFloat
    let finalLine:CGFloat
    private(set) weak var textures:MOptionTamalesOaxaquenosTextures!
    private(set) var items:[MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    private(set) var currentPositionX:CGFloat
    private var strategy:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol!
    private let itemWidth_2:CGFloat
    private let kFinalLineLength:CGFloat = 1200
    private let kItemWidth:CGFloat = 32
    private let kTotalGroundTextures:UInt32 = 4
    private let kTotalGrassTextures:UInt32 = 4
    private let kTotalHillTextures:UInt32 = 4
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        self.textures = textures
        
        let areaLength:CGFloat = MOptionTamalesOaxaquenosArea.kAreaWidth
        
        items = []
        itemWidth_2 = kItemWidth / 2.0
        currentPositionX = itemWidth_2
        maxPositionX = areaLength + itemWidth_2
        finalLine = areaLength - kFinalLineLength
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyInitial(
            model:self)
    }
    
    //MARK: private
    
    private func randomGroundTexture() -> MGameTexture
    {
        let random:UInt32 = arc4random_uniform(kTotalGroundTextures)
        
        switch random
        {
        case 0:
            
            return textures.ground0
            
        case 1:
            
            return textures.ground1
            
        case 2:
            
            return textures.ground2
            
        default:
            
            return textures.ground3
        }
    }
    
    private func randomGrassTexture() -> MGameTexture
    {
        let random:UInt32 = arc4random_uniform(kTotalGrassTextures)
        
        switch random
        {
        case 0:
            
            return textures.grass0
            
        case 1:
            
            return textures.grass1
            
        case 2:
            
            return textures.grass2
            
        default:
            
            return textures.grass3
        }
    }
    
    private func randomHillTexture(
        textures:MOptionTamalesOaxaquenosTextures) -> MGameTexture
    {
        let random:UInt32 = arc4random_uniform(kTotalHillTextures)
        
        switch random
        {
        case 0:
            
            return textures.hill0
            
        case 1:
            
            return textures.hill1
            
        case 2:
            
            return textures.hill2
            
        default:
            
            return textures.hill3
        }
    }
    
    //MARK: public
    
    func floorItems() -> [MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    {
        while currentPositionX < maxPositionX
        {
            let item:MOptionTamalesOaxaquenosAreaFloorItemProtocol = strategy.factoryItem()
            items.append(item)
            
            currentPositionX += kItemWidth
        }
        
        return items
    }
    
    func strategyRegular()
    {
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyRegular(
            model:self)
    }
    
    func strategyHill()
    {
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyHill(
            model:self)
    }
    
    func strategyGullyStart()
    {
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyGullyStart(
            model:self)
    }
    
    func strategyGullyHole()
    {
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyGullyHole(
            model:self)
    }
    
    func strategyGullyEnd()
    {
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyGullyEnd(
            model:self)
    }
    
    func strategyFinal()
    {
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyFinal(
            model:self)
    }
    
    func factoryItemGrass() -> MOptionTamalesOaxaquenosAreaFloorItemGroundGrass
    {
        let textureGround:MGameTexture = randomGroundTexture()
        let textureGrass:MGameTexture = randomGrassTexture()
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass = MOptionTamalesOaxaquenosAreaFloorItemGroundGrass(
            textureGround:textureGround,
            textureGrass:textureGrass,
            positionX:currentPositionX)
        
        return item
    }
    
    func factoryItemHill(height:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemGroundHill
    {
        let textureGround:MGameTexture = randomGroundTexture()
        let textureHill:MGameTexture = randomHillTexture(textures:textures)
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundHill = MOptionTamalesOaxaquenosAreaFloorItemGroundHill(
            textureGround:textureGround,
            textureHill:textureHill,
            hillHeight:height,
            positionX:currentPositionX)
        
        return item
    }
    
    func factoryItemGullyStart() -> MOptionTamalesOaxaquenosAreaFloorItemGroundGullyStart
    {
        let textureGround:MGameTexture = randomGroundTexture()
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGullyStart = MOptionTamalesOaxaquenosAreaFloorItemGroundGullyStart(
            textureGround:textureGround,
            positionX:currentPositionX)
        
        return item
    }
    
    func factoryItemGullyHole() -> MOptionTamalesOaxaquenosAreaFloorItemGullyHole
    {
        let item:MOptionTamalesOaxaquenosAreaFloorItemGullyHole = MOptionTamalesOaxaquenosAreaFloorItemGullyHole(
            positionX:currentPositionX)
        
        return item
    }
    
    func factoryItemGullyEnd() -> MOptionTamalesOaxaquenosAreaFloorItemGroundGullyEnd
    {
        let textureGround:MGameTexture = randomGroundTexture()
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGullyEnd = MOptionTamalesOaxaquenosAreaFloorItemGroundGullyEnd(
            textureGround:textureGround,
            positionX:currentPositionX)
        
        return item
    }
}
