import SpriteKit

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
        let model:MOptionTamalesOaxaquenos = controller.model
        
        let camera:SKCameraNode = SKCameraNode()
        self.camera = camera
        model.camera.view = camera
        
        let background:VOptionTamalesOaxaquenosBackground = VOptionTamalesOaxaquenosBackground(
            controller:controller)
        
        let player:VOptionTamalesOaxaquenosPlayer = VOptionTamalesOaxaquenosPlayer(
            controller:controller)
        model.player.view = player
        
        let controls:VOptionTamalesOaxaquenosControls = VOptionTamalesOaxaquenosControls(
            controller:controller)

        camera.addChild(background)
        camera.addChild(controls)
        
        factoryArea()
        addChild(camera)
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
