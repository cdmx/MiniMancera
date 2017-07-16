import Foundation

class VOptionTamalesOaxaquenosScene:ViewGameScene<MOptionTamalesOaxaquenos>
{
    required init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        super.init(controller:controller)
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryNodes()
    {
        let background:VOptionTamalesOaxaquenosBackground = VOptionTamalesOaxaquenosBackground(
            controller:controller)
        
        let player:VOptionTamalesOaxaquenosPlayer = VOptionTamalesOaxaquenosPlayer(
            controller:controller)
        controller.model.player.view = player
        
        addChild(background)
        
        factoryArea()
        
        addChild(player)
    }
    
    private func factoryArea()
    {
        factoryPerspective()
        factoryFloor()
    }
    
    private func factoryPerspective()
    {
        let items:[MOptionTamalesOaxaquenosAreaPerspectiveItem] = controller.model.area.perspectiveItems
        
        for item:MOptionTamalesOaxaquenosAreaPerspectiveItem in items
        {
            let node:VOptionTamalesOaxaquenosPerspective = VOptionTamalesOaxaquenosPerspective(
                controller:controller,
                model:item)
            
            addChild(node)
        }
    }
    
    private func factoryFloor()
    {
        let items:[MOptionTamalesOaxaquenosAreaFloorItemProtocol] = controller.model.area.floorItems
        
        for item:MOptionTamalesOaxaquenosAreaFloorItemProtocol in items
        {
            guard
                
                let node:ViewGameNode<MOptionTamalesOaxaquenos> = item.factoryNode(
                    controller:controller)
                
            else
            {
                continue
            }
            
            addChild(node)
        }
    }
}
