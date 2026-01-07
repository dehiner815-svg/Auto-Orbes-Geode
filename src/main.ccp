#include <Geode/Geode.hpp>
#include <Geode/modify/PlayerObject.hpp>

using namespace geode::prelude;

class $modify(PlayerObject) {
    void update(float dt) {
        PlayerObject::update(dt);

        // Si el jugador mantiene presionado
        if (this->m_isHolding) {
            auto playLayer = PlayLayer::get();
            if (playLayer) {
                auto objects = playLayer->m_objects;
                
                CCARRAY_FOREACH_ROUTINE(objects, obj, {
                    auto gameObject = static_cast<GameObject*>(obj);
                    
                    // 7 es el tipo de objeto para Orbes/Anillos
                    if (gameObject->m_objectType == GameObjectType::ActivePeripheral) {
                        // Detectar distancia entre jugador y orbe
                        float distance = cocos2d::ccpDistance(this->getPosition(), gameObject->getPosition());
                        
                        // Si está cerca (rango de 50 unidades)
                        if (distance < 50.0f) {
                            playLayer->activateObjectInternal(gameObject, this);
                        }
                    }
                });
            }
        }
    }
};

